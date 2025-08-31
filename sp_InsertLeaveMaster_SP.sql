USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertLeaveMaster]    Script Date: 31-08-2025 1:30:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_InsertLeaveMaster]
(
	@Year INT
	, @Month INT
)
As
BEGIN
--DECLARE @Year INT, @Month INT;
--DECLARE @Year INT, @Month INT;
DECLARE @StartDate DATE, @PreviousMonthStartDate DATE, @PreviousMonthEndDate DATE, @LoadDate Date;

--SET @Year = 2025;
--SET @Month = 6;


SET @StartDate = DATEFROMPARTS(@Year, @Month, 1);  
SET @PreviousMonthStartDate = DATEADD(MONTH, -1, @StartDate); 
SET @PreviousMonthEndDate = EOMONTH(@PreviousMonthStartDate); 
SET @LoadDate = Cast(@StartDate as Date);



WITH Tm_sheet AS (
    SELECT 
        EmployeeId,
        YEAR([Date]) AS [Year],
        MONTH([Date]) AS [Month],
		--LeaveType,
        SUM(CASE WHEN LeaveType = 'EL' THEN Leave ELSE 0 END) AS EL_Leave,
        SUM(CASE WHEN LeaveType = 'CL' THEN Leave ELSE 0 END) AS CL_Leave

    FROM Timesheet t
	where ([Date] Between @PreviousMonthStartDate And @PreviousMonthEndDate) And t.LeaveType In  ('EL','CL')
    GROUP BY 
        EmployeeId,
        YEAR([Date]),
        MONTH([Date])
		--LeaveType
),
--SELECT * FROM Tm_sheet
--ORDER BY EmployeeId, [Year], [Month];

--Remaining Leave from Leave_Master
Leave_ms As(
Select EmployeeID, Remmaining_CL, Remmaining_EL
from Leave_Master
Where [Year] = YEAR(@PreviousMonthStartDate) And [Month] = MONTH(@PreviousMonthStartDate)
)

Insert into Leave_Master (EmployeeID,Year,Month,Remmaining_CL,Remmaining_EL,LOAD_DATE)
Select e.EmployeeId
	,Year(@StartDate) as [Year]
	,Month(@StartDate) as [Month]
	,Case When Month(@StartDate) = 4 Then 3
		  When Month(@StartDate) = 4 Then ((3 + isnull(lms.Remmaining_CL,0)) - isnull(ts.CL_Leave,0))
		  Else (isnull(lms.Remmaining_CL,0) - isnull(ts.CL_Leave,0)) End  As [RemainingCL]

	,Case When Month(@StartDate) = 4 Then 6
		  When Month(@StartDate) = 4 Then ((6 + isnull(lms.Remmaining_EL,0)) - isnull(ts.EL_Leave,0))
		  Else (isnull(lms.Remmaining_EL,0) - isnull(ts.EL_Leave,0)) End  As [RemainingEL]
	,@LoadDate as LoadDate  
	from Employee e 
	Left Join Leave_ms lms On e.EmployeeID = lms.EmployeeID
	Left Join Tm_sheet ts On e.EmployeeID = ts.EmployeeId
	Where e.IsActive = 1
END
GO


