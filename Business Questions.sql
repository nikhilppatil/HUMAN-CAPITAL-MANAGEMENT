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

/* How to view all employee records? */

SELECT * FROM employee_data;

/* How to show only employee names and departments? */

SELECT NAME, DEPARTMENT
FROM employee_data;

/* How to find employees from a specific department? */

SELECT NAME 
FROM employee_data
WHERE DEPARTMENT = "IT";

/* How to list all male employees? */

SELECT COUNT(*), GENDER FROM employee_data
WHERE Gender = "MALE";

SELECT * FROM employee_data
WHERE Gender = "MALE";

SELECT GENDER, COUNT(NAME)
FROM employee_data
WHERE GENDER = 'MALE'
GROUP BY GENDER;

/* How to list all female employees? */

SELECT * FROM employee_data
WHERE GENDER = "FEMALE";

/* How to find employees with a specific designation? */

SELECT * FROM employee_data
WHERE DESIGNATION LIKE 'IT%';

SELECT * FROM employee_data
WHERE DESIGNATION = "IT ASSISTANT";

/* How to show employees hired on a particular date? */ 

SELECT * FROM employee_data
WHERE `Date of Joining` = '2023-05-01';

/*  How to find employees whose salary is greater than a given amount? */

SELECT 
    SALARY
FROM
    employee_data
ORDER BY SALARY DESC;

SELECT 
    *
FROM
    employee_data
WHERE
    SALARY > (SELECT 
            ROUND(AVG(SALARY))
        FROM
            employee_data)
ORDER BY SALARY DESC;

/* How to display employees with a specific Staff Type (e.g., Contract)? */

SELECT * FROM employee_data
WHERE `Staff Type` = 'NA';

SELECT * FROM employee_data
WHERE `Staff Type` LIKE '%L';

/*  How to find employees who are Active? */

SELECT * FROM employee_data
WHERE EmployeeStatus = "ACTIVE";










