SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers 
	LEFT JOIN mhl_membertypes AS membertypes
    ON mhl_suppliers.membertype = membertypes.id
	WHERE membertypes.name = "Gold" OR membertypes.name = "Silver" OR membertypes.name = "Bronze" 
    OR membertypes.name = "GEEN INTERRESSE"

