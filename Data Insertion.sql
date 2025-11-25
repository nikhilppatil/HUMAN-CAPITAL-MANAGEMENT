/* Data Insertion */

INSERT INTO departments (department_code, department_name, location) VALUES
('IT', 'Information Technology', 'Head Office'),
('HR', 'Human Resources', 'Head Office'),
('FIN', 'Finance & Accounts', 'Head Office'),
('ADMIN', 'Administration', 'Head Office'),
('SALES', 'Sales & Marketing', 'Regional Office'),
('OPS', 'Operations', 'Head Office'),
('LEGAL', 'Legal & Compliance', 'Head Office'),
('TECH', 'Technical Services', 'Service Center');

select * from employees;

INSERT INTO employees (
    emp_code,
    full_name,
    gender,
    date_of_birth,
    personal_email,
    official_email,
    mobile_number,
    designation,
    department_id,
    date_of_joining,
    date_of_leaving,
    employment_status,
    bank_name,
    account_number,
    ifsc_code,
    pan_number,
    created_at,
    updated_at
) VALUES
('EMP001', 'Nikhil Patil', 'Male', '1990-05-15', 'nikhilpatil@gmail.com',
 'bigpicture@company.com', '9876543210', 'Software Engineer', 1, 
 '2022-01-10', NULL, 'ACTIVE', 'HDFC Bank', '1234567890', 
 'HDFC0001234', 'ABCDE1234F', NOW(), NOW());
 
  
INSERT INTO leave_balance (
    employee_id,
    year,
    casual_leave_total,
    casual_leave_used,
    sick_leave_total,
    sick_leave_used,
    earned_leave_total,
    earned_leave_used,
    comp_off_total,
    comp_off_used,
    maternity_leave_balance,
    paternity_leave_balance,
    created_at,
    updated_at
) VALUES (
    1, 2025, 12.00, 4.00, 10.00, 2.00, 15.00, 5.00, 5.00, 1.00, 0.00, 0.00, NOW(), NOW()
);

SELECT * FROM leave_balance;