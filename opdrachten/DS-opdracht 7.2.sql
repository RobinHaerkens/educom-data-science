DELIMITER $$

CREATE PROCEDURE p_get_total_order_per_customer()
BEGIN
    
    SELECT COUNT(*), customerName
    FROM orders
    
	LEFT JOIN customers
    ON customers.customerNumber = orders.customerNumber
    
    GROUP BY customerName;
    
END$$

DELIMITER ;