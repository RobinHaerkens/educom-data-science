SELECT
DAYNAME(joindate) AS "Dag van de Week",
count(id)

FROM mhl_suppliers
GROUP by DAYNAME(joindate)
ORDER BY DAYOFWEEK(joindate)