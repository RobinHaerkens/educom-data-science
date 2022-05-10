SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers 
LEFT JOIN mhl_cities as stadsnaam
ON mhl_suppliers.city_ID = stadsnaam.ID 
WHERE stadsnaam.name = "Amsterdam"