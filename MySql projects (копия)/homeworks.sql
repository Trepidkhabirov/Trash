-- ========================================
-- 50 ЗАПРОСОВ: БИБЛИОТЕКА (PostgreSQL)
-- Таблицы: Books, Authors, Publishing_house, Deliveries, Purchases
-- ========================================

-- 1. Сортировка по коду книги
SELECT * FROM Books
ORDER BY Code_book;

-- 2. По названию (ASC) и страницам (DESC)
SELECT Code_book, Title_book, Pages
FROM Books
ORDER BY Title_book ASC, Pages DESC;

-- 3. Поставщики по INN (по убыванию)
SELECT Name_delivery, Phone, INN
FROM Deliveries
ORDER BY INN DESC;

-- 4. Порядок полей: Deliveries
SELECT Name_delivery, INN, Phone, Address, Code_delivery
FROM Deliveries;

-- 5. Порядок полей: Publishing_house
SELECT Publish, City, Code_publish
FROM Publishing_house;

-- 6. Книги + автор
SELECT b.Title_book, b.Pages, a.Name_author
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author;

-- 7. Книги + поставщик
SELECT b.Title_book, b.Pages, d.Name_delivery
FROM Books b
JOIN Purchases p ON b.Code_book = p.Code_book
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery;

-- 8. Книги + издательство и город
SELECT b.Title_book, b.Pages, ph.Publish, ph.City
FROM Books b
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish;

-- 9. Поставщики, начинающиеся с 'ОАО'
SELECT Name_company, Phone, INN
FROM Deliveries
WHERE Name_company LIKE 'ОАО%';

-- 10. Книги с 'Мемуары' + автор
SELECT b.Title_book, b.Pages, a.Name_author
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author
WHERE b.Title_book LIKE 'Мемуары%';

-- 11. Авторы, начинающиеся с 'Иванов'
SELECT Name_author
FROM Authors
WHERE Name_author LIKE 'Иванов%';

-- 12. Издательства НЕ в Москве
SELECT Publish
FROM Publishing_house
WHERE City != 'Москва';

-- 13. Книги НЕ от 'Питер-Софт'
SELECT b.Title_book
FROM Books b
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish != 'Питер-Софт';

-- 14. Авторы: 1840–1860
SELECT Name_author
FROM Authors
WHERE Birthday BETWEEN '1840-01-01' AND '1860-06-01';

-- 15. Закупки: 12.03.2003 – 15.06.2003
SELECT b.Title_book, p.Amount
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Date_order BETWEEN '2003-03-12' AND '2003-06-15';

-- 16. Книги: 200–300 страниц
SELECT Title_book, Pages
FROM Books
WHERE Pages BETWEEN 200 AND 300;

-- 17. Авторы: фамилия от 'В' до 'Г'
SELECT Name_author
FROM Authors
WHERE SUBSTRING(Name_author FROM 1 FOR 1) BETWEEN 'В' AND 'Г';

-- 18. Поставки от кодов 3,7,9,11
SELECT b.Title_book, p.Amount
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Code_delivery IN (3, 7, 9, 11);

-- 19. Книги издательств: Питер-Софт, Альфа, Наука
SELECT b.Title_book
FROM Books b
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish IN ('Питер-Софт', 'Альфа', 'Наука');

-- 20. Книги авторов: Толстой, Достоевский, Пушкин
SELECT b.Title_book
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author
WHERE a.Name_author IN ('Толстой Л.Н.', 'Достоевский Ф.М.', 'Пушкин А.С.');

-- 21. Авторы на 'К'
SELECT Name_author
FROM Authors
WHERE Name_author LIKE 'К%';

-- 22. Издательства с 'софт'
SELECT Publish
FROM Publishing_house
WHERE Publish ILIKE '%софт%';

-- 23. Поставщики, оканчиваются на 'ский'
SELECT Name_company
FROM Deliveries
WHERE Name_company LIKE '%ский';

-- 24. Amount > 100 ИЛИ Cost 200–500
SELECT p.Code_delivery, p.Date_order, b.Title_book
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Amount > 100 OR (p.Cost BETWEEN 200 AND 500);

-- 25. Code_publish 10–25 И Pages > 120
SELECT a.Code_author, a.Name_author, b.Title_book
FROM Books b
JOIN Authors a ON b.Code_author = a.Code_author
WHERE b.Code_publish BETWEEN 10 AND 25 AND b.Pages > 120;

-- 26. 'Труды' + Новосибирск
SELECT ph.Publish
FROM Publishing_house ph
JOIN Books b ON ph.Code_publish = b.Code_publish
WHERE b.Title_book LIKE 'Труды%' AND ph.City = 'Новосибирск';

-- 27. Поставщики + книги 2002–2003
SELECT d.Name_company, b.Title_book
FROM Deliveries d
JOIN Purchases p ON d.Code_delivery = p.Code_delivery
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Date_order BETWEEN '2002-01-01' AND '2003-12-31';

