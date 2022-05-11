SELECT mhl_cities.name AS "Stad", IFNULL(mhl_communes.name, "INVALID") AS "Gemeente"
FROM mhl_cities

LEFT JOIN mhl_communes
ON mhl_cities.commune_id = mhl_communes.id 


