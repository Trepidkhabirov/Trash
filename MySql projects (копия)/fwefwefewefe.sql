-- Suppliers
CREATE TABLE S (
    supplier_id     CHAR(3)         PRIMARY KEY,
    supplier_name   VARCHAR(30)     NOT NULL,
    rating          INT             NOT NULL,
    city            VARCHAR(50)     NOT NULL
);

-- Parts
CREATE TABLE P (
    part_id         CHAR(3)         PRIMARY KEY,
    part_name       VARCHAR(50)     NOT NULL,
    color           VARCHAR(20)     NOT NULL,
    weight          int    NOT NULL,
    city            VARCHAR(50)     NOT NULL
);

-- Projects
CREATE TABLE J (
    project_id      CHAR(3)         PRIMARY KEY,
    project_name    VARCHAR(100)    NOT NULL,
    city            VARCHAR(50)     NOT NULL
);

-- Shipments (junction table)
CREATE TABLE SPJ (
    supplier_id     CHAR(3)         NOT NULL,
    part_id         CHAR(3)         NOT NULL,
    project_id      CHAR(3)         NOT NULL,
    quantity        INT             NOT NULL,
    
    PRIMARY KEY (supplier_id, part_id, project_id),
    
    FOREIGN KEY (supplier_id)   REFERENCES S(supplier_id)   ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (part_id)       REFERENCES P(part_id)       ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (project_id)    REFERENCES J(project_id)    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 1. Получить номера изделий, использующих только детали, поставляемые поставщиком S6.
SELECT DISTINCT project_id
FROM SPJ
WHERE project_id IN (
    SELECT project_id 
    FROM SPJ 
    WHERE supplier_id = 'S5'
)
-- 2. Выдать общее число изделий, для которых поставляет детали поставщик S6.
SELECT COUNT(DISTINCT project_id) AS count
FROM SPJ
WHERE supplier_id = 'S6';

-- 3.	Выдать общее количество деталей P1, поставляемых поставщиком S6.
SELECT SUM(quantity) AS total
FROM SPJ
WHERE supplier_id = 'S6' AND part_id = 'P1';

-- 4.	Получить номера и фамилии поставщиков, поставляющих по крайней мере одну деталь, 
-- поставляемую по крайней мере одним поставщиком, 
-- который поставляет по крайней мере одну красную деталь.

SELECT s.supplier_id, s.supplier_name
FROM S s
JOIN SPJ sp1 ON s.supplier_id = sp1.supplier_id
JOIN SPJ sp2 ON sp1.part_id = sp2.part_id
JOIN P p ON sp2.part_id = p.part_id
WHERE p.color = 'Красный';

-- 5. Выдать полную информацию о поставщике, имеющим максимальный рейтинг.
SELECT *
FROM S
WHERE rating = (SELECT MAX(rating) FROM S);

-- 6. Перевести поставщика с минимальным рейтингом в город, где изготавливается самая тяжелая деталь.
UPDATE S
SET city = (
    SELECT city 
    FROM P 
    WHERE weight = (SELECT MAX(weight) FROM P)
)
WHERE rating = (SELECT MIN(rating) FROM S);

-- 7.	Поменять местами города, где проживают поставщики с минимальным и максимальным рейтингом.
UPDATE S s1
JOIN S s2 
    ON s1.rating = (SELECT MIN(rating) FROM S)
    AND s2.rating = (SELECT MAX(rating) FROM S)
    AND s1.supplier_id <> s2.supplier_id
SET s1.city = s2.city,
    s2.city = s1.city;
    
-- 8.	Выдать полную информацию о детали, имеющей максимальный вес.
SELECT *
FROM P
WHERE weight = (SELECT MAX(weight) FROM P);

-- 9.	Перевести поставщика с максимальным рейтингом в Лондон.
UPDATE S
SET city = 'Лондон'
WHERE rating = (SELECT MAX(rating) FROM S);

-- 10.	Выдать общий объем поставок деталей красного цвета.
SELECT SUM(spj.quantity) AS total_red
FROM SPJ spj
JOIN P p ON spj.part_id = p.part_id
WHERE p.color = 'Красный';

-- 11.	В таблице деталей сменить название детали "Винт" на название детали с максимальным весом.
UPDATE P
SET part_name = (
    SELECT part_name 
    FROM P 
    WHERE weight = (SELECT MAX(weight) FROM P)
)
WHERE part_name = 'Винт';

-- 12.	Выдать полную информацию об изделии, имеющем максимальный объем поставок деталей.
SELECT j.*, SUM(spj.quantity) AS total_quantity
FROM J j
JOIN SPJ spj ON j.project_id = spj.project_id
GROUP BY j.project_id, j.project_name, j.city
HAVING total_quantity = (
    SELECT MAX(t.total)
    FROM (
        SELECT SUM(quantity) AS total
        FROM SPJ
        GROUP BY project_id
    ) t
);



