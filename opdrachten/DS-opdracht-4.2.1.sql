SELECT mhl_cities.name, mhl_cities.commune_ID
FROM mhl_cities

LEFT JOIN mhl_communes
ON mhl_cities.commune_id = mhl_communes.id 

WHERE ISNULL(mhl_communes.name)
