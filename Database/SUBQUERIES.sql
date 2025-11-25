/* List employees who work in the same department as 'Abhijeet Ramesh Jadhav'. */

SELECT 
    *
FROM
    employee_data
WHERE
    Department = (SELECT 
            Department
        FROM
            employee_data
        WHERE
            NAME = 'Abhijeet Ramesh Jadhav');

/* Find employees whose salary is higher than the average salary of all employees. */

SELECT 
    *
FROM
    employee_data
WHERE
    SALARY > (SELECT 
            AVG(SALARY)
        FROM
            employee_data)
ORDER BY SALARY DESC;

/* Retrieve names and mobile numbers of employees whose salary is below 
the average salary in their department */

SELECT * FROM employee_data;

SELECT 
    NAME, MOBILE, Department, SALARY
FROM
    employee_data e1
WHERE
    SALARY < (SELECT 
            AVG(SALARY)
        FROM
            employee_data e2
        WHERE
            e2.Department = e1.Department);

/* Get the EmployeeCode and Name of employees who earn more than the 
salary of Abhinav Shridhar Shinde using a subquery. */

SELECT 
    EmployeeCode, NAME, SALARY
FROM
    employee_data
WHERE
    SALARY > (SELECT 
            SALARY
        FROM
            employee_data
        WHERE
            NAME = 'Abhinav Shridhar Shinde');

/* List names of employees whose salary is greater than 
than the salary of all employees in the ADMIN department.*/

SELECT 
    NAME
FROM
    employee_data
WHERE
    SALARY > (SELECT 
            MAX(Salary)
        FROM
            employee_data
        WHERE
            Department = 'ADMIN');


