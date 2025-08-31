USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  StoredProcedure [dbo].[GetEmployeeslip]    Script Date: 31-08-2025 1:28:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[GetEmployeeslip]
    @Year INT,
    @Month INT,
    @EmployeeID INT
AS
BEGIN 
    SET NOCOUNT ON;

    DECLARE @StartDate DATE, @EndDate DATE;

    SET @StartDate = DATEFROMPARTS(@Year, @Month, 1);
    SET @EndDate = EOMONTH(@StartDate);

    -- Optional: Calculate total working days if needed later
    DECLARE @TotalWorkingDays INT;
    SELECT @TotalWorkingDays = COUNT(*) 
    FROM Timesheet 
    WHERE [Date] BETWEEN @StartDate AND @EndDate AND Isworkingday = 1;

	 --;WITH AttendanceCTE AS (
  --      SELECT 
  --          EmployeeID,
  --          SUM(Attendance) AS PresentDays,
  --          SUM([Leave]) AS AbsentDays
  --      FROM Timesheet
  --      WHERE [Date] BETWEEN @StartDate AND @EndDate
  --      GROUP BY EmployeeID
  --  )

    -- Fetch attendance and salary details
    SELECT 
        e.EmployeeID,
        e.EmployeeName,
        e.EmployeeCode,
        e.Fathersname,
        e.DateOfJoining,
        e.Department,
        e.Branch,
        e.BankName,
        e.BankAccountNo,

        ISNULL(SUM(t.Attendance), 0) AS PresentDays,
        ISNULL(SUM(t.Leave), 0) AS AbsentDays,

        ISNULL(s.Basic, 0) AS Basic,
        ISNULL(s.HRA, 0) AS HRA,
        ISNULL(s.Basic, 0) + ISNULL(s.HRA, 0) AS Total,

        ISNULL(s.Basic, 0) + ISNULL(s.HRA, 0) AS FixedSalary,

        ISNULL(SUM(t.Attendance), 0) * 500 AS GrossSalary,  -- Replace 500 with actual logic if needed
        ISNULL(SUM(t.Attendance), 0) * 500 AS NetSalary,

        ISNULL(s.ProfessionalTax, 0) AS Deductions,
        ISNULL(s.Basic, 0) + ISNULL(s.HRA, 0) - ISNULL(s.ProfessionalTax, 0) AS NetPayable

    FROM 
        Employee e 
        LEFT JOIN Timesheet t 
            ON e.EmployeeID = t.EmployeeID  
            AND t.[Date] BETWEEN @StartDate AND @EndDate
        LEFT JOIN (
            SELECT 
                EmployeeID,
                MAX(CASE WHEN Components = 'Basic' THEN Amount END) AS Basic,
                MAX(CASE WHEN Components = 'HRA' THEN Amount END) AS HRA,
                MAX(CASE WHEN Components = 'ProfessionalTax' THEN Amount END) AS ProfessionalTax
            FROM Salary
            GROUP BY EmployeeID
        ) s ON e.EmployeeID = s.EmployeeID

    WHERE 
        e.EmployeeID = @EmployeeID  

    GROUP BY 
        e.EmployeeID, e.EmployeeName, e.EmployeeCode, e.Fathersname,
        e.DateOfJoining, e.Department, e.Branch, e.BankName, e.BankAccountNo,
        s.Basic, s.HRA, s.ProfessionalTax;
END
GO


