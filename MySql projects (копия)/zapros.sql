CREATE DATABASE DB_BOOKS;
use DB_BOOKS;

CREATE TABLE Authors( -- создание таблицы в бд
Code_author INT PRIMARY KEY,-- первичный ключ ( уникальный индентификатор записи который не должен повторятся) подтверждает уникальность каждой записи
 name_author CHAR(30), 
 Birthday DATETIME
 );

CREATE TABLE Publishing_house(
Code_publish INT PRIMARY KEY AUTO_INCREMENT,
 Publish CHAR(50), 
City CHAR(20)
);

CREATE TABLE Books(
Code_book INT PRIMARY KEY AUTO_INCREMENT,
 Title_book CHAR(40), 
 Code_author int,
FOREIGN KEY (Code_author) REFERENCES Authors(Code_author), 
 Pages INT, 
 Code_publish int,
   FOREIGN KEY (Code_publish) REFERENCES Publishing_house(Code_publish) 
 );

CREATE TABLE Deliveries(
Code_delivery INT PRIMARY KEY AUTO_INCREMENT,
 Name_delivery VARCHAR(50),
 Name_company VARCHAR(40),
 Address VARCHAR(100),
 Phone BIGINT,
 INN CHAR(13)
 );

CREATE TABLE Purchases(
Code_purchase INT PRIMARY KEY AUTO_INCREMENT, 
Code_book INT,
FOREIGN KEY (Code_book) REFERENCES Books(Code_book), 
Date_order DATETIME, 
Code_delivery INT,
 FOREIGN KEY (Code_delivery) REFERENCES Deliveries(Code_delivery),
 Type_purchase BIT,
 Cost FLOAT,
 Amount INT
 );

