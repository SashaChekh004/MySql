SELECT region, SUM(population) AS population FROM cities GROUP BY region;

SELECT region, SUM(population) AS population FROM cities 
GROUP BY region
HAVING COUNT(name) >= 10;

SELECT name, population
FROM cities
WHERE region IN (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(*) >= 5
)
ORDER BY population ASC
LIMIT 5 OFFSET 10;

SELECT region, SUM(population) AS population FROM cities
WHERE population > 300000
GROUP BY region;

SELECT name, population FROM cities
WHERE population NOT BETWEEN 150000 AND 500000 AND region 
IN (SELECT uuid FROM regions WHERE area_quantity <=5 );