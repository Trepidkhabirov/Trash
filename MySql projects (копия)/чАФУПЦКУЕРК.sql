DROP DATABASE IF EXISTS transport_company;
CREATE DATABASE transport_company;
USE transport_company;

-- 1. Типы автомобилей
CREATE TABLE vehicle_types (
    type_name VARCHAR(50) PRIMARY KEY,
    vehicle_class VARCHAR(30) NOT NULL,
    load_capacity DECIMAL(6,2) NOT NULL,
    base_rate_per_km DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- 2. Транспортные средства
CREATE TABLE vehicles (
    license_plate VARCHAR(15) PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    type_name VARCHAR(50) NOT NULL,
    rate_multiplier DECIMAL(4,2) NOT NULL DEFAULT 1.00,

    FOREIGN KEY (type_name) REFERENCES vehicle_types(type_name)
) ENGINE=InnoDB;

-- 3. Водители
CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    driver_category VARCHAR(30) NOT NULL,
    license_plate VARCHAR(15) UNIQUE,   -- один водитель — одна машина

    FOREIGN KEY (license_plate) REFERENCES vehicles(license_plate)
) ENGINE=InnoDB;

-- 4. Рейсы
CREATE TABLE trips (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    departure_point VARCHAR(100) NOT NULL,
    arrival_point VARCHAR(100) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    distance_km DECIMAL(8,2) NOT NULL,

    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
) ENGINE=InnoDB;