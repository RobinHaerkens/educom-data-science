SELECT
v_rubrieken.rubriek,
IFNULL(
	(SELECT SUM(mhl_hitcount.hitcount) AS total
	FROM mhl_hitcount
    LEFT JOIN mhl_hitcount AS hc
    ON hc.supplier_ID = v_rubrieken.id)
, 'Geen hits') AS "Totaal"
FROM
v_rubrieken