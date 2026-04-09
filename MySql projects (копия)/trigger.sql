-- 1.	Проверить корректность времени рейса. Действие: Запретить операцию, если Время прибытия меньше или равно Время отправления.
DELIMITER //

CREATE TRIGGER trips_check_times_before_insert
BEFORE insert ON Trips
FOR EACH ROW
BEGIN
    IF NEW.arrival_time <= NEW.departure_time THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ошибка: время приезда не может быть раньше или равно времени выезда';
    END IF;
END //


-- 2.	Проверить значение поля Класс. Допустимые значения: 'A', 'B', 'C'. В случае несоответствия — присвоить класс 'B' по умолчанию.
DELIMITER //

CREate trigger trips_b_standart
BEFORE insert on vehicle_types
for each row 
begin 
	if NEW.class NOT IN ('Малый', 'Крупный', 'Средний') then
		set new.class = 'Средний';
	END IF;
END //
DELIMITER ;

-- 3.	Автоматически рассчитывать и сохранять итоговую стоимость рейса.

DELIMITER //

CREATE TRIGGER itog_price
BEFORE INSERT ON trips
FOR EACH ROW
BEGIN
    SET NEW.total_cost = NEW.distance_km * (
        SELECT vt.base_rate_per_km
        FROM drivers d
        JOIN vehicles v ON d.License_plate = v.License_plate
        JOIN vehicle_types vt ON v.Type_name = vt.Type_name
        WHERE d.Driver_id = NEW.Driver_id
        LIMIT 1
    );
END //

DELIMITER ;


-- 4 .Обеспечить соответствие класса водителя и типа/класса автомобиля. 
-- Проверить, что Класс водителя (например, 'A') соответствует Классу автомобиля, 
-- к которому он прикрепляется (Номер ТС). Например, водитель высшего класса может 
-- управлять автомобилями любого класса, а водитель класса 'C' — только автомобилями класса 
-- 'C'. Запретить назначение при нарушении правила.
DELIMITER //
create trigger sotvetstvie
before insert on vehicles_types
for each row 
begin 
	if load_capacity <= 1.50 then
		set new.class = 'Малый';
	end if;
	if load_capacity <= 5.00 then
		set new.class = 'Средний';
	end if;
	if load_capacity <= 10.00 then
		set new.class = 'Крупный';
	end if;
	if load_capacity <= 20.00 then
		set new.class = 'Крупный';
	end if;
    END //
    
DELIMITER;

		


-- 5.	Проверить, что значение поля Длина_маршрута больше 0. В противном случае отменить операцию и вывести сообщение об ошибке
DELIMITER //
create trigger bolshe0
before insert on trips
for each row 
begin
	if new.distance_km <= 0 then
		signal sqlstate '45000'
        set message_text = 'Ошибка. Длина машрута должна быть больше 0';
	end if;
end //
DELIMITER

-- 16 
DELIMITER //
create trigger ratingno
FROM 
JOIN s on s.supplier_id = spj.supplier_id
before insert on spj
for each row
begin 

	if s.rating < 15 AND spj.quantity > 500 then
		signal sqlstate '45000'
		set message_text = 'Поставщикам с рейтингом ниже 15 нельзя поставлять не более 500 товаров';
	end if;
end //
DELIMITER;


        

        
