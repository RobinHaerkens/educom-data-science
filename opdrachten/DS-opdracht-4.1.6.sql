SELECT mhl_hitcount.hitcount, mhl_suppliers.name, mhl_cities.name AS Stad, mhl_communes.name AS Gemeente, mhl_districts.name AS Provincie 
FROM mhl_suppliers

LEFT JOIN mhl_hitcount
ON mhl_suppliers.ID = mhl_hitcount.supplier_ID

LEFT JOIN mhl_cities
ON mhl_suppliers.city_ID = mhl_cities.ID
LEFT JOIN mhl_communes
ON mhl_cities.commune_ID = mhl_communes.ID
LEFT JOIN mhl_districts
ON mhl_communes.district_ID = mhl_districts.ID

WHERE (mhl_hitcount.year = 2014 AND mhl_hitcount.month = 1) AND (mhl_districts.name = "Zeeland" OR mhl_districts.name = "Noord-Brabant"  OR mhl_districts.name = "Limburg" )

