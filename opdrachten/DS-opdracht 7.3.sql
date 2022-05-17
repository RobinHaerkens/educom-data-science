DROP PROCEDURE IF EXISTS p_create_customerOrder;

DELIMITER $$
CREATE PROCEDURE p_create_customerOrder (
    INOUT customerList varchar(4000)
)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE customer varchar(100) DEFAULT "";
    DECLARE orders varchar(100) DEFAULT "";

    -- declare cursor for employee email
    DEClARE curCustomer
        CURSOR FOR 
			SELECT COUNT(*), customerName
			FROM orders
			
			LEFT JOIN customers
			ON customers.customerNumber = orders.customerNumber
			
			GROUP BY customerName;
    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

    OPEN curCustomer;

    getCustomer: LOOP
        FETCH curCustomer INTO customer, orders;
        IF finished = 1 THEN 
            LEAVE getCustomer;
        END IF;
        -- build email list
        SET customerList = CONCAT(customer,':',orders,";",customerList);
    END LOOP getCustomer;
    CLOSE curCustomer;

END$$
DELIMITER ;