SELECT mhl_suppliers.name,
IFNULL(v_directie.contact, "tav de Directie") AS "Contact",
v_verzendlijst.Adres,
v_verzendlijst.postcode,
v_verzendlijst.stad
FROM
mhl_suppliers


LEFT JOIN v_verzendlijst
ON v_verzendlijst.ID = mhl_suppliers.ID
LEFT JOIN v_directie
ON v_directie.ID = mhl_suppliers.ID 
