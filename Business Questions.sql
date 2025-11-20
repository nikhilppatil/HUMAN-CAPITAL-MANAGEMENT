/* Perform Business Activities */

SELECT * FROM employee_data;

SELECT  DEPARTMENT, COUNT(DESIGNATION) DESIGNATION
FROM employee_data
WHERE GENDER = "MALE"
GROUP BY DEPARTMENT
ORDER BY DESIGNATION DESC;


/* "How do I get all employees hired in the last 30 days?" */

USE hcm;

SELECT * FROM employee_data;

SELECT *
FROM employee_data
WHERE `Date of Joining` >= CURDATE() - INTERVAL 220 DAY;


