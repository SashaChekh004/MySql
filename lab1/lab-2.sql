SELECT name FROM cities WHERE population >= 1000000;
SELECT name FROM cities WHERE region IN('E', 'W') ORDER BY population DESC ;
SELECT name FROM cities WHERE region IN('S', 'C', 'N') AND population > 50000;
SELECT name FROM cities WHERE population BETWEEN 150000 AND 350000 AND region IN('E', 'W', 'N') ORDER BY name LIMIT 20;
SELECT name FROM cities WHERE NOT region IN ('E', 'W') ORDER BY population DESC LIMIT 10 OFFSET 10;