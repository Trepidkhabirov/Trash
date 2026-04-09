
USE transport_company;

-- 1. Типы автомобилей
USE transport_company;

-- 1. Типы автомобилей
CREATE TABLE Vehicle_types (
    Type_name        VARCHAR(50) PRIMARY KEY,
    Class            VARCHAR(30) NOT NULL,
    Load_capacity    NUMERIC(6,2) NOT NULL,
    base_rate_per_km NUMERIC(10,2) NOT NULL
);

-- 2. Транспортные средства
CREATE TABLE Vehicles (
    License_plate    VARCHAR(15) PRIMARY KEY,
    brand            VARCHAR(50) NOT NULL,
    Type_name        VARCHAR(50) NOT NULL,
    Ratio            NUMERIC(4,2) NOT NULL DEFAULT 1.00,
    FOREIGN KEY (Type_name) REFERENCES Vehicle_types(Type_name)
);

-- 3. Водители
CREATE TABLE Drivers (
    Driver_id        SERIAL PRIMARY KEY,
    Driver_name      VARCHAR(100) NOT NULL,
    Class_driver     VARCHAR(30) NOT NULL,
    License_plate    VARCHAR(15) UNIQUE,
    FOREIGN KEY (License_plate) REFERENCES Vehicles(License_plate)
);

-- 4. Рейсы — правильный вариант
-- Сначала удаляем старую попытку, если она создалась
DROP TABLE IF EXISTS Trips;

-- Теперь создаём правильно
CREATE TABLE Trips (
    trip_id          SERIAL PRIMARY KEY,
    Driver_id        BIGINT UNSIGNED NOT NULL,          -- ← ВАЖНО: BIGINT UNSIGNED!
    departure_point  VARCHAR(100) NOT NULL,
    arrival_point    VARCHAR(100) NOT NULL,
    departure_time   TIMESTAMP NOT NULL,
    arrival_time     TIMESTAMP NOT NULL,
    distance_km      NUMERIC(8,2) NOT NULL,
    
    FOREIGN KEY (Driver_id) REFERENCES Drivers(Driver_id)
);
USE transport_company;

INSERT INTO trips (trip_id, Driver_id, departure_point, arrival_point, departure_time, arrival_time, distance_km) VALUES
(10001, 102, 'Москва', 'Тула', '2025-11-20 08:00:00', '2025-11-20 11:30:00', 180.5),
(10002, 101, 'Москва', 'Санкт-Петербург', '2025-11-25 22:00:00', '2025-11-26 08:30:00', 710),
(10003, 104, 'Москва', 'Рязань', '2025-11-21 09:00:00', '2025-11-21 12:15:00', 200),
(10004, 103, 'Москва', 'Калуга', '2025-11-22 14:00:00', '2025-11-22 17:15:00', 190),
(10005, 105, 'Москва', 'Владимир', '2025-11-23 10:30:00', '2025-11-23 13:45:00', 190),
(10006, 106, 'Москва', 'Нижний Новгород', '2025-11-24 06:00:00', '2025-11-24 11:20:00', 420),
(10007, 107, 'Москва', 'Воронеж', '2025-11-25 05:00:00', '2025-11-25 12:40:00', 510),
(10008, 108, 'Москва', 'Казань', '2025-11-26 07:00:00', '2025-11-26 18:30:00', 820),
(10009, 109, 'Москва', 'Тверь', '2025-11-27 13:00:00', '2025-11-27 16:20:00', 180),
(10010, 110, 'Москва', 'Смоленск', '2025-11-28 09:00:00', '2025-11-28 14:30:00', 400),
(10101, 102, 'Москва', 'Серпухов', '2025-12-05 15:00:00', '2025-12-05 17:00:00', 100),
(10102, 102, 'Москва', 'Подольск', '2025-12-05 16:30:00', '2025-12-05 18:00:00', 40),
(10103, 103, 'Москва', 'Орёл', '2025-12-10 08:00:00', '2025-12-10 13:00:00', 380),
(10104, 103, 'Москва', 'Брянск', '2025-12-10 11:00:00', '2025-12-10 16:30:00', 380),
(10105, 104, 'Москва', 'Коломна', '2025-12-15 09:30:00', '2025-12-15 11:45:00', 120),
(10106, 104, 'Москва', 'Тула', '2025-12-15 10:00:00', '2025-12-15 13:30:00', 180.5),
(10107, 105, 'Москва', 'Ярославль', '2025-12-20 07:00:00', '2025-12-20 11:00:00', 270),
(10108, 105, 'Москва', 'Кострома', '2025-12-20 09:30:00', '2025-12-20 14:00:00', 330),
(10109, 106, 'Москва', 'Екатеринбург', '2025-12-18 20:00:00', '2025-12-20 12:00:00', 1780),
(10110, 106, 'Москва', 'Самара', '2025-12-19 23:00:00', '2025-12-20 14:00:00', 1050);


USE transport_company;

INSERT INTO Vehicle_types (Type_name, Class, Load_capacity, base_rate_per_km) VALUES
('Газель 1.5т', 'Малый', 1.50, 50.00),
('Фура 20т', 'Крупный', 20.00, 80.00),
('Рефрижератор 5т', 'Средний', 5.00, 70.00),
('Тент 10т', 'Средний', 10.00, 60.00);




USE transport_company;

INSERT INTO drivers (Driver_id, Driver_name, Class_driver, License_plate) VALUES
(101, 'Иванов Иван Иваныч', 'Первый', 'X777XX77'),
(102, 'Петров Пётр Петрович', 'Второй', 'A111AA77'),
(103, 'Сидоров Сергей Сергеич', 'Первый', 'В666ОР02'),
(104, 'Козлов Дмитрий Васильевич', 'Эконом', 'B222BB77'),
(105, 'Михайлов Михаил Михайлович', 'Первый', 'K555KK77'),
(106, 'Фёдоров Фёдор Фёдорович', 'Первый', 'Е777КХ77'),
(107, 'Алексеев Алексей Алексеевич', 'В', 'М999ММ50'),
(108, 'Николаев Николай Николаевич', 'Первый', 'Т123ТТ99'),
(109, 'Васильев Василий Васильевич', 'Эконом', 'Р888РР77'),
(110, 'Дмитриев Дмитрий Дмитриевич', 'Первый', 'О777ОО177');
use transport_company
USE transport_company;



INSERT INTO vehicles (license_plate, brand, type_name, ratio) VALUES
('X777XX77', 'Газель Next', 'Газель 1.5т', 1.00),
('A111AA77', 'Hyundai Porter', 'Газель 1.5т', 1.00),
('В666ОР02', 'Mercedes Sprinter', 'Тент 10т', 1.10),
('B222BB77', 'Iveco Daily', 'Тент 10т', 1.10);



