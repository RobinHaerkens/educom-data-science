SELECT
DATE_FORMAT(joindate, GET_FORMAT(DATE,'EUR')) AS "JoinDate",
ID,
DATEDIFF(CURDATE(), joindate) AS Dagen_Lid
FROM mhl_suppliers
ORDER BY Dagen_lid ASC
