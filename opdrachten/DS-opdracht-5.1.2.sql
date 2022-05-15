SELECT count(supplier_ID), max(hitcount), min(hitcount), avg(hitcount), sum(hitcount)
FROM mhl_hitcount 
GROUP BY year


