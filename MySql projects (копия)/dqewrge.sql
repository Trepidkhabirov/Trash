-- Вывести информацию о количестве авторов по каждому поставщику
SELECT deliveries.`Name_delivery`, COUNT(authors.`Code_author`) AS Count
FROM deliveries
JOIN purchases ON purchases.`Code_delivery` = deliveries.`Code_delivery`
JOIN books ON books.`Code_book` = purchases.`Code_book`
JOIN authors ON authors.`Code_author` = books.`Code_author`
GROUP BY deliveries.`Name_delivery`
order by Count DESC

-- Вывести информацию о количестве авторов по каждому издателю
SELECT publishing_house.`Publish`, COUNT(authors.`Code_author`)
FROM publishing_house
JOIN books ON publishing_house.`Code_publish` = books.`Code_publish`
JOIN authors ON books.`Code_author` = authors.`Code_author`
GROUP BY publishing_house.`Publish`

-- Вывести книги выпускаемые в Уфе
SELECT books.`title_book`, publishing_house.`City`
FROM publishing_house
JOIN books ON publishing_house.`Code_publish` = books.`Code_publish`
WHERE publishing_house.`City` = 'Уфа'



