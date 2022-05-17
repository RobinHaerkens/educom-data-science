/*
CREATE VIEW v_rubrieken AS
SELECT
IFNULL(rubChild.id, rubParent.id) as id,
IF(ISNULL(rubParent.name), rubChild.name, CONCAT(rubParent.name, ' - ', rubChild.name)) AS
rubriek,
IFNULL(rubParent.name, rubChild.name) AS "hoofdrubriek",
IF(ISNULL(rubParent.name), ' ', rubChild.name) AS "subrubriek"
FROM
mhl_rubrieken AS rubParent
RIGHT OUTER JOIN
mhl_rubrieken AS rubChild ON rubChild.parent = rubParent.id
ORDER BY
Rubriek;
*/

SELECT
v_rubrieken.rubriek,
(SELECT
COUNT(mhl_suppliers_ID)
FROM mhl_suppliers_mhl_rubriek_view
WHERE mhl_rubriek_view_ID = v_rubrieken.id) AS "aantal suppliers"
FROM v_rubrieken
ORDER BY rubriek
