SELECT year As "Jaar", 
SUM(IF (month IN ('1','2','3'),hitcount,0) ) AS "Eerste kwartaal",
SUM(IF (month IN ('4','5','6'),hitcount,0) ) AS "Tweede kwartaal",
SUM(IF (month IN ('7','8','9'),hitcount,0) ) AS "Derde kwartaal",
SUM(IF (month IN ('10','11','12'), hitcount, 0)) AS "Vierde kwartaal",
SUM(hitcount) As "Totaal"
FROM mhl_hitcount 
GROUP BY year


