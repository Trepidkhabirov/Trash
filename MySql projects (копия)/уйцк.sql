-- Вывести информацию о количестве авторов по каждому издателю
SELECT publishing_house.`Publish`, COUNT(authors.`Code_author`) AS Count
FROM publishing_house
JOIN books ON books.`Code_publish` = publishing_house.`Code_publish`
JOIN authors ON authors.`Code_author` = books.`Code_author`
GROUP BY publishing_house.`Publish`
ORDER BY Count ASC
