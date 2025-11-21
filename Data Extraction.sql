/* DATABASE AND TABLE EXTRACTION ACTIVITY */

CREATE DATABASE HCM;

USE HCM;

SELECT * FROM hcm;

DROP TABLE hcm;

SELECT COUNT(*) FROM hcm;

SELECT * FROM employee_data;

SELECT NAME,`Pay Status`, EmployeeStatus FROM employee_data
WHERE EmployeeStatus IS NULL;



















