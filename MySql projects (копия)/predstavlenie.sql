Use transport_company
-- 1
CREATE VIEW drivers_no_trips_yesterday AS
SELECT 
    d.Driver_id,
    d.Driver_name,
    d.Class_driver,
    v.license_plate,
    v.brand,
    vt.Type_name AS vehicle_type
FROM drivers d
JOIN vehicles v ON d.License_plate = v.license_plate
JOIN vehicle_types vt ON v.type_name = vt.Type_name
JOIN trips t 
    ON t.Driver_id = d.Driver_id 
    AND DATE(t.departure_time) = CURDATE() - INTERVAL 1 DAY
ORDER BY d.Driver_name;

UPDATE drivers_no_trips_yesterday 
SET Driver_name = 'Новый Иван'
WHERE Driver_id = 5;

-- 2
CREATE VIEW Statistics AS
SELECT 
    DATE(t.departure_time) AS date,
    COUNT(*) AS trip_count,
    ROUND(AVG(vt.base_rate_per_km * t.distance_km * v.ratio), 2) AS avg_trip_cost,
    ROUND(AVG(t.distance_km), 1) AS avg_distance_km,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, t.departure_time, t.arrival_time) / 60.0), 1) AS avg_duration_hours
FROM trips t
    JOIN drivers d     ON t.Driver_id = d.Driver_id
    JOIN vehicles v    ON d.License_plate = v.license_plate
    JOIN vehicle_types vt ON v.type_name = vt.Type_name
GROUP BY DATE(t.departure_time)
ORDER BY date DESC;

UPDATE Statistics 
SET avg_distance_km = 888 
WHERE date = '2026-02-08';

-- 3
CREATE VIEW trip_costs AS
SELECT 
    t.trip_id,
    t.Driver_id,
    d.Driver_name,
    t.departure_point,
    t.arrival_point,
    t.departure_time,
    t.distance_km,
    vt.base_rate_per_km,
    v.ratio,
    ROUND(vt.base_rate_per_km * v.ratio * t.distance_km, 2) AS trip_cost
FROM trips t
    JOIN drivers d     ON t.Driver_id = d.Driver_id
    JOIN vehicles v    ON d.License_plate = v.license_plate
    JOIN vehicle_types vt ON v.type_name = vt.Type_name
ORDER BY t.departure_time DESC;


UPDATE trip_costs
   SET distance_km = 250
 WHERE trip_id = 10001;
 


 

