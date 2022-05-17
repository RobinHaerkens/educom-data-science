SELECT mhl_suppliers.name AS "leverancier", 
IFNULL(mhl_contacts.name,"Tav Directie") AS "aanhef",
IF(mhl_suppliers.p_address = "", mhl_suppliers.straat, mhl_suppliers.p_address) AS "Adres",
mhl_suppliers.postcode AS "postcode", mhl_cities.name AS "Stad", mhl_districts.name AS "Provincie"
FROM mhl_suppliers

LEFT JOIN mhl_contacts
ON mhl_suppliers.ID = mhl_contacts.supplier_ID AND mhl_contacts.department=3

LEFT JOIN mhl_cities
ON mhl_cities.id = mhl_suppliers.city_ID

LEFT JOIN mhl_communes
ON mhl_communes.id = mhl_cities.commune_ID

LEFT JOIN mhl_districts
ON mhl_districts.id = mhl_communes.district_ID

WHERE postcode <> ''
ORDER BY mhl_districts.name, mhl_cities.name, mhl_suppliers.name