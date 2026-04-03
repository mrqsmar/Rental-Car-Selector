-- Rental Car Selector Database Schema

CREATE DATABASE IF NOT EXISTS rental_car_selector;
USE rental_car_selector;

DROP TABLE IF EXISTS vehicle_models;
DROP TABLE IF EXISTS vehicle_classes;

CREATE TABLE vehicle_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(5) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    category ENUM('economy', 'standard', 'premium', 'luxury', 'suv', 'truck', 'van', 'specialty') NOT NULL,
    is_luxury BOOLEAN DEFAULT FALSE,
    max_passengers INT NOT NULL DEFAULT 5,
    description TEXT NOT NULL,
    recommendation TEXT NOT NULL
);

CREATE TABLE vehicle_models (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(100) NOT NULL,
    trim_level VARCHAR(50),
    is_recommended BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (class_id) REFERENCES vehicle_classes(id) ON DELETE CASCADE
);

-- Seed vehicle classes
INSERT INTO vehicle_classes (code, name, category, is_luxury, max_passengers, description, recommendation) VALUES
('A', 'City Car', 'economy', FALSE, 4, 'You have chosen an Economy Car. Therefore you will be getting a Chevrolet Spark 1LT or a Mitsubishi Mirage. If they let you pick, take the Spark, but usually you will get upgraded to a Midsized (C) car.', 'The Spark beats out the Mirage because the Spark feels more modern and the Mirage is rated one of the worst cars according to multiple journalists in the automotive industry.'),
('B', 'Little Car', 'economy', FALSE, 5, 'You have chosen a Small Car. Therefore you will be getting a Chevrolet Sonic LT, Ford Fiesta SE, Toyota Yaris or Nissan Versa SV.', 'Most likely, you will end up with a Versa as they are very popular and quite good cars, I would take a Versa if I was you since it recently has been redesigned. The Sonic, Yaris and Fiesta are extremely dated. All are somewhat sporty options.'),
('C', 'Mid-size Car', 'economy', FALSE, 5, 'You have chosen an Intermediate/Mid-Size Car. Therefore you will be getting a Honda Civic LX, Hyundai Elantra SE, Nissan Sentra SV, Toyota Corolla LE, or Subaru Impreza.', 'Most likely, you will end up with a Corolla, however if they let you, take the Civic, it has a bit more features and its got a more powerful engine. The Corolla is a great car, but its pretty bland.'),
('D', 'Standard Car', 'standard', FALSE, 5, 'You have chosen a Standard Car. Options in this class include VW Jetta SE, Kia Soul S and Kia Forte LXS.', 'Most of the time though, rental car companies will upgrade you to a Full-Size sedan, but take the Jetta if you can, it has Leather and Heated Seats.'),
('E', 'Hybrid Car', 'economy', FALSE, 5, 'You have chosen a hybrid car. Economic cars that are chosen are the Toyota Prius Eco, Hyundai Ioniq Hybrid, and Kia Niro Hybrid.', 'I would honestly pick the Prius, it gets the best gas mileage and is the most practical.'),
('E6', 'Electric Car', 'economy', FALSE, 5, 'You have chosen an electric car. Unfortunately this class of car tends to be phasing out due to rental car agencies selling out their electric cars due to the vast amount of customers having troubles with charging, being left stranded and some caught on fire.', 'If you are really stringent on an electric vehicle, I would take the Ioniq5. It has more range than a Tesla Model Y, and the car is significantly more reliable. Don''t pick the Bolt, its got severe range anxiety.'),
('F', 'Full Size Car', 'standard', FALSE, 5, 'You have chosen a Full-Size Sedan. The most common vehicle is the Chevrolet Malibu. Other options include Toyota Camry SE, Hyundai Sonata SEL, Nissan Altima, Ford Fusion, Mazda6 and VW Passat SE.', 'The Malibu is not very reliable, and you should pick the Toyota Camry SE or Hyundai Sonata SEL. These two are much nicer and are more reliable.'),
('G', 'Premium Car', 'premium', FALSE, 5, 'You have selected a Premium Car! This class involves the Chevrolet Impala LS, Chrysler 300, Dodge Charger SE, Honda Accord Hybrid, Nissan Maxima SV, Toyota Avalon XLE, and Toyota Crown XLE.', 'I would pick the Crown or Avalon. Crown for efficiency or Avalon for a bit more power. The Chrysler 300/Dodge Charger are essentially twins that are being outdated.'),
('P4', 'Compact Luxury Car', 'luxury', TRUE, 5, 'You have chosen a Compact Luxury Car. Cars in this segment are entry level luxury and are decently equipped.', 'My pick would be the Giulia or the A4. The Giulia is a very rare car, and handles corners and accelerates very well. The A4 is much more luxurious and has a beautiful interior.'),
('G4', 'Midsize Luxury Car', 'luxury', TRUE, 5, 'Ah yes, you have picked the Midsize Luxury Car class. What luxury... This class doesn''t have too many cars but they''re all pretty good.', 'I would pick the 530i. Its the combination of Sport, Luxury and class. The CT5 has the most features but the car is heavy and not super sporty.'),
('O4', 'Fullsize Luxury Car', 'luxury', TRUE, 5, 'You have reached the epitome of luxury, the only car that you can get is the BMW 745i.', 'This is a great car, and is the most luxurious car rental cars can offer. Luxurious, beautiful, and serene are the adjectives describing it.'),
('V4', 'Muscle Coupe', 'specialty', FALSE, 4, 'You have landed at the Muscle Car group. These cars range from the classic 3: Chevy Camaro, Dodge Challenger and Ford Mustang.', 'All 3 are honestly kind of the same, but I would try to get a V8 model. I would go with the Mustang or Camaro since the Challenger is a pain to park.'),
('V', 'Offroad', 'specialty', FALSE, 5, 'Time to go offroad with the Jeep Wrangler or Toyota 4Runner!', 'I would pick the Wrangler over the 4Runner because you can take all the panels off of it. The Wrangler comes in all sorts of trims.'),
('Q4', 'Small SUV', 'suv', FALSE, 5, 'You have chosen a Small SUV. These SUVs consist of the Chevy Trax, Honda HR-V, Hyundai Kona, Mazda CX-30 Select, Toyota Corolla Cross LE, Mitsubishi Outlander Sport, and VW Taos.', 'I would go with the CX-30. The rest of the options are very boring, especially the Trax and HR-V. But the CX-30 is more luxurious and also zips places pretty fast.'),
('L', '5 Passenger SUV', 'suv', FALSE, 5, 'You have reached the most popular class of car. The 5 Passenger SUV class, you can choose from so many cars.', 'I would pick from either the Mazda offerings, the Nissan Rogue and the CR-V. The Mazda packs a lot of features, the Nissan Rogue is the all around go getter, and the CR-V is the most utilitarian.'),
('L4', '7 Passenger SUV', 'suv', FALSE, 7, 'The 7 passenger class is one where you wanna haul a family but don''t wanna be seen in a Minivan.', 'Take the Durango, why? Because its got a huge HEMI V8. This car will make everyone in your household have so much fun and the car is well equipped with Leather, Heated/Cooled seats and has very good practicality.'),
('T', 'Large SUV', 'suv', FALSE, 8, 'You have hit the Large SUV class. These get pretty bad fuel economy but tend to be more spacious and have more space than a typical 7 passenger SUV.', 'I would go with the Wagoneer. Its got the most features, and its the biggest so you are able to fill the car up with a bunch of stuff.'),
('T6', 'Extended SUV', 'suv', FALSE, 9, 'You have hit the Extended SUV class. These get pretty bad fuel economy but tend to be more spacious than a typical 7 passenger SUV, but more than a Large SUV.', 'I would go with the Wagoneer L. Its got the most features, and its the biggest so you are able to fill the car up with a bunch of stuff.'),
('H4', 'Compact Luxury SUV', 'luxury', TRUE, 5, 'The Compact Luxury SUV class is interesting, there aren''t too many offerings but there is one that I would like to note.', 'I would probably go with the Audi Q5. The Q5 is the most luxurious and comes with a roof rack with rails if you need to haul stuff. It also has the nicest interior of the bunch.'),
('K4', 'Midsize Luxury SUV', 'luxury', TRUE, 7, 'The Midsize Luxury SUV class has so many great options that you will be able to be happy with any of these.', 'My pick would be either the Q7 or the X5. The Q7 is good if you need to carry 7 people and the X5 feels very luxurious, modern and the fleet versions give you a plethora of features.'),
('P6', 'Fullsize Luxury SUV', 'luxury', TRUE, 8, 'The Fullsize Luxury SUV Class gives you the best of the best for SUVs. The options here are vast.', 'I would definitely pick the Range Rover, as its the most luxurious by far. The XC90 is pretty basic for the class. The Infiniti QX80 is very dated.'),
('R', 'Minivan', 'van', FALSE, 8, 'This is the Minivan class, where everything is catered to family friendly adventures!', 'I would personally choose the Sienna if you need the most fuel economy, but Pacifica if you need the most space and luxury!'),
('M', 'Fullsize Van', 'van', FALSE, 12, 'This is the Fullsize Van class, and you can only get a Ford Transit 12 Seat van as your option.', 'The Ford Transit 12 Seat is your only option here, but it gets the job done for large groups.'),
('O6', 'Midsize Pickup', 'truck', FALSE, 5, 'This is the midsize pickup truck class. These trucks aren''t the most utilitarian but are small enough so you feel like you''re driving more of a car than an actual big truck.', 'The Tacoma is the best shot. Its got the most offroad gear just in case you want to take it to the trail, plus its got a nice V6.'),
('S', 'Fullsize Pickup', 'truck', FALSE, 5, 'This is the fullsize pickup truck, be ready to do big tasks and to drive higher than anyone else!', 'I would honestly go for the RAM 1500. You can try to get the Limited or Rebel version. The Rebel is very offroad oriented, and the Limited is as nice as a BMW 7 series.'),
('U', 'Convertible', 'specialty', FALSE, 4, 'The convertible class is there for those ultra hot days, and are variable. You can get muscle cars like the Chevrolet Camaro or Ford Mustang, and you can get the BMW 430ci or the Mercedes C/E Convertibles.', 'I would not go for a Camaro or Mustang convertible and just go for the luxury convertibles. These tend to be much more luxurious and well taken care of. If you spot an E convertible, that''s the best.');

