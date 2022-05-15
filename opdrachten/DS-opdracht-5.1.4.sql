SELECT mhl_suppliers.name,  sum(hitcount), count(month), sum(hitcount)/count(month)
FROM mhl_hitcount 

LEFT JOIN mhl_suppliers
ON mhl_suppliers.id = mhl_hitcount.supplier_ID
GROUP BY supplier_id
ORDER BY sum(hitcount) desc

