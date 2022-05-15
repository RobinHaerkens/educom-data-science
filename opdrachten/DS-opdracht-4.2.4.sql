SELECT mhl_suppliers.name, mhl_cities.name AS "Stad", mhl_propertytypes.name, IFNULL(mhl_yn_properties.content,"NOT SET") AS value
FROM mhl_suppliers

JOIN mhl_propertytypes

LEFT JOIN mhl_yn_properties 
ON mhl_suppliers.id = mhl_yn_properties.supplier_ID AND
mhl_propertytypes.id = mhl_yn_properties.propertytype_ID

LEFT JOIN mhl_cities
ON mhl_cities.id = mhl_suppliers.city_ID

WHERE mhl_cities.name = "Amsterdam"