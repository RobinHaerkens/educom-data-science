SELECT C1.name AS "C1_Name", C2.name AS "C2_Name", C1.id AS "C1_ID", C2.id AS "C2_ID", G1.id AS "gemeente_id1", G2.id AS "gemeente_id2", G1.name AS gemeente_1, G2.name AS gemeente_2 
FROM mhl_cities C1, mhl_cities C2

JOIN mhl_communes AS G1 ON C1.commune_id=G1.id 
JOIN mhl_communes AS G2 ON C2.commune_id=G2.id 

WHERE C1.name = C2.name AND C1.id < C2.id AND NOT C1.commune_ID = 0
ORDER BY C1.name
