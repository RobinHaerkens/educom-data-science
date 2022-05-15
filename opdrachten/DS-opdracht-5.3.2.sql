CREATE VIEW v_VERZENDLIJST AS
SELECT mhl_suppliers.id, IF(mhl_suppliers.p_address = "", (mhl_suppliers.straat + " " + mhl_suppliers.huisnr), mhl_suppliers.p_address) AS "Adres", 
mhl_suppliers.postcode AS "postcode",
CASE
	WHEN mhl_suppliers.p_address IS NULL THEN  mhl_suppliers.city_ID
	ELSE mhl_suppliers.p_city_ID
	END AS "Adres"


FROM mhl_suppliers

LEFT JOIN mhl_cities
ON mhl_cities.id = mhl_suppliers.city_ID