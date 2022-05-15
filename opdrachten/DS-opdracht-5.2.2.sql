SELECT mhl_cities.name, sum(mhl_membertypes.name = "Gold") AS "Gold", sum(mhl_membertypes.name = "Silver") AS "Silver",sum(mhl_membertypes.name = "Bronze") AS "Bronze",
count(mhl_membertypes.name) - (sum(mhl_membertypes.name = "Gold") + sum(mhl_membertypes.name = "Silver") + sum(mhl_membertypes.name = "Bronze")) AS "Other"
FROM mhl_suppliers

RIGHT JOIN mhl_membertypes
ON mhl_membertypes.id = mhl_suppliers.membertype
LEFT JOIN mhl_cities
ON mhl_suppliers.city_ID = mhl_cities.id 

Group By mhl_cities.name
ORDER BY sum(mhl_membertypes.name = "Gold") DESC, sum(mhl_membertypes.name = "Silver") DESC, sum(mhl_membertypes.name = "Bronze") DESC