SELECT * from cities ORDER BY population DESC LIMIT 10 OFFSET 10
SELECT * from cities ORDER BY name DESC LIMIT 30
SELECT * from cities ORDER BY region, population DESCSELECT * from cities ORDER BY region, population DESC
SELECT DISTINCT region from cities
SELECT name, region FROM cities ORDER BY region DESC, name DESC