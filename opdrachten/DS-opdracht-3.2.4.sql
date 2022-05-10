SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers 
	LEFT JOIN mhl_cities AS stad
	ON mhl_suppliers.city_id = stad.ID 
    LEFT JOIN mhl_cities AS postbus
    ON mhl_suppliers.p_city_ID = postbus.ID
	WHERE stad.name = "Amsterdam"  OR  postbus.name = "Den Haag"

