SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode, mhl_cities.name
FROM mhl_suppliers 
LEFT JOIN mhl_cities 
ON mhl_suppliers.city_ID = mhl_cities.ID
LEFT JOIN mhl_communes
ON mhl_cities.commune_ID = mhl_communes.ID
WHERE mhl_communes.name = "Steenwijkerland"