INSERT INTO Deliveries (Code_delivery, Name_delivery, Name_company, Address, Phone, INN) VALUES
(1, 'ИП «Примак Ю.П.»', 'ИП «Примак Ю.П.»', 'Симферополь, ул. Кечкеметская, д.27', '89781459491', '010200020125'),
(2, 'ИП «Борисова Л.А.»', 'ИП «Борисова Л.А.»', 'Москва Комсомольская пл. 1а, стр 15, ск  15', '89167235223', '771500136123'),
(3, 'ИП НОВОСЕЛОВ', 'ИП НОВОСЕЛОВ', 'Москва, 1-й Павелецкий проезд,2 а', '84999135620', '771584254997'),
(4, 'ООО НЦ "ЭНАС"', 'ООО НЦ "ЭНАС"', 'Москва, Дербеневская набережная, дом 11', '84959136620', '000111002001'),
(5, 'АО "Тверская Областная Типография"', 'АО "Тверская Областная Типография"', 'Г ТВЕРЬ,ПЕРЕУЛОК СТУДЕНЧЕСКИЙ Д 28', '84822343138', '006950061549'),
(6, 'КНИЖНЫЙ СКЛАД', 'КНИЖНЫЙ СКЛАД', 'Белгород, Б.Хмельницкого пр., д.135 корп.1 эт.', '84722358878', '145789621021');
INSERT INTO Purchases (Code_purchase, Code_book, Date_order, Code_delivery, Cost, Amount) VALUES
(1, 1, '2017-01-11', 1, 112.00, 20),
(2, 2, '2017-01-17', 2, 114.00, 22),
(3, 3, '2017-01-11', 3, 116.00, 24),
(4, 4, '2017-01-29', 4, 118.00, 100),
(5, 5, '2017-01-17', 5, 120.00, 28),
(6, 6, '2017-02-10', 6, 122.00, 30),
(7, 7, '2017-01-17', 2, 124.00, 32),
(8, 8, '2017-02-10', 3, 126.00, 34),
(9, 9, '2017-02-10', 4, 128.00, 36),
(10, 10, '2017-02-10', 5, 130.00, 38),
(11, 11, '2017-03-12', 6, 132.00, 40),
(12, 12, '2017-03-18', 1, 134.00, 42),
(13, 13, '2017-03-24', 2, 136.00, 44),
(14, 14, '2017-03-30', 3, 138.00, 46),
(15, 15, '2017-04-05', 4, 140.00, 48),
(16, 16, '2017-04-11', 5, 142.00, 50),
(17, 17, '2017-04-17', 6, 144.00, 52),
(18, 18, '2017-04-23', 2, 146.00, 54),
(19, 19, '2017-04-29', 3, 148.00, 56),
(20, 20, '2017-05-05', 4, 150.00, 58),
(21, 21, '2017-05-11', 1, 152.00, 60),
(22, 22, '2017-05-17', 2, 154.00, 62),
(23, 23, '2017-05-23', 3, 156.00, 64),
(24, 24, '2017-05-29', 4, 158.00, 66),
(25, 25, '2017-06-04', 5, 160.00, 68),
(26, 26, '2017-06-10', 6, 162.00, 70),
(27, 27, '2017-06-16', 2, 164.00, 72),
(28, 28, '2017-06-22', 3, 166.00, 74),
(29, 29, '2017-06-28', 4, 168.00, 76),
(30, 30, '2017-07-04', 1, 170.00, 78),
(31, 31, '2017-07-10', 2, 172.00, 80),
(32, 32, '2017-07-16', 3, 174.00, 82),
(33, 33, '2017-07-22', 4, 176.00, 84),
(34, 34, '2017-07-28', 5, 178.00, 86),
(35, 35, '2017-08-03', 6, 180.00, 88),
(36, 36, '2017-08-09', 2, 182.00, 90),
(37, 37, '2017-08-15', 3, 184.00, 92),
(38, 38, '2017-08-21', 4, 186.00, 94),
(39, 39, '2017-08-27', 5, 188.00, 96),
(40, 40, '2017-09-02', 1, 190.00, 98),
(41, 41, '2017-09-08', 2, 192.00, 100),
(42, 42, '2017-09-14', 3, 194.00, 102),
(43, 43, '2017-09-20', 4, 196.00, 104),
(44, 44, '2017-09-26', 5, 198.00, 106),
(45, 45, '2017-10-02', 6, 200.00, 108),
(46, 46, '2017-10-08', 2, 202.00, 110),
(47, 47, '2017-10-14', 3, 204.00, 112),
(48, 48, '2017-10-20', 4, 206.00, 114),
(49, 49, '2017-10-26', 5, 208.00, 116),
(50, 50, '2017-11-01', 6, 210.00, 118),
(51, 51, '2017-11-07', 1, 212.00, 120),
(52, 52, '2017-11-13', 2, 214.00, 122),
(53, 53, '2017-11-19', 3, 216.00, 124),
(54, 54, '2017-11-25', 4, 218.00, 126),
(55, 55, '2017-12-01', 5, 220.00, 128),
(56, 56, '2017-12-07', 6, 222.00, 130),
(57, 57, '2017-12-13', 2, 224.00, 132),
(58, 58, '2017-12-19', 3, 226.00, 134),
(59, 59, '2017-12-25', 4, 228.00, 136),
(60, 60, '2017-12-31', 1, 230.00, 138),
(61, 61, '2018-01-06', 2, 232.00, 140),
(62, 62, '2018-01-12', 3, 234.00, 142),
(63, 63, '2018-01-18', 4, 236.00, 144),
(64, 64, '2018-01-24', 5, 238.00, 146),
(65, 65, '2018-01-30', 6, 240.00, 148),
(66, 66, '2018-02-05', 2, 242.00, 150),
(67, 67, '2018-02-11', 3, 244.00, 152),
(68, 68, '2018-02-17', 4, 246.00, 154),
(69, 69, '2018-02-23', 1, 248.00, 156),
(70, 70, '2018-03-01', 2, 250.00, 158),
(71, 71, '2018-03-07', 3, 252.00, 160),
(72, 72, '2018-03-13', 4, 254.00, 162),
(73, 73, '2018-03-19', 5, 256.00, 164),
(74, 74, '2018-03-25', 6, 258.00, 166),
(75, 75, '2018-03-31', 1, 260.00, 168),
(76, 76, '2018-04-06', 2, 262.00, 170),
(77, 77, '2018-04-12', 3, 264.00, 172),
(78, 78, '2018-04-18', 4, 266.00, 174),
(79, 79, '2018-04-24', 5, 268.00, 176),
(80, 80, '2018-04-30', 6, 270.00, 178),
(81, 81, '2018-05-06', 2, 272.00, 180),
(82, 82, '2018-05-12', 3, 274.00, 182),
(83, 83, '2018-05-18', 4, 276.00, 184),
(84, 84, '2018-05-24', 5, 278.00, 186),
(85, 85, '2018-05-30', 6, 280.00, 188),
(86, 86, '2018-06-05', 1, 282.00, 190),
(87, 87, '2018-06-11', 2, 284.00, 192),
(88, 88, '2018-06-17', 3, 286.00, 194),
(89, 89, '2018-06-23', 4, 288.00, 196),
(90, 90, '2018-06-29', 5, 290.00, 198),
(91, 91, '2018-07-05', 6, 292.00, 200),
(92, 92, '2018-07-11', 2, 294.00, 202),
(93, 93, '2018-07-17', 3, 296.00, 204),
(94, 94, '2018-07-23', 4, 298.00, 206),
(95, 95, '2018-07-29', 1, 300.00, 208),
(96, 96, '2018-08-04', 2, 302.00, 210),
(97, 97, '2018-08-10', 3, 304.00, 212),
(98, 98, '2018-08-16', 4, 306.00, 214),
(99, 99, '2018-08-22', 5, 308.00, 216),
(100, 100, '2018-08-28', 6, 310.00, 218),
(101, 101, '2018-09-03', 2, 312.00, 220),
(102, 102, '2018-09-09', 3, 314.00, 222),
(103, 103, '2018-09-15', 4, 316.00, 224),
(104, 104, '2018-09-21', 1, 318.00, 226),
(105, 105, '2018-09-27', 2, 320.00, 228),
(106, 106, '2018-10-03', 3, 322.00, 230),
(107, 107, '2018-10-09', 4, 324.00, 232),
(108, 108, '2018-10-15', 5, 326.00, 234),
(109, 109, '2018-10-21', 6, 328.00, 236),
(110, 110, '2018-10-27', 1, 330.00, 238),
(111, 111, '2018-11-02', 2, 332.00, 240),
(112, 112, '2018-11-08', 3, 334.00, 242),
(113, 113, '2018-11-14', 4, 336.00, 244),
(114, 114, '2018-11-20', 5, 338.00, 246),
(115, 115, '2018-11-26', 6, 340.00, 248),
(116, 116, '2018-12-02', 2, 342.00, 250),
(117, 117, '2018-12-08', 3, 344.00, 252),
(118, 118, '2018-12-14', 4, 346.00, 254),
(119, 119, '2018-12-20', 5, 348.00, 256),
(120, 120, '2018-12-26', 6, 350.00, 258),
(121, 121, '2019-01-01', 1, 352.00, 260),
(122, 122, '2019-01-07', 2, 354.00, 262),
(123, 123, '2019-01-13', 3, 356.00, 264),
(124, 124, '2019-01-19', 4, 358.00, 266),
(125, 125, '2019-01-25', 5, 360.00, 268),
(126, 126, '2019-01-31', 6, 362.00, 270),
(127, 127, '2019-02-06', 2, 364.00, 272);
-- задание 1
Select * from Books   order by Code_book;
-- задание 2
Select Code_book,Title_book, Pages  from Books order by Title_book asc,Pages desc  ; 
-- задание 3
Select Name_delivery, Phone, INN from Deliveries   order by INN desc;

