-- Вывести сведения об авторах, книги которых наиболее покупаемые
use homework

SELECT authors.`name_author`, COUNT(books.`Code_book`) AS Count
FROM authors
JOIN books ON authors.`Code_author` = books.`Code_author`
GROUP BY authors.`name_author`
ORDER BY Count DESC

