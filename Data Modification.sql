/* DATA AND DATATYPE MODIFICATION ACTIVITY */

SELECT * FROM employee_data;

UPDATE employee_data
SET `Date of Birth` = STR_TO_DATE(`Date of Birth`, '%d-%m-%Y');

ALTER TABLE employee_data
MODIFY `Date of Birth` DATE;

select * from employee_data;

set sql_safe_updates = 0;

UPDATE employee_data
SET `Date of Joining` = NULL
WHERE `Date of Joining` = '';

UPDATE employee_data
SET `Date of Joining` = STR_TO_DATE(`Date of Joining`, '%d-%m-%Y')
WHERE `Date of Joining` IS NOT NULL;

ALTER TABLE employee_data
MODIFY `Date of Joining` DATE;

UPDATE employee_data
SET EmployeeStatus  = NULL
WHERE EmployeeStatus = "";

UPDATE employee_data
SET EmployeeStatus = "ACTIVE"
WHERE EmployeeStatus IS NULL;

UPDATE employee_data
SET MOBILE = null
WHERE Department = 'IT';

UPDATE employee_data
SET Quarter = "Q1"
WHERE `Staff Type` = "NG-VACATIONAL";

UPDATE employee_data
SET Quarter = "Q2"
WHERE `Staff Type` = "NG-NON-VACATIONAL";



