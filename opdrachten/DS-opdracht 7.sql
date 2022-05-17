/* 1. */ /*ALTER TABLE employees
ADD COLUMN salary varchar(15) AFTER jobTitle,
ADD COLUMN date_hired varchar(15) AFTER salary,
ADD COLUMN date_fired varchar(15) AFTER date_hired;*/

/* 2.  */ /*UPDATE employees
SET salary = 10000, date_hired = '2022-10-02', date_fired = NULL*/



/* 3. */ /*
CREATE TABLE employeeArchive(
id INT NOt NULL primary key auto_increment,
employeeNumber INT,
date_hired DATE NOT NULL,
date_fired DATE NOT NULL,
FOREIGN KEY (employeeNumber) REFERENCES employees(employeeNumber));
*/

/*DROP TRIGGER IF EXISTS fired_aur
DELIMITER $$

CREATE TRIGGER fired_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN
	IF OLD.date_fired IS NOT NULL THEN
		INSERT INTO employeeArchive(employeeNumber, date_hired, date_fired)
		VALUES(old.employeeNumber, old.date_hired, old.date_fired);
	END IF;
END$$

DELIMITER ; 


UPDATE employees
SET date_fired = NULL
WHERE employeeNumber = 1056; */


/* 4 */ /*
DROP FUNCTION IF EXISTS f_fired;

DELIMITER $$

CREATE FUNCTION f_fired(
    date_fired DATE 
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
   DECLARE FiredStatus varchar(20);
   
   IF date_fired IS NOT NULL THEN
   SET FiredStatus = "FIRED";
   ELSE  
   SET FiredStatus = "";
   END IF ;
    
    RETURN (FiredStatus);
END$$

DELIMITER ; 
*/
/* 5 */ /*
CREATE VIEW v_FIRED AS
SELECT employeeNumber, f_fired(date_fired)
FROM employees 
*/

/* 6 *//*
DROP PROCEDURE IF EXISTS p_raise;

DELIMITER $$
CREATE PROCEDURE p_raise()
BEGIN 
UPDATE employees SET salary = CAST(salary * 1.05 AS UNSIGNED);

END$$
DELIMITER ;

 call p_raise();
 */
 
 /* 7 *//*
 DROP PROCEDURE IF EXISTS p_removeFired;

DELIMITER $$
CREATE PROCEDURE p_removeFired()
BEGIN 
DELETE FROM employees
WHERE date_fired IS NOT NULL;

END$$
DELIMITER ;


 call p_removeFired();
 */
 
 /* 8 *//*
 CREATE TABLE salaryArchive(
id INT NOt NULL primary key auto_increment,
employeeNumber INT,
beforeSalary INT,
AfterSalary INT,
changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS salalry_aur
DELIMITER $$

CREATE TRIGGER salary_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN
    IF OLD.salary <> new.salary THEN
        INSERT INTO salaryArchive(employeeNumber,beforeSalary, afterSalary)
        VALUES(old.employeeNumber, old.salary, new.salary);
    END IF;
END$$

DELIMITER ;

UPDATE employees SET salary = 15500 WHERE employeeNumber = 1076;
*/