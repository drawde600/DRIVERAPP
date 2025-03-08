CREATE TABLE stops (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  latitude numeric NOT NULL,
  longitude numeric NOT NULL
);

CREATE TABLE waypoint (
  id SERIAL PRIMARY KEY,
  northboundnext INTEGER,
  southboundnext INTEGER,
  waypointname TEXT,
  latitude numeric NOT NULL,
  longitude numeric NOT NULL
);


CREATE TABLE routes (
  id SERIAL PRIMARY KEY,
  routename TEXT NOT NULL,
  direction TEXT NOT NULL CHECK (direction IN ('Southbound','Northbound')),
  origin_stop_id INTEGER REFERENCES stops(id),
  destination_stop_id INTEGER REFERENCES stops(id),
  via TEXT
);


CREATE TABLE bustrip (
    id SERIAL PRIMARY KEY,
    routeid INTEGER REFERENCES routes(id),
    busnumber TEXT NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);


CREATE TABLE routedetails (
    id SERIAL PRIMARY KEY,  -- previously routedetailid
    routename TEXT NOT NULL,
    stopname TEXT NOT NULL,
    direction TEXT
);


-- note that google map provides coordinate lattidue, longtitude 15.288593, 120.024521
INSERT INTO stops (name, latitude, longitude)
VALUES 
  ('Botolan', 15.288492253317065, 120.02699076760898),
  ('Cabangan', 15.158950007821156, 120.05523560254893),
  ('Caloocan', 14.6559, 120.98363),
  ('Candelaria', 15.62573168683713, 119.9331987178321),
  ('Castillejos', 14.93245402764296, 120.20058589588051),
  ('Cubao', 121.048559, 14.624213),
  ('Dinalupihan', 14.86795537845808, 120.46107468109662),
  ('Guagua', 14.984896669528775, 120.62290497610043),
  ('Iba', 15.327628449196542, 119.97651249459808),
  ('Lubao', 14.943359335248768, 120.59321729042367),
  ('Masinloc', 15.53248951905722, 119.95747250440193),
  ('Olongapo', 14.8393683, 120.2842473),
  ('Palauig', 15.433323314529598, 119.91031552595638),
  ('Pasay', 14.5386092, 121.0065615),
  ('Sampaloc', 14.604166, 120.992951),
  ('San Antonio', 14.948069257838915, 120.08983265410943),
  ('San Felipe', 15.05999768236776, 120.07012113304116),
  ('San Fernando', 15.0392772, 120.6830925),
  ('San Marcelino', 14.974016571449534, 120.15576726461656),
  ('San Narciso', 15.015882135424873, 120.0793148173218),
  ('Sta. Cruz', 15.7672199, 119.9091607),
  ('Subic', 14.87757525751956, 120.23483868151483)




INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Cubao Terminal', 121.048559, 14.624213);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner (Pasay Terminal)', 121.0065615, 14.5386092);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Sampaloc Terminal', 120.992951, 14.604166);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Caloocan Terminal', 120.98363, 14.6559);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Bus Terminal - San Fernando', 120.6830925, 15.0392772);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner - Olongapo Terminal', 120.2842473, 14.8393683);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Inc.Iba Zambales', 119.9878284, 15.3198967);

INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Inc.', 119.9091607, 15.7672199);

