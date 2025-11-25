/* Stored Procedure */

DELIMITER //

CREATE PROCEDURE ShowAllEmployees()
BEGIN
		SELECT * FROM employee_data;
END //

DELIMITER ;

CALL ShowAllEmployees();