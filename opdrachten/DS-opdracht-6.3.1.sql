SELECT mhl_cities.name,
CASE 
WHEN name LIKE '\'%'
	THEN CONCAT(SUBSTRING(mhl_cities.name, 1, 2), UPPER(SUBSTRING(mhl_cities.name,3, 2)), SUBSTRING(name, 5))
	ELSE
	CONCAT(UPPER(SUBSTRING(mhl_cities.name,1,1)),SUBSTRING(mhl_cities.name,2)) 
    END
    AS "Nice Name"
FROM mhl_cities
ORDER BY mhl_cities.name