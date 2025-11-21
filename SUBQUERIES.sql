/* List employees who work in the same department as 'Abhijeet Ramesh Jadhav'. */

SELECT *
FROM employee_data
WHERE Department = (SELECT Department FROM employee_data
WHERE NAME = "Abhijeet Ramesh Jadhav");

/* Find employees whose salary is higher than the average salary of all employees. */

SELECT * 
FROM employee_data
WHERE SALARY > (SELECT AVG(SALARY) FROM employee_data)
ORDER BY SALARY DESC;



