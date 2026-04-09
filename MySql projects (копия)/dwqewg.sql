-- Пересечение по времени

SELECT d.driver_name, t1.departure_time, t1.arrival_time, t2.departure_time, t2.arrival_time
FROM trips t1
JOIN trips t2 ON t1.driver_id = t2.driver_id AND t1.trip_id != t2.trip_id
JOIN drivers d ON t1.driver_id = d.driver_id
WHERE t1.arrival_time > t2.departure_time AND t2.arrival_time > t1.departure_time;


-- Средняя продолжительность поездки

SELECT drivers.driver_name, ROUND(AVG(TIMESTAMPDIFF(SECOND, trips.departure_time, trips.arrival_time)) / 3600, 2) AS sred
FROM drivers
JOIN trips ON drivers.driver_id = trips.driver_id
GROUP BY drivers.driver_name;

-- Создать упорядоченные списки

-- Продолжительность более 3 часов
SELECT trips.trip_id, drivers.driver_name, drivers.driver_id, vehicles.license_plate, trips.departure_time, trips.arrival_time, ROUND(TIMESTAMPDIFF(SECOND, trips.departure_time, trips.arrival_time) / 3600.0, 2) AS duration_hours
FROM trips
JOIN drivers ON trips.driver_id = drivers.driver_id
JOIN vehicles ON drivers.license_plate = vehicles.license_plate
WHERE trips.arrival_time > trips.departure_time + Interval 3 HOUR
ORDER BY trips.departure_time;

-- Выполненные на определенном автомобиле
SELECT drivers.driver_name, trips.departure_point ,trips.departure_time, trips.arrival_time, trips.distance_km
FROM trips
JOIN drivers ON drivers.driver_id = trips.driver_id
JOIN vehicles ON drivers.license_plate = vehicles.license_plate
WHERE vehicles.license_plate = 'B222BB77'
ORDER BY trips.departure_time DESC;

-- Проехали сегодня более 300 км
SELECT drivers.driver_name, trips.departure_point,trips.departure_time, trips.distance_km
FROM trips
JOIN drivers ON drivers.driver_id = trips.driver_id
WHERE trips.distance_km >= 300 AND DATE(trips.departure_time) = CURRENT_DATE
GROUP BY drivers.driver_id, drivers.driver_name, trips.departure_point, trips.departure_time, trips.distance_km;

