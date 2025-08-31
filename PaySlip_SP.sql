USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  StoredProcedure [dbo].[PaySlip_SP]    Script Date: 31-08-2025 1:29:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[PaySlip_SP] 
(
	  @Year INT
	 ,@Month INT,
	 @EmployeeId INT
)AS
BEGIN 

DECLARE @StartDate DATE, @EndDate DATE;
SET @StartDate = DATEFROMPARTS(@Year, @Month, 1);  
SET @EndDate = EOMONTH(@StartDate);
WITH Slip AS (
    SELECT e.EmployeeID,e.EmployeeCode,e.EmployeeName,e.FathersName,e.Department,e.BankName,e.BankAccountNo,e.DateOfJoining,ISNULL(p.BASIC, 0) AS BASIC,
	ISNULL(p.HRA ,0)AS HRA,
    ISNULL(p.[Professional Tax], 0) AS [Professional Tax]
    FROM Employee e
    LEFT JOIN (
        SELECT EmployeeID, [BASIC], [HRA], [Professional Tax]
        FROM (SELECT EmployeeID, Components, Amount
            FROM Salary
        ) AS src
        PIVOT (SUM(Amount)
            FOR Components IN ([BASIC], [HRA], [Professional Tax])
        ) AS pvt
    ) p ON e.EmployeeID = p.EmployeeID WHERE e.EmployeeId=@EmployeeId
),
Pay AS (
    SELECT EmployeeId,
           SUM(CASE WHEN LeaveType = 'EL' THEN ISNULL(Leave,0) ELSE 0 END) AS Total_EL,
		   SUM(CASE WHEN LeaveType = 'CL' THEN ISNULL(Leave,0) ELSE 0 END) AS Total_CL,
           SUM(ISNULL(Attendance,0)) AS Total_Attendance
    FROM Timesheet T
    WHERE [Date] BETWEEN @StartDate AND @EndDate AND EmployeeId=@EmployeeId
    GROUP BY EmployeeId
)
SELECT s.EmployeeID,s.EmployeeCode,s.EmployeeName, s.FathersName,C.Address As 'Address',C.Name As 'ComapnyName',s.Department,s.BankName,s.BankAccountNo,s.DateOfJoining,s.BASIC,s.HRA,s.[Professional Tax],
		isnull(p.Total_EL,0) as Total_EL,isnull(p.Total_CL,0) as Total_CL,isnull(p.Total_Attendance,0) as Total_Attendance
FROM Slip s
LEFT JOIN Pay p 
    ON s.EmployeeID = p.EmployeeId 
LEFT JOIN Company C
on 1=1
END
GO


