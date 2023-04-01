SELECT name from cities WHERE name LIKE '%ськ';

SELECT name from cities WHERE name LIKE '%донец%';

SELECT CONCAT(name, ' (', region, ')') FROM cities
WHERE population > 100000
ORDER BY name;


SELECT 
name, population, CONCAT(ROUND((population / 40000000) * 100, 2) , '%') 
AS percent_from_total  
FROM cities
ORDER BY population DESC
LIMIT 50;

SELECT
CONCAT(name, ' - ', round((population / 40000000) * 100, 2), '%') 
FROM cities
ORDER BY round((population / 40000000) * 100, 2) ASC
LIMIT 50;