-- Seed vehicle models
INSERT INTO vehicle_models (class_id, make, model, trim_level, is_recommended) VALUES
-- A Class
((SELECT id FROM vehicle_classes WHERE code='A'), 'Chevrolet', 'Spark', '1LT', TRUE),
((SELECT id FROM vehicle_classes WHERE code='A'), 'Mitsubishi', 'Mirage', NULL, FALSE),
-- B Class
((SELECT id FROM vehicle_classes WHERE code='B'), 'Chevrolet', 'Sonic', 'LT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='B'), 'Ford', 'Fiesta', 'SE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='B'), 'Toyota', 'Yaris', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='B'), 'Nissan', 'Versa', 'SV', TRUE),
-- C Class
((SELECT id FROM vehicle_classes WHERE code='C'), 'Honda', 'Civic', 'LX', TRUE),
((SELECT id FROM vehicle_classes WHERE code='C'), 'Hyundai', 'Elantra', 'SE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='C'), 'Nissan', 'Sentra', 'SV', FALSE),
((SELECT id FROM vehicle_classes WHERE code='C'), 'Toyota', 'Corolla', 'LE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='C'), 'Subaru', 'Impreza', NULL, FALSE),
-- D Class
((SELECT id FROM vehicle_classes WHERE code='D'), 'Volkswagen', 'Jetta', 'SE', TRUE),
((SELECT id FROM vehicle_classes WHERE code='D'), 'Kia', 'Soul', 'S', FALSE),
((SELECT id FROM vehicle_classes WHERE code='D'), 'Kia', 'Forte', 'LXS', FALSE),
-- E Class
((SELECT id FROM vehicle_classes WHERE code='E'), 'Toyota', 'Prius', 'Eco', TRUE),
((SELECT id FROM vehicle_classes WHERE code='E'), 'Hyundai', 'Ioniq Hybrid', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='E'), 'Kia', 'Niro Hybrid', NULL, FALSE),
-- E6 Class
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Chevrolet', 'Bolt', '1LT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Hyundai', 'Ioniq 5', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Kia', 'Niro EV', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Kia', 'EV6', 'Wind', FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Nissan', 'Ariya', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Subaru', 'Solterra', 'Premium', FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Toyota', 'bZ4X', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Tesla', 'Model 3', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='E6'), 'Tesla', 'Model Y', NULL, FALSE),
-- F Class
((SELECT id FROM vehicle_classes WHERE code='F'), 'Chevrolet', 'Malibu', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='F'), 'Toyota', 'Camry', 'SE', TRUE),
((SELECT id FROM vehicle_classes WHERE code='F'), 'Hyundai', 'Sonata', 'SEL', TRUE),
((SELECT id FROM vehicle_classes WHERE code='F'), 'Nissan', 'Altima', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='F'), 'Ford', 'Fusion', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='F'), 'Mazda', 'Mazda6', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='F'), 'Volkswagen', 'Passat', 'SE', FALSE),
-- G Class
((SELECT id FROM vehicle_classes WHERE code='G'), 'Chevrolet', 'Impala', 'LS', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G'), 'Chrysler', '300', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='G'), 'Dodge', 'Charger', 'SE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G'), 'Honda', 'Accord', 'Hybrid', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G'), 'Nissan', 'Maxima', 'SV', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G'), 'Toyota', 'Avalon', 'XLE', TRUE),
((SELECT id FROM vehicle_classes WHERE code='G'), 'Toyota', 'Crown', 'XLE', TRUE),
-- P4 Class
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Alfa Romeo', 'Giulia', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Audi', 'A3', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Audi', 'A4', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'BMW', '330i', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Cadillac', 'CT4', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Genesis', 'G70', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Lexus', 'IS350', 'F-Sport', FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Infiniti', 'Q50S', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Mercedes-Benz', 'A220', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Mercedes-Benz', 'C300', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P4'), 'Volvo', 'S60', NULL, FALSE),
-- G4 Class
((SELECT id FROM vehicle_classes WHERE code='G4'), 'Acura', 'TLX', 'Tech', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G4'), 'BMW', '530i', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='G4'), 'Cadillac', 'CT5', 'Premium Luxury', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G4'), 'Genesis', 'G80', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='G4'), 'Lexus', 'ES350', 'Premium', FALSE),
((SELECT id FROM vehicle_classes WHERE code='G4'), 'Mercedes-Benz', 'E350', NULL, FALSE),
-- O4 Class
((SELECT id FROM vehicle_classes WHERE code='O4'), 'BMW', '745i', NULL, TRUE),
-- V4 Class
((SELECT id FROM vehicle_classes WHERE code='V4'), 'Chevrolet', 'Camaro', '2SS', TRUE),
((SELECT id FROM vehicle_classes WHERE code='V4'), 'Dodge', 'Challenger', 'R/T', FALSE),
((SELECT id FROM vehicle_classes WHERE code='V4'), 'Ford', 'Mustang', 'GT', TRUE),
-- V Class
((SELECT id FROM vehicle_classes WHERE code='V'), 'Jeep', 'Wrangler', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='V'), 'Toyota', '4Runner', NULL, FALSE),
-- Q4 Class
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Chevrolet', 'Trax', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Honda', 'HR-V', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Hyundai', 'Kona', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Mazda', 'CX-30', 'Select', TRUE),
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Toyota', 'Corolla Cross', 'LE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Mitsubishi', 'Outlander Sport', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='Q4'), 'Volkswagen', 'Taos', NULL, FALSE),
-- L Class
((SELECT id FROM vehicle_classes WHERE code='L'), 'Buick', 'Envision', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Chevrolet', 'Equinox', 'LT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Ford', 'Escape', 'Active', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Ford', 'Edge', 'SEL', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Honda', 'CR-V', 'LX', TRUE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Hyundai', 'Santa Fe', 'SEL', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Hyundai', 'Tucson', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Jeep', 'Grand Cherokee', 'Limited', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Mazda', 'CX-5', 'Premium', TRUE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Mazda', 'CX-50', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Nissan', 'Rogue', 'SV', TRUE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Subaru', 'Forester', 'Premium', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Toyota', 'RAV4', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='L'), 'Volkswagen', 'Tiguan', 'SE', FALSE),
-- L4 Class
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Chevrolet', 'Traverse', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Dodge', 'Durango', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Ford', 'Explorer', 'Limited', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Hyundai', 'Palisade', 'SEL', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Jeep', 'Grand Cherokee L', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Kia', 'Sorento', 'EX', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Mazda', 'CX-90', 'Select', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Nissan', 'Pathfinder', 'SV', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Toyota', 'Highlander', 'XLE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='L4'), 'Volkswagen', 'Atlas', NULL, FALSE),
-- T Class
((SELECT id FROM vehicle_classes WHERE code='T'), 'Chevrolet', 'Tahoe', 'Premier', FALSE),
((SELECT id FROM vehicle_classes WHERE code='T'), 'Ford', 'Expedition', 'XLT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='T'), 'GMC', 'Yukon', 'Denali', FALSE),
((SELECT id FROM vehicle_classes WHERE code='T'), 'Jeep', 'Wagoneer', 'III', TRUE),
-- T6 Class
((SELECT id FROM vehicle_classes WHERE code='T6'), 'Chevrolet', 'Suburban', 'LT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='T6'), 'Ford', 'Expedition MAX', 'XLT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='T6'), 'GMC', 'Yukon XL', 'SLT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='T6'), 'Jeep', 'Wagoneer L', 'III', TRUE),
-- H4 Class
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Acura', 'RDX', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Audi', 'Q3', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Audi', 'Q5', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'BMW', 'X3', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Cadillac', 'XT4', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Genesis', 'GV70', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Infiniti', 'QX50', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Land Rover', 'Range Rover Evoque', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Lexus', 'NX300', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='H4'), 'Volvo', 'XC40', NULL, FALSE),
-- K4 Class
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Alfa Romeo', 'Stelvio', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Audi', 'Q7', 'Premium Plus', TRUE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'BMW', 'X5', 'xDrive40i', TRUE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Cadillac', 'XT5', 'Premium Luxury', FALSE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Infiniti', 'QX60', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Land Rover', 'Range Rover Sport', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Lexus', 'RX350', 'F-Sport', FALSE),
((SELECT id FROM vehicle_classes WHERE code='K4'), 'Volvo', 'XC60', NULL, FALSE),
-- P6 Class
((SELECT id FROM vehicle_classes WHERE code='P6'), 'BMW', 'X7', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Cadillac', 'Escalade', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Jeep', 'Grand Wagoneer', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Land Rover', 'Range Rover', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Maserati', 'Grecale', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Mercedes-Benz', 'GLS550', NULL, FALSE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Infiniti', 'QX80', 'Luxe', FALSE),
((SELECT id FROM vehicle_classes WHERE code='P6'), 'Volvo', 'XC90', NULL, FALSE),
-- R Class
((SELECT id FROM vehicle_classes WHERE code='R'), 'Chrysler', 'Pacifica', 'Limited', TRUE),
((SELECT id FROM vehicle_classes WHERE code='R'), 'Kia', 'Carnival', 'EX', FALSE),
((SELECT id FROM vehicle_classes WHERE code='R'), 'Toyota', 'Sienna', 'XLE', TRUE),
-- M Class
((SELECT id FROM vehicle_classes WHERE code='M'), 'Ford', 'Transit', '12 Seat', TRUE),
-- O6 Class
((SELECT id FROM vehicle_classes WHERE code='O6'), 'Chevrolet', 'Colorado', 'LT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='O6'), 'GMC', 'Canyon', 'SLE', FALSE),
((SELECT id FROM vehicle_classes WHERE code='O6'), 'Nissan', 'Frontier', 'SV', FALSE),
((SELECT id FROM vehicle_classes WHERE code='O6'), 'Toyota', 'Tacoma', 'TRD Offroad', TRUE),
-- S Class
((SELECT id FROM vehicle_classes WHERE code='S'), 'Chevrolet', 'Silverado', 'LT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='S'), 'Ford', 'F-150', 'XLT', FALSE),
((SELECT id FROM vehicle_classes WHERE code='S'), 'RAM', '1500', NULL, TRUE),
((SELECT id FROM vehicle_classes WHERE code='S'), 'Toyota', 'Tundra', 'SR5', FALSE),
-- U Class
((SELECT id FROM vehicle_classes WHERE code='U'), 'Chevrolet', 'Camaro', 'Convertible', FALSE),
((SELECT id FROM vehicle_classes WHERE code='U'), 'Ford', 'Mustang', 'Convertible', FALSE),
((SELECT id FROM vehicle_classes WHERE code='U'), 'BMW', '430ci', 'Convertible', TRUE),
((SELECT id FROM vehicle_classes WHERE code='U'), 'Mercedes-Benz', 'C-Class', 'Convertible', FALSE),
((SELECT id FROM vehicle_classes WHERE code='U'), 'Mercedes-Benz', 'E-Class', 'Convertible', TRUE);
