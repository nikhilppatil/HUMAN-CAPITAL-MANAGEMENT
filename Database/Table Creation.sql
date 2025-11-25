DROP TABLE IF EXISTS leave_requests;
DROP TABLE IF EXISTS payroll;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_code VARCHAR(20) UNIQUE NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    department_head VARCHAR(100),
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- 2. EMPLOYEES TABLE
-- ============================================
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_code VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    
    -- Contact Information
    personal_email VARCHAR(100),
    official_email VARCHAR(100),
    mobile_number VARCHAR(15),
    
    -- Employment Details
    designation VARCHAR(100),
    department_id INT NOT NULL,
    date_of_joining DATE NOT NULL,
    date_of_leaving DATE,
    employment_status ENUM('ACTIVE', 'INACTIVE', 'RESIGNED', 'TERMINATED') DEFAULT 'ACTIVE',
    
    -- Banking Details
    bank_name VARCHAR(100),
    account_number VARCHAR(30),
    ifsc_code VARCHAR(15),
    pan_number VARCHAR(20),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- ============================================
-- 3. PAYROLL TABLE
-- ============================================
CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    
    -- Salary Month/Year
    salary_month TINYINT NOT NULL CHECK (salary_month BETWEEN 1 AND 12),
    salary_year YEAR NOT NULL,
    
    -- Earnings
    basic_salary DECIMAL(12, 2) NOT NULL DEFAULT 0,
    hra DECIMAL(12, 2) DEFAULT 0,
    conveyance_allowance DECIMAL(12, 2) DEFAULT 0,
    medical_allowance DECIMAL(12, 2) DEFAULT 0,
    special_allowance DECIMAL(12, 2) DEFAULT 0,
    bonus DECIMAL(12, 2) DEFAULT 0,
    overtime_pay DECIMAL(12, 2) DEFAULT 0,
    other_allowances DECIMAL(12, 2) DEFAULT 0,
    
    -- Deductions
    pf_deduction DECIMAL(12, 2) DEFAULT 0,
    esi_deduction DECIMAL(12, 2) DEFAULT 0,
    professional_tax DECIMAL(12, 2) DEFAULT 0,
    tds_deduction DECIMAL(12, 2) DEFAULT 0,
    loan_deduction DECIMAL(12, 2) DEFAULT 0,
    advance_deduction DECIMAL(12, 2) DEFAULT 0,
    other_deductions DECIMAL(12, 2) DEFAULT 0,
    
    -- Attendance
    total_working_days INT DEFAULT 0,
    present_days DECIMAL(5, 2) DEFAULT 0,
    paid_leaves DECIMAL(5, 2) DEFAULT 0,
    unpaid_leaves DECIMAL(5, 2) DEFAULT 0,
    loss_of_pay_days DECIMAL(5, 2) DEFAULT 0,
    
    -- Calculated Fields
    gross_salary DECIMAL(12, 2) GENERATED ALWAYS AS (
        basic_salary + hra + conveyance_allowance + medical_allowance + 
        special_allowance + bonus + overtime_pay + other_allowances
    ) STORED,
    
    total_deductions DECIMAL(12, 2) GENERATED ALWAYS AS (
        pf_deduction + esi_deduction + professional_tax + tds_deduction + 
        loan_deduction + advance_deduction + other_deductions
    ) STORED,
    
    net_salary DECIMAL(12, 2) GENERATED ALWAYS AS (
        gross_salary - total_deductions
    ) STORED,
    
    -- Payment Details
    payment_status ENUM('PENDING', 'PROCESSED', 'PAID', 'HOLD') DEFAULT 'PENDING',
    payment_date DATE,
    payment_mode ENUM('BANK_TRANSFER', 'CHEQUE', 'CASH', 'UPI') DEFAULT 'BANK_TRANSFER',
    transaction_reference VARCHAR(100),
    
    -- Remarks
    remarks TEXT,
    processed_by INT NULL,
    processed_date TIMESTAMP NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (processed_by) REFERENCES employees(employee_id),
    
    -- Unique constraint
    UNIQUE KEY unique_payroll (employee_id, salary_month, salary_year)
);

-- ============================================
-- 4. LEAVE REQUESTS TABLE
-- ============================================
CREATE TABLE leave_requests (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    
    -- Leave Details
    leave_type ENUM(
        'CASUAL_LEAVE', 'SICK_LEAVE', 'EARNED_LEAVE', 'MATERNITY_LEAVE', 
        'PATERNITY_LEAVE', 'COMP_OFF', 'UNPAID_LEAVE', 
        'BEREAVEMENT_LEAVE', 'MARRIAGE_LEAVE'
    ) NOT NULL,
    
    leave_from DATE NOT NULL,
    leave_to DATE NOT NULL,
    
    -- Calculate number of days
    total_days INT GENERATED ALWAYS AS (DATEDIFF(leave_to, leave_from) + 1) STORED,
    
    half_day BOOLEAN DEFAULT FALSE,
    first_half BOOLEAN DEFAULT FALSE,
    second_half BOOLEAN DEFAULT FALSE,
    
    -- Leave Reason
    leave_reason TEXT NOT NULL,
    contact_during_leave VARCHAR(15),
    attachment_path VARCHAR(255),
    
    -- Approval Workflow
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'CANCELLED', 'WITHDRAWN') DEFAULT 'PENDING',
    
    approved_by INT NULL,
    approved_date TIMESTAMP NULL,
    approval_remarks TEXT,
    
    rejected_by INT NULL,
    rejection_date TIMESTAMP NULL,
    rejection_reason TEXT,
    
    -- Application Details
    applied_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES employees(employee_id),
    FOREIGN KEY (rejected_by) REFERENCES employees(employee_id)
);

-- ============================================
-- 5. LEAVE BALANCE TABLE
-- ============================================
CREATE TABLE leave_balance (
    balance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    year YEAR NOT NULL,
    
    -- Leave Allocations
    casual_leave_total DECIMAL(5, 2) DEFAULT 12,
    casual_leave_used DECIMAL(5, 2) DEFAULT 0,
    casual_leave_balance DECIMAL(5, 2) GENERATED ALWAYS AS 
        (casual_leave_total - casual_leave_used) STORED,
    
    sick_leave_total DECIMAL(5, 2) DEFAULT 12,
    sick_leave_used DECIMAL(5, 2) DEFAULT 0,
    sick_leave_balance DECIMAL(5, 2) GENERATED ALWAYS AS 
        (sick_leave_total - sick_leave_used) STORED,
    
    earned_leave_total DECIMAL(5, 2) DEFAULT 15,
    earned_leave_used DECIMAL(5, 2) DEFAULT 0,
    earned_leave_balance DECIMAL(5, 2) GENERATED ALWAYS AS 
        (earned_leave_total - earned_leave_used) STORED,
    
    comp_off_total DECIMAL(5, 2) DEFAULT 0,
    comp_off_used DECIMAL(5, 2) DEFAULT 0,
    comp_off_balance DECIMAL(5, 2) GENERATED ALWAYS AS 
        (comp_off_total - comp_off_used) STORED,
    
    -- Special Leaves
    maternity_leave_balance DECIMAL(5, 2) DEFAULT 0,
    paternity_leave_balance DECIMAL(5, 2) DEFAULT 0,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
    
    -- Unique constraint to prevent duplicate year records
    UNIQUE KEY unique_leave_balance (employee_id, year)
);