-- задание 4
Select Name_delivery,INN,  Phone, Address, Code_delivery from Deliveries;

-- задание 5

Select Publish, City, Code_publish from Publishing_house; 

-- 6
Select b.Title_book, b.Pages, a.name_author -- select выбрать, from откуда
from Books b -- b является кратким именим для обращения к атрибутам таблицы, если у нас их много то это круто поможет
join Authors a on b.Code_author = a.Code_author; -- join возвращает только те строки, где значения совпадают в обеих таблицах. Это наиболее часто используемый тип соединения. 
-- 7 
SELECT b.Title_book, b.Pages, d.Name_delivery
FROM Books b
JOIN Purchases p ON b.Code_book = p.Code_book --  ON определяет, по какому условию нужно соединить таблицы по атрибуту Code_author
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery; 

-- 6. Книги + авторы
SELECT b.Title_book, b.Pages, a.name_author
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author;

-- 7. Книги + поставщики
SELECT b.Title_book, b.Pages, d.Name_delivery
FROM Books b
JOIN Purchases p ON b.Code_book = p.Code_book
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery;

-- 8. Книги + издательства
SELECT b.Title_book, b.Pages, ph.Publish, ph.City
FROM Books b
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish;

-- 9. Компании, начинающиеся с ‘ОАО’
SELECT Name_company, Phone, INN
FROM Deliveries
WHERE Name_company LIKE 'ОАО%'; -- where условие при котором LIKE Оператор LIKE используется для поиска строк, соответствующих определённому шаблону. Он часто применяется в сочетании с подстановочными символами % и _ % — соответствует любой последовательности символов (включая пустую). _ — соответствует одному любому символу.