-- 28. Авторы из 'Мир'
SELECT a.Name_author
FROM Authors a
JOIN Books b ON a.Code_author = b.Code_author
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish = 'Мир';

-- 29. Поставщики книг 'Питер'
SELECT DISTINCT d.Name_company
FROM Deliveries d
JOIN Purchases p ON d.Code_delivery = p.Code_delivery
JOIN Books b ON p.Code_book = b.Code_book
JOIN Publishing_house ph ON b.Code_publish = ph.Code_publish
WHERE ph.Publish = 'Питер';

-- 30. Авторы книг от 'ОАО Книготорг'
SELECT a.Name_author, b.Title_book
FROM Authors a
JOIN Books b ON a.Code_author = b.Code_author
JOIN Purchases p ON b.Code_book = p.Code_book
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery
WHERE d.Name_company = 'ОАО Книготорг';

-- 31. Суммарная стоимость партии
SELECT b.Title_book, (p.Amount * p.Cost) AS Total_cost
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book;

-- 32. Цена за страницу
SELECT b.Title_book, (p.Cost / b.Pages) AS Cost_per_page
FROM Books b
JOIN Purchases p ON b.Code_book = p.Code_book;

-- 33. Возраст авторов
SELECT Name_author, EXTRACT(YEAR FROM AGE(CURRENT_DATE, Birthday)) AS Age_years
FROM Authors;

-- 34. Общая сумма 'ЗАО Оптторг'
SELECT SUM(p.Cost * p.Amount) AS Total_from_Opttorg
FROM Purchases p
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery
WHERE d.Name_company = 'ЗАО Оптторг';

-- 35. Кол-во поставок янв-фев 2003
SELECT COUNT(*) AS Deliveries_Jan_Feb_2003
FROM Purchases
WHERE Date_order BETWEEN '2003-01-01' AND '2003-02-01';

-- 36. Средние Cost и Amount у Акунина
SELECT
    AVG(p.Cost) AS Avg_cost,
    AVG(p.Amount) AS Avg_amount
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
JOIN Authors a ON b.Code_author = a.Code_author
WHERE a.Name_author ILIKE '%Акунин%';

-- 37. Поставка с минимальной стоимостью
SELECT p.*, b.Title_book
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE (p.Amount * p.Cost) = (
    SELECT MIN(Amount * Cost) FROM Purchases
);

-- 38. Поставка с максимальной стоимостью
SELECT p.*, b.Title_book
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE (p.Amount * p.Cost) = (
    SELECT MAX(Amount * Cost) FROM Purchases
);

-- 39. Itogo: 2002–06
SELECT b.Title_book, (p.Amount * p.Cost) AS Itogo
FROM Purchases p
JOIN Books b ON p.Code_book = b.Code_book
WHERE p.Date_order BETWEEN '2002-01-01' AND '2002-06-30';

-- 40. One_page
SELECT b.Title_book, (p.Cost / NULLIF(b.Pages, 0)) AS One_page
FROM Books b
JOIN Purchases p ON b.Code_book = p.Code_book;

-- 41. Sum_cost от 'ОАО Луч'
SELECT SUM(p.Cost * p.Amount) AS Sum_cost
FROM Purchases p
JOIN Deliveries d ON p.Code_delivery = d.Code_delivery
WHERE d.Name_company = 'ОАО Луч';

-- 42. UPDATE: Pages = 300
UPDATE Books
SET Pages = 300
WHERE Code_author = 56 AND Title_book = 'Мемуары';

-- 43. UPDATE: Address = 'нет сведений'
UPDATE Deliveries
SET Address = 'нет сведений'
WHERE Address IS NULL OR TRIM(Address) = '';

-- 44. UPDATE: +20% за последний месяц
UPDATE Purchases
SET Cost = Cost * 1.20
WHERE Date_order >= (CURRENT_DATE - INTERVAL '1 month');

-- 45. INSERT: Code_purchase +1, Type_purchase = 'опт'
INSERT INTO Purchases (Code_purchase, Type_purchase)
VALUES (
    (SELECT COALESCE(MAX(Code_purchase), 0) + 1 FROM Purchases),
    'опт'
);

-- 46. INSERT: Code_book +1, Title_book = 'Наука...'
INSERT INTO Books (Code_book, Title_book)
VALUES (
    (SELECT COALESCE(MAX(Code_book), 0) + 1 FROM Books),
    'Наука. Техника. Инновации'
);

-- 47. INSERT: Code_ publish +1, City='Москва', Publish='Наука'
INSERT INTO Publishing_house (Code_publish, City, Publish)
VALUES (
    (SELECT COALESCE(MAX(Code_publish), 0) + 1 FROM Publishing_house),
    'Москва',
    'Наука'
);

-- 48. DELETE: Amount = 0
DELETE FROM Purchases
WHERE Amount = 0;

-- 49. DELETE: Name_author пустое
DELETE FROM Authors
WHERE Name_author IS NULL OR TRIM(Name_author) = '';

-- 50. DELETE: INN пустой
DELETE FROM Deliveries
WHERE INN IS NULL OR TRIM(INN) = '';