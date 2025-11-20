/* DATA AND DATATYPE MODIFICATION ACTIVITY */

SELECT * FROM employee_data;

UPDATE employee_data
SET `Date of Birth` = STR_TO_DATE(`Date of Birth`, '%d-%m-%Y');

ALTER TABLE employee_data
MODIFY `Date of Birth` DATE;

select * from employee_data;

set sql_safe_updates = 0;

UPDATE employee_data
SET `Date of Joining` = STR_TO_DATE(`Date of Joining`, '%d-%m-%Y');

ALTER TABLE employee_data
MODIFY `Date of Joining` DATE;

