SELECT UPPER(name) FROM cities LIMIT 5 OFFSET 5;

SELECT name, CHAR_LENGTH(name) AS cityNameLength FROM cities
WHERE CHAR_LENGTH(name) NOT IN (8, 9, 10);

SELECT SUM(population) FROM cities WHERE region IN ('S', 'C');

SELECT ROUND(AVG(population), 0) FROM cities WHERE region IN ('W');

SELECT COUNT(*) FROM cities WHERE region IN ('E');