/* Stored Procedure */ 

/* 1. Fetch Employee Details */

DELIMITER //

CREATE PROCEDURE ShowAllEmployees()
BEGIN
		SELECT * FROM employee_data;
END //

DELIMITER ;

CALL ShowAllEmployees();

/* 2. Insert New Employee */
 
 DROP PROCEDURE IF EXISTS AddEmployee;
 
 DELIMITER //

CREATE PROCEDURE AddEmployee(
    IN p_RFID_No INT,
    IN p_Name VARCHAR(100),
    IN p_Gender VARCHAR(10),
    IN p_Designation VARCHAR(100),
    IN p_Department VARCHAR(50),
    IN p_Staff VARCHAR(50),
    IN p_Staff_Type VARCHAR(50),
    IN p_Bank_Name VARCHAR(50),
    IN p_Quarter VARCHAR(50),
    IN p_PF VARCHAR(50),
    IN p_Pay_Rule VARCHAR(50),
    IN p_Scale VARCHAR(50),
    IN p_EmployeeCode VARCHAR(50),
    IN p_Date_of_Birth DATE,
    IN p_Date_of_Joining DATE,
    IN p_Date_of_Increment DATE,
    IN p_Date_of_Retirement DATE,
    IN p_Actual_Basic DECIMAL(10,2),
    IN p_Grade_Pay DECIMAL(10,2),
    IN p_Salary DECIMAL(10,2),
    IN p_Mobile VARCHAR(15),
    IN p_Personal_Email_ID VARCHAR(100),
    IN p_Employee_Type VARCHAR(50),
    IN p_HRA VARCHAR(10),
    IN p_UserLogin VARCHAR(100),
    IN p_Pay_Status VARCHAR(10),
    IN p_TA VARCHAR(10),
    IN p_EmployeeStatus VARCHAR(20)
)
BEGIN
    INSERT INTO employee_data(
        `RFID No/FACE`, `Name`, `Gender`, `Designation`, `Department`, `Staff`, `Staff Type`,
        `Bank Name`, `Quarter`, `PF`, `Pay Rule`, `Scale`, `EmployeeCode`,
        `Date of Birth`, `Date of Joining`, `Date of Increment`, `Date of Retirement`,
        `Actual Basic`, `Grade Pay`, `Salary`, `Mobile`, `Personal Email ID`, `Employee Type`,
        `H.R.A`, `UserLogin`, `Pay Status`, `T.A`, `EmployeeStatus`
    )
    VALUES (
        p_RFID_No, p_Name, p_Gender, p_Designation, p_Department, p_Staff, p_Staff_Type,
        p_Bank_Name, p_Quarter, p_PF, p_Pay_Rule, p_Scale, p_EmployeeCode,
        p_Date_of_Birth, p_Date_of_Joining, p_Date_of_Increment, p_Date_of_Retirement,
        p_Actual_Basic, p_Grade_Pay, p_Salary, p_Mobile, p_Personal_Email_ID, p_Employee_Type,
        p_HRA, p_UserLogin, p_Pay_Status, p_TA, p_EmployeeStatus
    );
END //

DELIMITER ;

CALL AddEmployee(
    9070, 'John Doe', 'MALE', 'Admin Officer', 'ADMIN', 'NG-NON TEACHING', 'NG-NON-VACATIONAL',
    'HDFC', '', '', 'SIXTH PAY', '5200-20200(1900)', 'DES/NG/SAL/1908',
    '1990-05-05', '2023-01-01', NULL, NULL,
    45000, 0, 45000, '9876543210', 'john.doe@example.com', 'DESCO',
    'NO', 'johndoe', 'NO', 'YES', 'Active'
);

Select * from employee_data;