-- set first southboundnext, start from Sta. Cruz
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Lipay Bridge', 119.9112071, 15.7595827);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'M-Rx Pharmacy', 119.9084051, 15.7422555);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'E4M Bayto Rey''s Hardware Trading', 119.9108659, 15.7255495);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Bayto Barangay Hall', 119.909306, 15.7217787);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Sebastian''s Ukay - Ukay', 119.9180086, 15.7068311);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'MERA CAR AIRCON REPAIR SERVICES', 119.9221101, 15.7048039);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Don Brigido Miraflor Elementary School Sta. Cruz Zambales 106992', 119.9284279, 15.7005193);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'ERRANNIA''S STORE', 119.9338451, 15.6969548);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Querubin Residence - Zambales', 119.9350011, 15.6957885);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'JollyBing Snackhouse', 119.9353325, 15.693422);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Gasalao Store', 119.9348358, 15.6912926);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Malague o Resident', 119.9371112, 15.6873959);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Lencel s Food Corner', 119.9392913, 15.6864543);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Yinglong Steel Corporation', 119.9398628, 15.6858317);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'MENOR STORE', 119.9411473, 15.6810626);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Paul Vulcanizing Shop', 119.9390036, 15.6760839);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'PizSharap Bistro', 119.9354752, 15.6733539);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Butch Sari Sari Store', 119.9350888, 15.66981);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Sinabacan Barangay Hall', 119.9357917, 15.6603128);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Petron', 119.9353037, 15.6579207);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'GMN Trading', 119.9309618, 15.6518875);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Kopi Kubo', 119.9301707, 15.6483745);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'RIZZA STORE', 119.9307822, 15.6445577);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'orange $ cj pet supplies', 119.9350559, 15.6340129);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Centrum Fuel', 119.9335475, 15.6270212);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'CHIONG''S BAKESHOP', 119.9325118, 15.6230481);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Enteng Cheese ''Desal', 119.9325361, 15.6199914);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Centrum FUEL', 119.9327141, 15.6185407);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Black Onyx Candelaria', 119.9379951, 15.6070338);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Ayesha''s Kitchenette', 119.941215, 15.6010742);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Vina Sari Sari Store', 119.9437005, 15.5992585);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Jason Maca', 119.9435357, 15.5981691);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Lauis Bridge', 119.9430462, 15.5966932);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9420756, 15.5940036);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9425217, 15.5930609);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9440804, 15.5919342);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'NANCY STORE', 119.944567, 15.5913387);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Customs masinloc new office', 119.9479968, 15.5827433);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Yna''s Sari-Sari store', 119.9482125, 15.5803787);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9492929, 15.5769512);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9504042, 15.5761061);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Rams', 119.9512609, 15.5751758);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Masinloc', 119.9523407, 15.5736489);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.95263, 15.5729728);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'ZAYAH & JAY''S KITCHENETTE', 119.9528049, 15.5711952);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9525446, 15.5659072);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Feviel''s Travellers Inn', 119.9509332, 15.5616577);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'ATRERO STORE', 119.9462867, 15.5586963);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9459079, 15.5579457);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Happy Feet Nail "Spa"', 119.9457895, 15.5528335);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'LUCKY''S BURGER', 119.9460964, 15.5513836);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Pares Silog tayo', 119.9474776, 15.5478824);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9481736, 15.5473727);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Riley''s Store', 119.9505232, 15.5465596);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9516334, 15.545953);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9520161, 15.5450827);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Moto Rodge Motorcycle Parts & Acessories', 119.9524347, 15.5413565);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Trillana motor part', 119.95276, 15.5391378);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Yongboo s Goto Food house', 119.9531846, 15.5366203);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'ESZ CANTEEN', 119.9537958, 15.5357044);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Joy''s Eatery', 119.9581891, 15.5318579);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'JEDD Eatery', 119.9594798, 15.5304005);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Rayshely''s Goto Mami at iba pa', 119.9608002, 15.5285527);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'JRG''S Bakery', 119.9608782, 15.5275037);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, '3 Angels Sa Sari Sari Store', 119.9608324, 15.5266799);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.960365, 15.525584);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9605913, 15.5252064);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Tindahan ni mommy chie', 119.9628468, 15.5239091);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9646505, 15.5241361);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Froi Trading and Installation Services', 119.9652896, 15.523771);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9659697, 15.5225329);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'De Vera''s Motorcycle Parts Accessories & Services', 119.9681754, 15.5203392);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Impl Project Office-Zambales', 119.9685956, 15.519205);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'GEMMA STORE', 119.9686961, 15.5187947);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.968848, 15.5159126);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9677113, 15.5143998);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'empanada de masinloc', 119.9679358, 15.5135985);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'NOMEL''S STORE', 119.9690397, 15.5108845);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'MIZAL STORE', 119.9695882, 15.5093035);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Friginal Beach Cottage', 119.9698102, 15.5075818);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'CAMBALIZA STORE', 119.9692792, 15.5069452);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9678671, 15.5049733);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9660169, 15.5041177);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9654577, 15.5033116);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Don Ramon Paihaws Masinloc', 119.9639815, 15.499968);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Ganaban Sayao Eatery & Sari-Sari Store', 119.9626136, 15.4964612);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'VIDAL STORE', 119.9615027, 15.489069);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Lorenzo Elementary School', 119.960877, 15.4848365);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'EVELYN STORE', 119.9612839, 15.4799228);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Kilometer 225', 119.9598533, 15.4782346);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Kopi Kubo Kollective Palauig', 119.9596218, 15.4776367);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9602918, 15.4764677);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9609459, 15.4760223);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.961072, 15.4754872);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9615687, 15.4751285);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Pangolingan Forest Park', 119.9642263, 15.4697591);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9647534, 15.4690082);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9658024, 15.4688538);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9663281, 15.4684557);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9680018, 15.46798);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9680178, 15.4675716);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9638481, 15.463519);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9607383, 15.4624657);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9586724, 15.4603751);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9564301, 15.4594134);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.954142, 15.4542107);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9547551, 15.4528342);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.954245, 15.4494826);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9511193, 15.4499051);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9505806, 15.449476);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9504904, 15.4468091);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9479917, 15.4429161);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Palauig Cockpit Arena', 119.945137, 15.4361341);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9446426, 15.435663);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9294819, 15.4380109);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Palauig', 119.910333, 15.433222);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Zgs hardware', 119.9063907, 15.4334358);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9139313, 15.4156878);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9145463, 15.4151106);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9146068, 15.4140349);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9387122, 15.3932301);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Point 34(San Agustin)', 119.9396057, 15.3914267);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9466181, 15.3828022);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9466069, 15.3820097);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9470513, 15.3813126);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9498113, 15.3721814);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9548288, 15.3676932);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.956009, 15.3675536);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.969661, 15.3434239);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Batangas Style', 119.9667322, 15.3377271);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'NELSA STORE', 119.9647281, 15.3320977);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'SantoRosari', 119.9645159, 15.3314694);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9683247, 15.327039);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Dyiiin Deee''s Korean Food Mart', 119.9695331, 15.3283532);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'ADDESSA Iba', 119.9716828, 15.3285525);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'PS Bank', 119.9737679, 15.3287435);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9762496, 15.3276809);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'C-K SIZZLING PULUTAN', 119.9761654, 15.327225);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  119.9814678, 15.3247723);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'IBA CAPITAL TOWN BOUNDARY', 119.9979235, 15.310937);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'New Bancal Bridge', 120.0001458, 15.3093873);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0238146, 15.2919003);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.023658, 15.288651);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0265766, 15.2883509);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0319202, 15.2898358);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0324888, 15.289515);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0365592, 15.2655241);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Bucao Bridge', 120.036862, 15.2640441);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0373103, 15.2614524);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0367723, 15.260739);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0280899, 15.2571112);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.02242, 15.2514478);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0201616, 15.2504179);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0195733, 15.2496658);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0181474, 15.24645);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0160874, 15.2457047);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0141647, 15.2430157);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0158386, 15.2359187);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0196677, 15.2255872);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Panan National High School I.D.301024', 120.0274459, 15.2121701);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Agoho', 120.0280086, 15.2112675);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Daydreamer Cafe & Restaurant', 120.0286896, 15.209512);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Johilda Tailoring', 120.0299363, 15.2054591);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0320101, 15.1989617);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'BJORN''S WATER REFILLING STATION', 120.0538864, 15.1699541);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0553229, 15.1573148);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0523757, 15.1527165);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0518976, 15.1474085);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Butchog''s Chill & Grill', 120.0611576, 15.1214323);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Felipe', 120.0614229, 15.1201589);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'P4 Barangay Maloma', 120.0650211, 15.1075281);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0666818, 15.1013323);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'WELCOME TO BRGY MALOMA SAN FELIPE', 120.0654823, 15.098018);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Linasin resort', 120.0665932, 15.07936);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Felipe Public Market', 120.0697661, 15.0609137);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Marbelyn Nipa Hut Trading', 120.0721621, 15.0525166);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'DEORE AECA''S welding shop', 120.0737213, 15.0458366);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Felipe(end point)', 120.0753358, 15.0372026);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0760004, 15.0336312);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.0806191, 15.0073027);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Narciso Zambales Welcome Ark', 120.0850585, 14.9760211);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Antonio Welcome Arc - Dirita', 120.0854008, 14.9737913);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, '1 on 1 massage therapy San Antonio Zambales', 120.0892133, 14.9516134);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Jolibee San Antonio', 120.0884347, 14.9484129);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'YICHEN''S KITCHEN', 120.0927826, 14.947);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Twinzane Autocare Center', 120.1111533, 14.9552707);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Antonio Welcome Arc', 120.1236222, 14.9610717);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Marcelino Town Welcome Arc', 120.1327823, 14.9652909);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.151433, 14.9738857);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Champs Burger', 120.1558451, 14.9742778);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.1562409, 14.9702483);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'CS3 Aluminum & Glass Supply', 120.1719352, 14.9573637);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Marcelino - Castillejos Boundary', 120.1751232, 14.9545608);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, '7-Eleven Govic Highway', 120.1917748, 14.9413932);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'EVG Juico Pet Care Center', 120.2004704, 14.9340697);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.20109, 14.9298416);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2132734, 14.9276546);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2134419, 14.9275157);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Jdp Sari-Sari Store', 120.2145228, 14.9272509);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Pamatawan Bridge - Castillejos Subic Boundary Bridge', 120.2171542, 14.9258167);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Subic welcome arch', 120.2173219, 14.9256948);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Honda Service Center', 120.2179692, 14.9250989);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2203647, 14.924259);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2269885, 14.9191504);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2290092, 14.9119774);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2298847, 14.909452);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2307844, 14.9078147);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2311167, 14.9064086);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2325615, 14.904487);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2330296, 14.9024909);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, '4Leaf Photography Studio', 120.2349252, 14.9003479);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2382631, 14.8922441);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'd hungry byaheros cafe and minimart', 120.2360293, 14.8848107);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2342787, 14.878082);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Subic', 120.234974, 14.877577);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Wheeltek Subic', 120.2354774, 14.8689342);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2347102, 14.8671876);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Costa Del Subic', 120.2346313, 14.864924);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2349559, 14.8639278);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2351224, 14.8630176);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2419368, 14.8612601);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2451713, 14.8589522);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2444436, 14.8555698);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.246212, 14.8536023);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Subic - Olongapo Border Arch', 120.254574, 14.851941);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2547774, 14.8519081);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.258237, 14.8512793);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2626559, 14.8511595);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2689473, 14.846359);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2688962, 14.8456504);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2689337, 14.8449783);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.268545, 14.8439958);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2681695, 14.8436133);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2683357, 14.842934);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2681695, 14.842374);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2671088, 14.8412601);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2672127, 14.8408438);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2673683, 14.8404341);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2673039, 14.8399944);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2682961, 14.8389648);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2697606, 14.8387211);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2711342, 14.8362386);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2709501, 14.8347271);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2702152, 14.8339037);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2696787, 14.8334473);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2692493, 14.8328962);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Amy Bonzai Store', 120.2696408, 14.8317324);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2687001, 14.8309982);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2685312, 14.830703);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2676944, 14.8299199);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2678584, 14.8296551);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2681454, 14.8294943);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2680734, 14.8285858);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2684115, 14.828053);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2682457, 14.8274164);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2685071, 14.8269271);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.268483, 14.8264536);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2681092, 14.8259555);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2680407, 14.825439);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2683519, 14.8251615);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2692343, 14.8257605);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2700135, 14.8264854);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.27141, 14.8273301);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2717505, 14.8281144);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2724929, 14.8287934);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2733428, 14.8303774);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.273776, 14.8306419);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2746637, 14.8308276);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'CJ''s Barber Shop', 120.2757494, 14.8331855);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2768536, 14.8347765);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'AIMSMART OLONGAPO', 120.2780278, 14.8363611);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2801693, 14.8394934);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Na-Nai Tzhol', 120.2807261, 14.8397992);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2829574, 14.8392793);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Arlene''s Foreign Exchange Dealer & Money Changer - Branch 1', 120.2834539, 14.8396746);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2841651, 14.8402931);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2845344, 14.839882);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2841175, 14.8394944);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner - Olongapo Terminal', 120.2842473, 14.8393683);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2840958, 14.8389358);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2842782, 14.8389072);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2843882, 14.8387672);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2844847, 14.8389746);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'KIKOSAN', 120.2868385, 14.8411832);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2903173, 14.8444842);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2929835, 14.8468659);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'BIGAS GAPO EXPRESS', 120.2951833, 14.8471342);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.2972138, 14.8475793);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3006521, 14.8499028);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3018047, 14.8497808);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3033475, 14.8500122);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3071396, 14.8482097);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner Olongapo', 120.309112, 14.848353);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Orly and Sol Store', 120.311507, 14.848494);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3129844, 14.8488944);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3138946, 14.8490212);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3152705, 14.8497685);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3161357, 14.8496181);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3168921, 14.8496648);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3180442, 14.8489938);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3190106, 14.8492315);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3194914, 14.8486991);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3207306, 14.8479213);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.322006, 14.8483596);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3224368, 14.8482506);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3225923, 14.847924);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Yolly Store', 120.3222277, 14.8468162);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.322761, 14.8459629);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'LIZ STORE', 120.3244169, 14.8460205);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Elsan Store', 120.3248059, 14.8468191);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3246957, 14.8475992);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Marlon Videoke Rental', 120.3238545, 14.8483847);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.323804, 14.848947);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3242358, 14.8491855);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3247968, 14.8490647);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Erlinda Edquiban', 120.3252661, 14.8484633);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3258402, 14.8486348);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.326021, 14.8495791);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3282075, 14.850351);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3296767, 14.8504242);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'BOLAGAO STORE', 120.3319243, 14.8495517);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.333072, 14.8503201);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3340203, 14.8524732);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3343073, 14.852201);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3339022, 14.8515547);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.334031, 14.8510045);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3347658, 14.8499809);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3349488, 14.8492456);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3348146, 14.8483301);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3350753, 14.8479573);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Bautista Store', 120.3356294, 14.8479118);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3373614, 14.8487492);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Zambales - Bataan Provincial Boundary', 120.3385493, 14.8482648);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'From The Roots', 120.3387452, 14.8472303);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3390314, 14.846134);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3397181, 14.8460302);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3404745, 14.8463077);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'MDP STORE', 120.3405951, 14.8470649);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3412916, 14.8475505);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3413492, 14.8487461);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.341059, 14.8491481);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3411462, 14.8493517);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3413688, 14.8492791);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3423098, 14.8478919);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3422633, 14.8470226);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3424848, 14.8468061);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3434973, 14.8468035);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3442732, 14.847533);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3446639, 14.8464277);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3443774, 14.8455718);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3456096, 14.8450271);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3479481, 14.845607);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3491513, 14.8471461);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3500257, 14.8473855);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3543662, 14.8470533);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3575214, 14.8450602);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3586851, 14.8454124);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3600638, 14.8462421);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3638379, 14.8469395);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3671826, 14.851137);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3691809, 14.8520735);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3713548, 14.8539028);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3722024, 14.8534465);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.373238, 14.8515107);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3744186, 14.8513885);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Boomalen Poultry Supply', 120.3775981, 14.851907);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.379829, 14.8532509);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.383362, 14.8509575);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3858751, 14.8519979);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.386884, 14.8517693);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3878682, 14.8496561);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3887744, 14.8493315);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.3908615, 14.8503077);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.394815, 14.8478578);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4016772, 14.8479807);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4038589, 14.8457547);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4136157, 14.8476576);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4201254, 14.846837);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4435768, 14.8630315);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4586812, 14.8678121);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Dinalupihan', 120.461149, 14.868024);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Cebuana Lhuillier Pawnshop - Dinalupihan 3', 120.4647011, 14.8672556);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.468238, 14.8649079);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4701778, 14.8622768);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'World War II Last Stand Memorial', 120.4738321, 14.8537549);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.4981508, 14.8693074);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Lubao pampanga Arc', 120.4997023, 14.8701545);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'PTT Gas Station (PTT Lubao 2)', 120.5877829, 14.9268718);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Napunads - pasbul highway', 120.5907686, 14.9334833);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Total (Lubao 1)', 120.5983476, 14.9608161);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.5998671, 14.9635085);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6015345, 14.9660478);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6038075, 14.9688377);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6038705, 14.968852);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6065698, 14.9714738);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6066157, 14.9715392);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6211241, 14.9833639);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6212472, 14.9834368);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6239697, 14.9856478);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6240422, 14.9857352);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.669072, 15.0214374);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6710086, 15.023572);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6746235, 15.0291162);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6746899, 15.0291357);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.676255, 15.0319571);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6762432, 15.0320517);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6797904, 15.0377546);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6799185, 15.0378589);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, NULL,  120.6821185, 15.0400508);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Victory Liner', 120.6822784, 15.0398398);


INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Botolan', 15.288492253317065, 120.02699076760898);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Cabangan', 15.158950007821156, 120.05523560254893);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Caloocan', 14.6559, 120.98363);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Candelaria', 15.62573168683713, 119.9331987178321);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Castillejos', 14.93245402764296, 120.20058589588051);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Cubao', 121.048559, 14.624213);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Dinalupihan', 14.86795537845808, 120.46107468109662);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Guagua', 14.984896669528775, 120.62290497610043);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Iba', 15.327628449196542, 119.97651249459808);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Lubao', 14.943359335248768, 120.59321729042367);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Masinloc', 15.53248951905722, 119.95747250440193);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Olongapo', 14.8393683, 120.2842473);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Palauig', 15.433323314529598, 119.91031552595638);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Pasay', 14.5386092, 121.0065615);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Sampaloc', 14.604166, 120.992951);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Antonio', 14.948069257838915, 120.08983265410943);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Felipe', 15.05999768236776, 120.07012113304116);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Fernando', 15.0392772, 120.6830925);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Marcelino', 14.974016571449534, 120.15576726461656);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'San Narciso', 15.015882135424873, 120.0793148173218);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Sta. Cruz', 15.7672199, 119.9091607);
INSERT INTO waypoint (northboundnext, southboundnext, waypointname, longitude, latitude) VALUES (NULL, NULL, 'Subic', 14.87757525751956, 120.23483868151483);







INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Olongapo',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Olongapo'),
  'Standard'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Pasay (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Pasay'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Caloocan (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Sampaloc (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Cubao (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Cubao'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Pasay (via San Fernando)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Pasay'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Caloocan (via San Fernando)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Sampaloc (via San Fernando)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Iba -> Cubao (via San Fernando)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Iba'),
  (SELECT id FROM stops WHERE name = 'Cubao'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Olongapo',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Olongapo'),
  'Standard'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Pasay (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Pasay'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Caloocan (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Sampaloc (Express)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Pasay (via San Fernando)', 
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Pasay'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Caloocan (via San Fernando)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sta. Cruz -> Sampaloc (via San Fernando)',
  'Southbound',
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  'via San Fernando'
);

-- Northbound Routes
INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Olongapo → Iba',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Olongapo'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'Standard'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Pasay → Iba (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Pasay'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Caloocan → Iba (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sampaloc → Iba (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Cubao → Iba (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Cubao'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Pasay → Iba (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Pasay'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Caloocan → Iba (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sampaloc → Iba (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Cubao → Iba (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Cubao'),
  (SELECT id FROM stops WHERE name = 'Iba'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Olongapo → Sta. Cruz',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Olongapo'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'Standard'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Pasay → Sta. Cruz (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Pasay'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Caloocan → Sta. Cruz (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'Express'
);


INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sampaloc → Sta. Cruz (Express)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'Express'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Pasay → Sta. Cruz (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Pasay'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Caloocan → Sta. Cruz (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Caloocan'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'via San Fernando'
);

INSERT INTO routes (routename, direction, origin_stop_id, destination_stop_id, via)
VALUES (
  'Sampaloc → Sta. Cruz (via San Fernando)',
  'Northbound',
  (SELECT id FROM stops WHERE name = 'Sampaloc'),
  (SELECT id FROM stops WHERE name = 'Sta. Cruz'),
  'via San Fernando'
);






INSERT INTO routedetails (routename, stopname, direction) VALUES
('Iba -> Olongapo', 'Olongapo', 'Southbound'), 
('Iba -> Olongapo', 'Subic', 'Southbound'), 
('Iba -> Olongapo', 'Castillejos', 'Southbound'), 
('Iba -> Olongapo', 'San Marcelino', 'Southbound'), 
('Iba -> Olongapo', 'San Antonio', 'Southbound'), 
('Iba -> Olongapo', 'San Narciso', 'Southbound'), 
('Iba -> Olongapo', 'San Felipe', 'Southbound'), 
('Iba -> Olongapo', 'Cabangan', 'Southbound'), 
('Iba -> Olongapo', 'Botolan', 'Southbound'), 
('Iba -> Olongapo', 'Iba', 'Southbound'), 

('Iba -> Pasay (Express)', 'Pasay', 'Southbound'), 
('Iba -> Pasay (Express)', 'Olongapo', 'Southbound'), 
('Iba -> Pasay (Express)', 'Subic', 'Southbound'), 
('Iba -> Pasay (Express)', 'Castillejos', 'Southbound'), 
('Iba -> Pasay (Express)', 'San Marcelino', 'Southbound'), 
('Iba -> Pasay (Express)', 'San Antonio', 'Southbound'), 
('Iba -> Pasay (Express)', 'San Narciso', 'Southbound'), 
('Iba -> Pasay (Express)', 'San Felipe', 'Southbound'), 
('Iba -> Pasay (Express)', 'Cabangan', 'Southbound'), 
('Iba -> Pasay (Express)', 'Botolan', 'Southbound'), 
('Iba -> Pasay (Express)', 'Iba', 'Southbound'), 

('Iba -> Caloocan (Express)', 'Caloocan', 'Southbound'), 
('Iba -> Caloocan (Express)', 'Olongapo', 'Southbound'), 
('Iba -> Caloocan (Express)', 'Subic', 'Southbound'), 
('Iba -> Caloocan (Express)', 'Castillejos', 'Southbound'), 
('Iba -> Caloocan (Express)', 'San Marcelino', 'Southbound'), 
('Iba -> Caloocan (Express)', 'San Antonio', 'Southbound'), 
('Iba -> Caloocan (Express)', 'San Narciso', 'Southbound'), 
('Iba -> Caloocan (Express)', 'San Felipe', 'Southbound'), 
('Iba -> Caloocan (Express)', 'Cabangan', 'Southbound'), 
('Iba -> Caloocan (Express)', 'Botolan', 'Southbound'), 
('Iba -> Caloocan (Express)', 'Iba', 'Southbound'), 

('Iba -> Sampaloc (Express)', 'Sampaloc', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Valenzuela', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Olongapo', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Subic', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Castillejos', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'San Marcelino', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'San Antonio', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'San Narciso', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'San Felipe', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Cabangan', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Botolan', 'Southbound'), 
('Iba -> Sampaloc (Express)', 'Iba', 'Southbound'), 

('Iba -> Cubao (Express)', 'Cubao', 'Southbound'), 
('Iba -> Cubao (Express)', 'Olongapo', 'Southbound'), 
('Iba -> Cubao (Express)', 'Subic', 'Southbound'), 
('Iba -> Cubao (Express)', 'Castillejos', 'Southbound'), 
('Iba -> Cubao (Express)', 'San Marcelino', 'Southbound'), 
('Iba -> Cubao (Express)', 'San Antonio', 'Southbound'), 
('Iba -> Cubao (Express)', 'San Narciso', 'Southbound'), 
('Iba -> Cubao (Express)', 'San Felipe', 'Southbound'), 
('Iba -> Cubao (Express)', 'Cabangan', 'Southbound'), 
('Iba -> Cubao (Express)', 'Botolan', 'Southbound'), 
('Iba -> Cubao (Express)', 'Iba', 'Southbound'), 

('Iba -> Pasay (via San Fernando)', 'Pasay', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'San Fernando', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Guagua', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Lubao', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Dinalupihan', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Olongapo', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Subic', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Castillejos', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'San Marcelino', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'San Antonio', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'San Narciso', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'San Felipe', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Cabangan', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Botolan', 'Southbound'), 
    ('Iba -> Pasay (via San Fernando)', 'Iba', 'Southbound'), 

    ('Iba -> Caloocan (via San Fernando)', 'Caloocan', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'San Fernando', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Guagua', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Lubao', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Dinalupihan', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Olongapo', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Subic', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Castillejos', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'San Marcelino', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'San Antonio', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'San Narciso', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'San Felipe', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Cabangan', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Botolan', 'Southbound'), 
    ('Iba -> Caloocan (via San Fernando)', 'Iba', 'Southbound'), 

    ('Iba -> Sampaloc (via San Fernando)', 'Sampaloc', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Valenzuela', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'San Fernando', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Guagua', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Lubao', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Dinalupihan', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Olongapo', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Subic', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Castillejos', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'San Marcelino', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'San Antonio', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'San Narciso', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'San Felipe', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Cabangan', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Botolan', 'Southbound'), 
    ('Iba -> Sampaloc (via San Fernando)', 'Iba', 'Southbound'), 

    ('Iba -> Cubao (via San Fernando)', 'Cubao', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'San Fernando', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Guagua', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Lubao', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Dinalupihan', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Olongapo', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Subic', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Castillejos', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'San Marcelino', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'San Antonio', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'San Narciso', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'San Felipe', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Cabangan', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Botolan', 'Southbound'), 
    ('Iba -> Cubao (via San Fernando)', 'Iba', 'Southbound'), 

    ('Sta. Cruz -> Olongapo', 'Olongapo', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Subic', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Castillejos', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'San Marcelino', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'San Antonio', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'San Narciso', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'San Felipe', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Cabangan', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Botolan', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Iba', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Palauig', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Masinloc', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Candelaria', 'Southbound'), 
    ('Sta. Cruz -> Olongapo', 'Sta. Cruz', 'Southbound'), 

    ('Sta. Cruz -> Pasay (Express)', 'Pasay', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Olongapo', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Subic', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Castillejos', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'San Marcelino', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'San Antonio', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'San Narciso', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'San Felipe', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Cabangan', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Botolan', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Iba', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Palauig', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Masinloc', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Candelaria', 'Southbound'), 
    ('Sta. Cruz -> Pasay (Express)', 'Sta. Cruz', 'Southbound'), 

    ('Sta. Cruz -> Caloocan (Express)', 'Caloocan', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Olongapo', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Subic', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Castillejos', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'San Marcelino', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'San Antonio', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'San Narciso', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'San Felipe', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Cabangan', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Botolan', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Iba', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Palauig', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Masinloc', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Candelaria', 'Southbound'), 
    ('Sta. Cruz -> Caloocan (Express)', 'Sta. Cruz', 'Southbound'), 

    ('Sta. Cruz -> Sampaloc (Express)', 'Sampaloc', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Valenzuela', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Olongapo', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Subic', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Castillejos', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'San Marcelino', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'San Antonio', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'San Narciso', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'San Felipe', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Cabangan', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Botolan', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Iba', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Palauig', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Masinloc', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Candelaria', 'Southbound'), 
    ('Sta. Cruz -> Sampaloc (Express)', 'Sta. Cruz', 'Southbound'), 

    ('Sta. Cruz -> Pasay (via San Fernando)', 'Pasay', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'San Fernando', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Guagua', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Lubao', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Dinalupihan', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Olongapo', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Subic', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Castillejos', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'San Marcelino', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'San Antonio', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'San Narciso', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'San Felipe', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Cabangan', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Botolan', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Iba', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Palauig', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Masinloc', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Candelaria', 'Southbound'), 
('Sta. Cruz -> Pasay (via San Fernando)', 'Sta. Cruz', 'Southbound'), 


('Sta. Cruz -> Caloocan (via San Fernando)', 'Caloocan', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Guagua', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Lubao', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Dinalupihan', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Olongapo', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Subic', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Castillejos', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'San Marcelino', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'San Antonio', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'San Narciso', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'San Felipe', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Cabangan', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Botolan', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Iba', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Palauig', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Masinloc', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Candelaria', 'Southbound'), 
('Sta. Cruz -> Caloocan (via San Fernando)', 'Sta. Cruz', 'Southbound'), 

('Sta. Cruz -> Sampaloc (via San Fernando)', 'Sampaloc', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Valenzuela', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'San Fernando', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Guagua', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Lubao', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Dinalupihan', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Olongapo', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Subic', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Castillejos', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'San Marcelino', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'San Antonio', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'San Narciso', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'San Felipe', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Cabangan', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Botolan', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Iba', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Palauig', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Masinloc', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Candelaria', 'Southbound'), 
('Sta. Cruz -> Sampaloc (via San Fernando)', 'Sta. Cruz', 'Southbound'), 

('Olongapo → Iba', 'Iba', 'Northbound'), 
('Olongapo → Iba', 'Botolan', 'Northbound'), 
('Olongapo → Iba', 'Cabangan', 'Northbound'), 
('Olongapo → Iba', 'San Felipe', 'Northbound'), 
('Olongapo → Iba', 'San Narciso', 'Northbound'), 
('Olongapo → Iba', 'San Antonio', 'Northbound'), 
('Olongapo → Iba', 'San Marcelino', 'Northbound'), 
('Olongapo → Iba', 'Castillejos', 'Northbound'), 
('Olongapo → Iba', 'Subic', 'Northbound'), 
('Olongapo → Iba', 'Olongapo', 'Northbound'), 

('Pasay → Iba (Express)', 'Iba', 'Northbound'), 
('Pasay → Iba (Express)', 'Botolan', 'Northbound'), 
('Pasay → Iba (Express)', 'Cabangan', 'Northbound'), 
('Pasay → Iba (Express)', 'San Felipe', 'Northbound'), 
('Pasay → Iba (Express)', 'San Narciso', 'Northbound'), 
('Pasay → Iba (Express)', 'San Antonio', 'Northbound'), 
('Pasay → Iba (Express)', 'San Marcelino', 'Northbound'), 
('Pasay → Iba (Express)', 'Castillejos', 'Northbound'), 
('Pasay → Iba (Express)', 'Subic', 'Northbound'), 
('Pasay → Iba (Express)', 'Olongapo', 'Northbound'), 
('Pasay → Iba (Express)', 'Pasay', 'Northbound'), 

('Caloocan → Iba (Express)', 'Iba', 'Northbound'), 
('Caloocan → Iba (Express)', 'Botolan', 'Northbound'), 
('Caloocan → Iba (Express)', 'Cabangan', 'Northbound'), 
('Caloocan → Iba (Express)', 'San Felipe', 'Northbound'), 
('Caloocan → Iba (Express)', 'San Narciso', 'Northbound'), 
('Caloocan → Iba (Express)', 'San Antonio', 'Northbound'), 
('Caloocan → Iba (Express)', 'San Marcelino', 'Northbound'), 
('Caloocan → Iba (Express)', 'Castillejos', 'Northbound'), 
('Caloocan → Iba (Express)', 'Subic', 'Northbound'), 
('Caloocan → Iba (Express)', 'Olongapo', 'Northbound'), 
('Caloocan → Iba (Express)', 'Caloocan', 'Northbound'), 

('Sampaloc → Iba (Express)', 'Iba', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Botolan', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Cabangan', 'Northbound'), 
('Sampaloc → Iba (Express)', 'San Felipe', 'Northbound'), 
('Sampaloc → Iba (Express)', 'San Narciso', 'Northbound'), 
('Sampaloc → Iba (Express)', 'San Antonio', 'Northbound'), 
('Sampaloc → Iba (Express)', 'San Marcelino', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Castillejos', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Subic', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Olongapo', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Valenzuela', 'Northbound'), 
('Sampaloc → Iba (Express)', 'Sampaloc', 'Northbound'), 

('Cubao → Iba (Express)', 'Iba', 'Northbound'), 
('Cubao → Iba (Express)', 'Botolan', 'Northbound'), 
('Cubao → Iba (Express)', 'Cabangan', 'Northbound'), 
('Cubao → Iba (Express)', 'San Felipe', 'Northbound'), 
('Cubao → Iba (Express)', 'San Narciso', 'Northbound'), 
('Cubao → Iba (Express)', 'San Antonio', 'Northbound'), 
('Cubao → Iba (Express)', 'San Marcelino', 'Northbound'), 
('Cubao → Iba (Express)', 'Castillejos', 'Northbound'), 
('Cubao → Iba (Express)', 'Subic', 'Northbound'), 
('Cubao → Iba (Express)', 'Olongapo', 'Northbound'), 
('Cubao → Iba (Express)', 'Cubao', 'Northbound'), 


('Pasay → Iba (via San Fernando)', 'Iba', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Botolan', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Cabangan', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'San Felipe', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'San Narciso', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'San Antonio', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Castillejos', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Subic', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Olongapo', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'San Fernando', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Lubao', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Guagua', 'Northbound'), 
('Pasay → Iba (via San Fernando)', 'Pasay', 'Northbound'), 

('Caloocan → Iba (via San Fernando)', 'Iba', 'Northbound'),  
('Caloocan → Iba (via San Fernando)', 'Cabangan', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'San Felipe', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'San Narciso', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'San Antonio', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Castillejos', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Subic', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Olongapo', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'San Fernando', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Lubao', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Guagua', 'Northbound'), 
('Caloocan → Iba (via San Fernando)', 'Caloocan', 'Northbound'), 

('Sampaloc → Iba (via San Fernando)', 'Iba', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Botolan', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Cabangan', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'San Felipe', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'San Narciso', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'San Antonio', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Castillejos', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Subic', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Olongapo', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Lubao', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Guagua', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'San Fernando', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Valenzuela', 'Northbound'), 
('Sampaloc → Iba (via San Fernando)', 'Sampaloc', 'Northbound'), 

('Cubao → Iba (via San Fernando)', 'Iba', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Botolan', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Cabangan', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'San Felipe', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'San Narciso', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'San Antonio', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Castillejos', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Subic', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Olongapo', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Lubao', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Guagua', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'San Fernando', 'Northbound'), 
('Cubao → Iba (via San Fernando)', 'Cubao', 'Northbound'), 


('Olongapo → Sta. Cruz', 'Sta. Cruz', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Candelaria', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Masinloc', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Palauig', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Iba', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Botolan', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Cabangan', 'Northbound'), 
('Olongapo → Sta. Cruz', 'San Felipe', 'Northbound'), 
('Olongapo → Sta. Cruz', 'San Narciso', 'Northbound'), 
('Olongapo → Sta. Cruz', 'San Antonio', 'Northbound'), 
('Olongapo → Sta. Cruz', 'San Marcelino', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Castillejos', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Subic', 'Northbound'), 
('Olongapo → Sta. Cruz', 'Olongapo', 'Northbound'), 

('Pasay → Sta. Cruz (Express)', 'Sta. Cruz', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Candelaria', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Masinloc', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Palauig', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Iba', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Botolan', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Cabangan', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'San Felipe', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'San Narciso', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'San Antonio', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'San Marcelino', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Castillejos', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Subic', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Olongapo', 'Northbound'), 
('Pasay → Sta. Cruz (Express)', 'Pasay', 'Northbound'), 

('Caloocan → Sta. Cruz (Express)', 'Sta. Cruz', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Candelaria', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Masinloc', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Palauig', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Iba', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Botolan', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Cabangan', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'San Felipe', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'San Narciso', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'San Antonio', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'San Marcelino', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Castillejos', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Subic', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Olongapo', 'Northbound'), 
('Caloocan → Sta. Cruz (Express)', 'Caloocan', 'Northbound'), 

('Sampaloc → Sta. Cruz (Express)', 'Sta. Cruz', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Candelaria', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Masinloc', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Palauig', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Iba', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Botolan', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Cabangan', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'San Felipe', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'San Narciso', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'San Antonio', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'San Marcelino', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Castillejos', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Subic', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Olongapo', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Valenzuela', 'Northbound'), 
('Sampaloc → Sta. Cruz (Express)', 'Sampaloc', 'Northbound'), 

('Pasay → Sta. Cruz (via San Fernando)', 'Sta. Cruz', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Candelaria', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Masinloc', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Palauig', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Iba', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Botolan', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Cabangan', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'San Felipe', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'San Narciso', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'San Antonio', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Castillejos', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Subic', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Olongapo', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Lubao', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Guagua', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'San Fernando', 'Northbound'), 
('Pasay → Sta. Cruz (via San Fernando)', 'Pasay', 'Northbound'), 

('Caloocan → Sta. Cruz (via San Fernando)', 'Sta. Cruz', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Candelaria', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Masinloc', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Palauig', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Iba', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Botolan', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Cabangan', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'San Felipe', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'San Narciso', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'San Antonio', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Castillejos', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Subic', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Olongapo', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Lubao', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Guagua', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'San Fernando', 'Northbound'), 
('Caloocan → Sta. Cruz (via San Fernando)', 'Caloocan', 'Northbound'), 

('Sampaloc → Sta. Cruz (via San Fernando)', 'Sta. Cruz', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Candelaria', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Masinloc', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Palauig', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Iba', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Botolan', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Cabangan', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'San Felipe', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'San Narciso', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'San Antonio', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'San Marcelino', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Castillejos', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Subic', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Olongapo', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Dinalupihan', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Lubao', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Guagua', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'San Fernando', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Valenzuela', 'Northbound'), 
('Sampaloc → Sta. Cruz (via San Fernando)', 'Sampaloc', 'Northbound');

