USE prueba;

drop table if exists Booking;
drop table if exists Flight;
drop table if exists Aircraft;
drop table if exists Customer;

-- Creo tabla Customer
create table Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    status VARCHAR(20),
    total_miles INT
);

-- Creo tabla Aircraft
create table Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    total_seats INT
);

-- Creo tabla Flight
create table Flight (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10),
    aircraft_id INT,
    mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

-- Creo tabla Booking
create table Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

-- Inserto datos en Customer
insert into Customer (name, status, total_miles) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

-- Inserto datos en Aircraft
insert into Aircraft (name, total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

-- Inserto datos en Flight
insert into Flight (flight_number, aircraft_id, mileage) VALUES
('DL143', 1, 135),     -- Boeing 747
('DL122', 2, 4370),    -- Airbus A330
('DL53', 3, 2078),     -- Boeing 777
('DL222', 3, 1765),    -- Boeing 777
('DL37', 1, 531);      -- Boeing 747

-- Inserto datos en Booking (cliente + vuelo)
insert into Booking (customer_id, flight_id) VALUES
(1, 1),  -- Agustine Riviera - DL143
(1, 2),  -- Agustine Riviera - DL122
(2, 2),  -- Alaina Sepulvida - DL122
(1, 1),  -- Agustine Riviera - DL143
(3, 2),  -- Tom Jones - DL122
(3, 3),  -- Tom Jones - DL53
(1, 1),  -- Agustine Riviera - DL143
(4, 1),  -- Sam Rio - DL143
(1, 1),  -- Agustine Riviera - DL143
(3, 4),  -- Tom Jones - DL222
(5, 1),  -- Jessica James - DL143
(4, 1),  -- Sam Rio - DL143
(6, 4),  -- Ana Janco - DL222
(7, 4),  -- Jennifer Cortez - DL222
(5, 2),  -- Jessica James - DL122
(4, 5),  -- Sam Rio - DL37
(8, 4);  -- Christian Janco - DL222

-- Verificación: consulta para mostrar todo
SELECT
    b.booking_id,
    c.name AS customer,
    c.status,
    f.flight_number,
    a.name AS aircraft,
    a.total_seats,
    f.mileage
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Flight f ON b.flight_id = f.flight_id
JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
ORDER BY b.booking_id;
