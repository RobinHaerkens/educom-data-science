SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode, mhl_rubrieken.name
FROM mhl_suppliers 

LEFT JOIN mhl_cities 
ON mhl_suppliers.city_ID = mhl_cities.ID

	LEFT JOIN mhl_suppliers_mhl_rubriek_view
	ON mhl_suppliers.ID = mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID
	LEFT JOIN mhl_rubrieken
	ON mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID = mhl_rubrieken.ID
    
	LEFT JOIN mhl_rubrieken as subrubriek
    ON mhl_rubrieken.parent = subrubriek.ID
	
WHERE mhl_cities.name = "Amsterdam" AND (mhl_rubrieken.name = "drank" OR subrubriek.name = "drank")
ORDER BY mhl_rubrieken.name, mhl_suppliers.name