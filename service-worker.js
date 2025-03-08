// service-worker.js - Enhanced for background operation
const CACHE_NAME = 'driver-cache-v4';
const urlsToCache = [
  './',
  './driver.html',
  './manifest.json',
  'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js'
];

// Database for storing location data when offline
let locationDB;

// Initialize IndexedDB for offline data storage
function initDB() {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open('BusTripDatabase', 1);
    
    request.onerror = event => {
      console.error('[SW] IndexedDB error:', event.target.error);
      reject(event.target.error);
    };
    
    request.onupgradeneeded = event => {
      const db = event.target.result;
      // Update store to match bustrip table schema
      const store = db.createObjectStore('bustrips', { autoIncrement: true });
      store.createIndex('recorded_at', 'recorded_at', { unique: false });
      store.createIndex('routeid', 'routeid', { unique: false });
      store.createIndex('busnumber', 'busnumber', { unique: false });
    };
    
    request.onsuccess = event => {
      locationDB = event.target.result;
      console.log('[SW] IndexedDB initialized successfully');
      resolve(locationDB);
    };
  });
}

// Save trip data to IndexedDB
async function saveTripToIndexedDB(tripData) {
  return new Promise((resolve, reject) => {
    const transaction = locationDB.transaction(['bustrips'], 'readwrite');
    const store = transaction.objectStore('bustrips');
    const request = store.add(tripData);
    
    request.onsuccess = () => resolve(request.result);
    request.onerror = event => reject(event.target.error);
  });
}

// Get all stored trips from IndexedDB
async function getStoredTrips() {
  return new Promise((resolve, reject) => {
    const transaction = locationDB.transaction(['bustrips'], 'readonly');
    const store = transaction.objectStore('bustrips');
    const request = store.getAll();
    
    request.onsuccess = () => resolve(request.result);
    request.onerror = event => reject(event.target.error);
  });
}

// Clear trips after successful sync
async function clearStoredTrips() {
  return new Promise((resolve, reject) => {
    const transaction = locationDB.transaction(['bustrips'], 'readwrite');
    const store = transaction.objectStore('bustrips');
    const request = store.clear();
    
    request.onsuccess = () => resolve();
    request.onerror = event => reject(event.target.error);
  });
}

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('[SW] Opened cache');
        // Cache each URL individually to handle failures gracefully
        return Promise.allSettled(
          urlsToCache.map(url => 
            cache.add(url).catch(error => {
              console.warn(`[SW] Failed to cache ${url}:`, error);
            })
          )
        );
      })
      .then(() => initDB())
      .then(() => self.skipWaiting())
      .catch(error => {
        console.error('[SW] Cache installation failed:', error);
      })
  );
});

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.filter(name => name !== CACHE_NAME)
          .map(name => caches.delete(name))
      );
    })
    .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Return cached file or fetch from network if not available
        return response || fetch(event.request);
      })
      .catch(error => {
        console.error('[SW] Fetch error:', error);
        // You might want to return a custom offline page here
      })
  );
});

// Listen for background sync events
self.addEventListener('sync', event => {
  if (event.tag === 'sync-locations') {
    event.waitUntil(syncTrips());
  }
});

// Handle periodic background sync
self.addEventListener('periodicsync', event => {
  if (event.tag === 'location-update') {
    event.waitUntil(recordLocationInBackground());
  }
});

// Periodic background location capturing
async function recordLocationInBackground() {
  try {
    // Get current position in the background
    const position = await new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resolve, reject, { 
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
      });
    });
    
    const now = new Date();
    
    // Create trip data object matching bustrip schema
    const tripData = {
      routeid: await getStoredRouteId(),
      busnumber: await getStoredBusNumber(),
      recorded_at: now.toISOString(),
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    };
    
    // Save trip data to IndexedDB for later sync
    await saveTripToIndexedDB(tripData);
    console.log('[SW] Trip location recorded:', tripData);
    
    // Try to sync immediately if possible
    if (navigator.onLine) {
      await syncTrips();
    }
    
    return true;
  } catch (error) {
    console.error('[SW] Error recording trip location:', error);
    return false;
  }
}

