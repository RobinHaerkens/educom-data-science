CREATE OR REPLACE VIEW V_total_hitcount AS
SELECT 
mhl_communes.id As "ID",
mhl_communes.name AS "Commune",
mhl_suppliers.name AS "Supplier",
SUM(mhl_hitcount.hitcount) AS "total_hitcount"
FROM mhl_suppliers

LEFT JOIN mhl_cities
ON mhl_suppliers.city_id = mhl_cities.id
INNER JOIN mhl_communes
ON mhl_cities.commune_id = mhl_communes.id
LEFT JOIN mhl_hitcount
ON mhl_hitcount.supplier_id = mhl_suppliers.id
GROUP BY mhl_communes.name, mhl_suppliers.name;

CREATE OR REPLACE VIEW v_average_hitcount AS
SELECT 
mhl_communes.id As "ID",
mhl_communes.name AS "Commune",
avg(mhl_hitcount.hitcount) AS "average_hitcount"
FROM mhl_suppliers

LEFT JOIN mhl_cities
ON mhl_suppliers.city_id = mhl_cities.id
INNER JOIN mhl_communes
ON mhl_cities.commune_id = mhl_communes.id
LEFT JOIN mhl_hitcount
ON mhl_hitcount.supplier_id = mhl_suppliers.id
GROUP BY mhl_communes.name;

SELECT
v_total_hitcount.Commune AS "Gemeente", 
v_total_hitcount.Supplier AS "Leverancier",
v_total_hitcount.total_hitcount,
v_average_hitcount.average_hitcount
FROM
v_total_hitcount

LEFT JOIN v_average_hitcount
ON v_total_hitcount.ID = v_average_hitcount.ID

HAVING total_hitcount  > average_hitcount
ORDER BY v_average_hitcount.Commune, (total_hitcount - average_hitcount) DESC;

DROP VIEW IF EXISTS v_total_hitcount;
DROP VIEW IF EXISTS v_average_hitcount;