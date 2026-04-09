-- 1.	Добавление новой кафедры
DELIMITER //
create procedure addCafedra 
(
IN Kadedry_id INT,
IN Kafedry_name varchar(100)
)
begin 
	insert into Kafedry (Kafedry_id, Kafedry_name)
    values (Kafedry_id, Kafedry_name);
    select 'Кафедра добавлена!' as message;
end // ;
delimiter //

call addCafedra(0, 'Русский язык')
-- 2.	Добавление нового преподавателя с проверкой
DELIMITER //
create procedure addPrepod
(
IN teacher_id INT,
IN teacher_name VARCHAR(100),
IN position  VARCHAR(100),
IN AcademicDegree VARCHAR(100),
IN Kafedry_id INT)
begin 
	if position != 'Доцент' And position != 'Профессор' And position != 'Старший преподаватель' then
		  SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Введите позицию подходящую!';
        end if;
        if AcademicDegree != 'Кандидат наук' and AcademicDegree != 'Доктор наук' and AcademicDegree != 'Без степени' then
			  SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ошибка. Введите подходящую ученую степень!';
        end if;
          INSERT INTO teachers (teacher_id, teacher_name, position, AcademicDegree, Kafedry_id)
    VALUES (teacher_id, teacher_name, position, AcademicDegree, Kafedry_id);
         end //
        
DELIMITER //

call addPrepod(121, 'Иван', 'Доцент', 'Без степени', 10)

-- 3.	Назначение занятия в расписание (с контролем целостности)

DELIMITER //
create procedure raspesnazn
(
IN graphic_id INT,
IN discipline_id INT,
IN p_Groups varchar(100),
IN classType varchar(100),
IN teacher_id INT,
IN dayofweek varchar(100),
IN p_time time,
IN audiotoria int
)
begin 
	 IF dayofweek NOT IN ('Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ошибка: День недели должен быть Пн, Вт, Ср, Чт, Пт или Сб!';
    END IF;
    
    IF (select count(*) from graphic where graphic.teacher_id = teacher_id AND graphic.dayofweek = dayofweek AND graphic.time = p_time) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ошибка: Преподаватель уже занят в это время!';
    END IF;
        IF (select count(*) from graphic where graphic.audiotoria = audiotoria AND graphic.dayofweek = dayofweek AND graphic.time = p_time) > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ошибка: Аудитория уже занята в это время!';
        END IF;
    
	  INSERT INTO graphic (
        graphic_id, discipline_id, `groups`, classType, teacher_id, dayofweek, `time`, audiotoria
    )
    VALUES (
    graphic_id,
	discipline_id,
	p_Groups,
	classType,
	teacher_id,
	dayofweek,
	p_time,
	audiotoria);
    end //
DELIMITER //

call raspesnazn(1, 1006, '23П-6', 'Лекция', '105', 'Пн', '8:00', 305)
    
-- 4.	Получение списка преподавателей кафедры
DELIMITER //
create procedure getprepod
(
IN p_kafedry_id INT
)
begin 
		SELECT 
        t.teacher_id AS 'ID',
        t.teacher_name AS 'ФИО',
        t.position AS 'Должность',
        t.AcademicDegree AS 'Ученая_степень',
        k.Kafedry_name AS 'Кафедра'
    FROM teachers t
    JOIN Kafedry k ON t.Kafedry_id = k.Kafedry_id
    WHERE t.Kafedry_id = p_kafedry_id
    ORDER BY t.teacher_name;
    end //
DELIMITER //
    
call getprepod(30)

-- 5.	Подсчет нагрузки на аудиторию
DELIMITER //
create procedure audiotorianaz
()
begin 
	 SELECT 
        g.audiotoria AS 'Аудитория',
        COUNT(*) AS 'Количество_занятий'
    FROM graphic g
    GROUP BY g.audiotoria
    ORDER BY COUNT(*) DESC;
    end //
DELIMITER //
    
call audiotorianaz()


-- для группы вывести расписание
delimiter //
create procedure raspes
(
IN pgroup VARCHAR(100),
IN dayofweek varchar(100)
)
begin 
	if (select count(*) from graphic where graphic.groups = pgroup) <= 0 then
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Такой группы нету';
    else
    if (select count(*) from graphic where graphic.dayofweek = dayofweek AND graphic.groups = pgroup) <= 0 then
    	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'В этот день недели нету пар';
	end if;
	SELECT * FROM graphic
    WHERE graphic.groups = pgroup AND graphic.dayofweek = dayofweek;
    end if;
end //
delimiter //

call raspes('ИС-211', 'вс')

delimiter //
create trigger dddd
before insert on vehicles
for each row
begin 
	if new.Type_name not in ('Газель 1.5т', 'Фура 20т', 'Рефрижератор 5т') then
		signal sqlstate '45000'
			set message_text = 'Диапозон оценок 2, 3, 4, 5';
	end if;
end //
delimiter //