// Update sync function to use bustrip table
async function syncTrips() {
  try {
    if (!navigator.onLine) {
      console.log('[SW] Currently offline, will sync when online');
      return false;
    }
    
    console.log('[SW] Starting trip sync...');
    
    // Get all stored trips
    const trips = await getStoredTrips();
    
    if (trips.length === 0) {
      console.log('[SW] No trips to sync');
      return true;
    }
    
    console.log(`[SW] Syncing ${trips.length} trip locations...`);
    
    // Get Supabase client info
    const clientInfo = await getSupabaseClientInfo();
    
    // Insert trips to Supabase bustrip table
    const response = await fetch(`${clientInfo.supabaseUrl}/rest/v1/bustrip`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': clientInfo.supabaseKey,
        'Authorization': `Bearer ${clientInfo.supabaseKey}`
      },
      body: JSON.stringify(trips)
    });
    
    if (!response.ok) {
      throw new Error(`[SW] HTTP error! status: ${response.status}`);
    }
    
    console.log('[SW] Trips synced successfully');
    
    // Clear synced trips
    await clearStoredTrips();
    
    return true;
  } catch (error) {
    console.error('[SW] Error syncing trips:', error);
    return false;
  }
}

// Get Supabase client info from the main thread
async function getSupabaseClientInfo() {
  const clients = await self.clients.matchAll();
  if (clients.length === 0) {
    return {
      supabaseUrl: 'https://bguwiprkgcxrqauztmvd.supabase.co',
      supabaseKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJndXdpcHJrZ2N4cnFhdXp0bXZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA3ODAxOTksImV4cCI6MjA1NjM1NjE5OX0.ATbtMPiPt8VvtyVBu-gpmDo8Mo1eWy1aFXKfb6m1QsE'
    };
  }
  
  return new Promise((resolve, reject) => {
    const messageChannel = new MessageChannel();
    messageChannel.port1.onmessage = event => resolve(event.data);
    clients[0].postMessage({ type: 'GET_CLIENT_INFO' }, [messageChannel.port2]);
    // Add timeout in case there's no response
    setTimeout(() => {
      reject(new Error('[SW] Timeout getting client info'));
    }, 3000);
  });
}

// Add helper functions to get stored route and bus info
async function getStoredRouteId() {
  try {
    const clients = await self.clients.matchAll();
    if (clients.length > 0) {
      return new Promise((resolve, reject) => {
        const messageChannel = new MessageChannel();
        messageChannel.port1.onmessage = event => resolve(event.data.routeId);
        clients[0].postMessage({ type: 'GET_ROUTE_ID' }, [messageChannel.port2]);
        setTimeout(() => reject(new Error('Timeout getting route ID')), 1000);
      });
    }
  } catch (error) {
    console.error('Error getting route ID:', error);
  }
  return null;
}

async function getStoredBusNumber() {
  try {
    const clients = await self.clients.matchAll();
    if (clients.length > 0) {
      return new Promise((resolve, reject) => {
        const messageChannel = new MessageChannel();
        messageChannel.port1.onmessage = event => resolve(event.data.busNumber);
        clients[0].postMessage({ type: 'GET_BUS_NUMBER' }, [messageChannel.port2]);
        setTimeout(() => reject(new Error('Timeout getting bus number')), 1000);
      });
    }
  } catch (error) {
    console.error('[SW] Error getting bus number:', error);
  }
  return null;
}

// For handling messages from the main thread
self.addEventListener('message', event => {
  if (event.data.type === 'STORE_USER_ID') {
    // Store user ID in service worker scope
    self.userId = event.data.userId;
    console.log('[SW] User ID stored:', self.userId);
    event.ports[0].postMessage({ success: true });
  } else if (event.data.type === 'GET_USER_ID') {
    // Return stored user ID
    event.ports[0].postMessage({ userId: self.userId || generateUUID() });
  } else if (event.data.type === 'RECORD_LOCATION_NOW') {
    // Manually trigger location recording
    event.waitUntil(recordLocationInBackground());
    event.ports[0].postMessage({ success: true });
  }
});