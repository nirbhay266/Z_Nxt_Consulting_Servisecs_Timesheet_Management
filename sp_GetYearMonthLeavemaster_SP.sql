USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetYearMonthLeavemaster]    Script Date: 31-08-2025 1:29:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetYearMonthLeavemaster]
   @Year INT = NULL,
    @Month INT = NULL
AS
BEGIN

    DECLARE @MaxDate DATE;
    --DECLARE @Year INT, @Month INT;

    SELECT @MaxDate = DATEADD(MONTH, 1, MAX([Date]))
    FROM Timesheet;

    SELECT 
        YEAR(@MaxDate)as [Year],
         MONTH(@MaxDate)as [Month]
	
END
GO