-- 10. Книги, начинающиеся с ‘Мемуары’
SELECT b.Title_book, b.Pages, a.name_author
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author
WHERE b.Title_book LIKE 'Мемуары%';

-- 11. Авторы с фамилией ‘Иванов’
SELECT name_author
FROM Authors
WHERE name_author LIKE 'Иванов%';

-- 12. Издательства НЕ в Москве
SELECT Publish
FROM Publishing_house
WHERE City != 'Москва';

-- 13. Книги НЕ издательства ‘Питер-Софт’
SELECT b.Title_book
FROM Books b
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish != 'Питер-Софт'; -- != не является Питер-Софт то же  самое как и NOT LIKE

-- 14. Авторы, рождённые 01.01.1840 – 01.06.1860
SELECT name_author
FROM Authors
WHERE Birthday BETWEEN '1840-01-01' AND '1860-06-01'; -- BETWEEN МЕЖДУ ЧЕМ ТО AND ЧЕМ ТО

-- 15. Книги, закупленные 12.03.2003 – 15.06.2003
SELECT b.Title_book, p.Amount
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Date_order BETWEEN '2003-03-12' AND '2003-06-15';

-- 16. Книги с 200–300 страниц
SELECT Title_book, Pages
FROM Books
WHERE Pages BETWEEN 200 AND 300;

-- 17. Авторы с фамилией на ‘В’–‘Г’
SELECT name_author
FROM Authors
WHERE name_author REGEXP '^[ВГ]';

-- 18. Поставки от поставщиков 3,7,9,11
SELECT b.Title_book, p.Amount
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Code_delivery IN (3, 7, 9, 11);

-- 19. Книги издательств ‘Питер-Софт’, ‘Альфа’, ‘Наука’
SELECT b.Title_book
FROM Books b
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish IN ('Питер-Софт', 'Альфа', 'Наука');

-- 20. Книги авторов ‘Толстой Л.Н.’, ‘Достоевский Ф.М.’, ‘Пушкин А.С.’
SELECT b.Title_book
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author
WHERE a.name_author IN ('Толстой Л.Н.', 'Достоевский Ф.М.', 'Пушкин А.С.');

-- 21. Авторы на букву ‘К’
SELECT name_author
FROM Authors
WHERE name_author LIKE 'К%';

-- 22. Издательства со словом ‘софт’
SELECT Publish
FROM Publishing_house
WHERE Publish LIKE '%софт%';

-- 23. Компании, оканчивающиеся на ‘ский’
SELECT Name_company
FROM Deliveries
WHERE Name_company LIKE '%ский';

-- 24. Поставки: Amount > 100 ИЛИ Cost 200–500
SELECT p.Code_delivery, p.Date_order, b.Title_book
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Amount > 100 OR p.Cost BETWEEN 200 AND 500;

-- 25. Авторы + книги: Code_publish 10–25 И Pages > 120
SELECT a.Code_author, a.name_author, b.Title_book
FROM Authors a
JOIN Books b ON a.Code_author = b.Code_author
WHERE b.Code_publish BETWEEN 10 AND 25 AND b.Pages > 120;

-- 26. Издательства ‘Труды...’ в ‘Новосибирск’
SELECT ph.Publish
FROM Publishing_house ph
JOIN Books b ON ph.Code_publish = b.Code_publish
WHERE b.Title_book LIKE 'Труды%' AND ph.City = 'Новосибирск';

-- 27. Поставщики + книги за 2002–2003
SELECT d.Name_company, b.Title_book
FROM Deliveries d
JOIN Purchases p ON d.Code_delivery = p.Code_delivery
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Date_order BETWEEN '2002-01-01' AND '2003-12-31';

-- 28. Авторы книг издательства ‘Мир’
SELECT DISTINCT a.name_author
FROM Authors a
JOIN Books b ON a.Code_author = b.Code_author
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish = 'Мир';

