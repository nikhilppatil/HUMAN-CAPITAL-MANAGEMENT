/* JOINS */

SELECT * FROM employees;
SELECT * FROM leave_balance;
SELECT * FROM leave_requests;

SELECT 
    full_name, designation, casual_leave_balance
FROM
    employees E
        JOIN
    leave_balance L ON E.employee_id = L.employee_id;

