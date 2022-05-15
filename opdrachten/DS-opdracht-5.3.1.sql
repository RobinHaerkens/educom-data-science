CREATE VIEW v_DIRECTIE AS
SELECT mhl_contacts.supplier_ID as "ID", mhl_contacts.name AS "Contact", mhl_contacts.contacttype AS "functie", mhl_departments.name AS "department"
from mhl_contacts

LEFT JOIN mhl_departments
ON mhl_contacts.department = mhl_departments.id

WHERE mhl_contacts.contacttype LIKE "%directeur%" OR mhl_departments.name = "Directie"