-- 29. Поставщики книг издательства ‘Питер’
SELECT DISTINCT d.Name_company
FROM Deliveries d
JOIN Purchases p ON d.Code_delivery = p.Code_delivery
JOIN Books b ON p.Code_book = b.Code_book
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish = 'Питер';

-- 30. Авторы + книги от поставщика ‘ОАО Книготорг’
SELECT a.name_author, b.Title_book
FROM Authors a
JOIN Books b ON a.Code_author = b.Code_author
JOIN Purchases p ON b.Code_book = p.Code_book
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery
WHERE d.Name_company = 'ОАО Книготорг';

-- 31. Суммарная стоимость партии (Amount * Cost)
SELECT b.Title_book, (p.Amount * p.Cost) AS total_cost
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book;

-- 32. Стоимость одной страницы
SELECT b.Title_book, (p.Cost / b.Pages) AS cost_per_page
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE b.Pages > 0;

-- 33. Возраст авторов (в годах)
SELECT name_author, TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) AS age
FROM Authors
WHERE Birthday IS NOT NULL;

-- 34. Общая сумма поставок от ‘ЗАО Оптторг’
SELECT SUM(p.Cost * p.Amount) AS total_sum
FROM Purchases p
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery
WHERE d.Name_company = 'ЗАО Оптторг';

-- 35. Общее количество поставок за период
SELECT COUNT(*) AS total_purchases
FROM Purchases
WHERE Date_order BETWEEN '2003-01-01' AND '2003-02-01';

-- 36. Средняя цена и количество для автора ‘Акунин’
SELECT AVG(p.Cost) AS avg_cost, AVG(p.Amount) AS avg_amount
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
JOIN Authors a ON b.Code_author = a.Code_author
WHERE a.name_author LIKE '%Акунин%';

-- 37. Поставка с минимальной общей стоимостью
SELECT p.*, b.Title_book, (p.Cost * p.Amount) AS total_cost
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
ORDER BY total_cost ASC
LIMIT 1;

-- 38. Поставка с максимальной общей стоимостью
SELECT p.*, b.Title_book, (p.Cost * p.Amount) AS total_cost -- AS создает новый столбец под названием total_cost  
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
ORDER BY total_cost DESC -- ORDER BY сортировка asc по возвр desc по убыв
LIMIT 1; -- limit вывод только 1 записи

-- 39. Суммарная стоимость → Itogo (за период)
SELECT b.Title_book, (p.Amount * p.Cost) AS Itogo
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Date_order BETWEEN '2002-01-01' AND '2002-06-01';

-- 40. Стоимость страницы → One_page
SELECT b.Title_book, (p.Cost / b.Pages) AS One_page
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE b.Pages > 0;

-- 41. Общая сумма  Sum_cost от ‘ОАО Луч’
SELECT SUM(p.Cost * p.Amount) AS Sum_cost
FROM Purchases p
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery
WHERE d.Name_company = 'ОАО Луч';

-- 42. Обновить Pages = 300 для автора 56 и книги ‘Мемуары’
UPDATE Books
SET Pages = 300
WHERE Code_author = 56 AND Title_book = 'Мемуары';

-- 43. Заменить пустой Address на ‘нет сведений’
UPDATE Deliveries
SET Address = 'нет сведений'
WHERE Address IS NULL OR Address = '';

-- 44. Увеличить Cost на 20% за последний месяц
UPDATE Purchases
SET Cost = Cost * 1.2
WHERE Date_order >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 45. Добавить запись в Purchases (Type_purchase = 1 как "опт")
INSERT INTO Purchases (Code_book, Date_order, Code_delivery, Type_purchase, Cost, Amount)
VALUES (1, NOW(), 1, 1, 100.0, 50);

-- 46. Добавить книгу ‘Наука. Техника. Инновации’
INSERT INTO Books (Title_book, Code_author, Pages, Code_publish)
VALUES ('Наука. Техника. Инновации', 1, 200, 1);

-- 47. Добавить издательство ‘Наука’, Москва
INSERT INTO Publishing_house (Publish, City)
VALUES ('Наука', 'Москва');

-- 48. Удалить записи с Amount = 0
DELETE FROM Purchases
WHERE Amount = 0;

-- 49. Удалить авторов без имени
DELETE FROM Authors
WHERE name_author IS NULL OR name_author = '';

-- 50. Удалить поставщиков без ИНН
DELETE FROM Deliveries
WHERE INN IS NULL OR INN = '';


