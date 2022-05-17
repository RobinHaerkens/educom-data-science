DELIMITER $$

CREATE PROCEDURE p_get_office_by_country(
IN countryName VARCHAR(255)
)
BEGIN


SELECT officeCode, city, country
FROM sales_database.offices
WHERE country = countryName;

END$$

DELIMITER ;