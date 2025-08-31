USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  StoredProcedure [dbo].[WorkingCalender_sp]    Script Date: 31-08-2025 1:30:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WorkingCalender_sp]
    @Year INT,     
    @Month INT     
AS
BEGIN
    SET NOCOUNT ON;
	--DECLARE @Year INT =2025;     
 --   DECLARE @Month INT = 4;   
    DECLARE @StartDate DATE = DATEFROMPARTS(@Year, @Month, 1);  
    DECLARE @EndDate DATE = EOMONTH(DATEFROMPARTS(@Year+1, @Month-1, 1)); 

    WITH workingCalender 
	AS
	(
    SELECT 
        @StartDate as StartDate,
        DATENAME(DW,@StartDate) as [WeekDay], 
        DATEPART(DD,@StartDate) as [Day],
		MONTH(@StartDate) as [MONTH],
		YEAR(@StartDate) as [YEAR],
		CASE WHEN DATENAME(DW,@StartDate) IN('saturday','sunday') THEN 0 ELSE 1 END AS [IsWorkingDay]
	UNION ALL
	Select DATEADD(DD,1,StartDate),
		DATENAME(DW,DATEADD(DD,1,StartDate)), 
        DATEPART(DD,DATEADD(DD,1,StartDate)) ,
		MONTH(DATEADD(DD,1,StartDate)),
		YEAR(DATEADD(DD,1,StartDate)),
		CASE WHEN DATENAME(DW,DATEADD(DD,1,StartDate)) IN('saturday','sunday') THEN 0 ELSE 1 END AS [IsWorkingDay]
	from workingCalender
	Where StartDate<@EndDate)

	INSERT INTO [Working_Calender] (Date, Day_Name, Day, Month, Year, IsWorkingDay)
	Select * from workingCalender Option (MaxRecursion 500);
END;

--EXEC WorkingCalender_sp @Year = 2025, @Month = 4;



GO


