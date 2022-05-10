SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers 

LEFT JOIN mhl_yn_properties
ON mhl_suppliers.ID = mhl_yn_properties.supplier_ID

INNER JOIN mhl_propertytypes AS propertytypes
ON mhl_yn_properties.propertytype_ID = propertytypes.ID

WHERE propertytypes.name = "specialistische leverancier"
