SELECT RubriekChild.ID,
IFNULL(RubriekParent.name, RubriekChild.name) AS "Hoofdrubriek", 
IF(ISNULL(RubriekParent.name), "", RubriekChild.name) AS "Subrubriek"
FROM mhl_rubrieken AS RubriekParent

RIGHT JOIN mhl_rubrieken AS RubriekChild 
ON RubriekChild.parent = RubriekParent.id
	
ORDER BY Hoofdrubriek, Subrubriek