SELECT mhl_communes.name AS "Gemeente",
mhl_suppliers.name AS "Leverancier",
(SELECT
SUM(mhl_hitcount.hitcount) AS "total_hitcount"
FROM mhl_hitcount
WHERE mhl_hitcount.supplier_ID = mhl_suppliers.id) AS total_hitcount,
(SELECT
avg(mhl_hitcount.hitcount) AS "average_hitcount"
FROM mhl_hitcount
WHERE mhl_hitcount.supplier_ID = mhl_suppliers.id) AS avg_hitcount
FROM mhl_suppliers

LEFT JOIN mhl_cities
ON mhl_suppliers.city_id = mhl_cities.id

INNER JOIN mhl_communes
ON mhl_cities.commune_id = mhl_communes.id


GROUP BY mhl_suppliers.name
HAVING total_hitcount  > avg_hitcount
ORDER BY mhl_communes.name, (total_hitcount - avg_hitcount) DESC