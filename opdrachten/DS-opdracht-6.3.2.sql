SELECT mhl_suppliers.name,
REPLACE(
	REPLACE(
		REPLACE(
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(name, "&Uuml;", "Ü"),
					"&eacute;", "é"),
				"&euml;" ,"ë" ),
			"&ouml;", "ö"),
		"&egrave;", "è"),
	"&iuml;", "ï"),
"&acirc;", "â")
AS "Nice Name"
FROM mhl_suppliers
WHERE  name LIKE "%&%;%"
LIMIT 25