CREATE VIEW v_VERZENDLIJST AS
SELECT mhl_suppliers.id, 
IF(mhl_suppliers.p_address = "", CONCAT(mhl_suppliers.straat,' ',mhl_suppliers.huisnr), mhl_suppliers.p_address) AS "Adres", 
mhl_suppliers.postcode AS "postcode",
mhl_cities.name AS "stad"



FROM mhl_suppliers

LEFT JOIN mhl_cities
ON mhl_cities.id = mhl_suppliers.city_ID