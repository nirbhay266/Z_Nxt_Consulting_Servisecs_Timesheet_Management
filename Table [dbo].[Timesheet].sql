USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Timesheet]    Script Date: 31-08-2025 1:35:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Timesheet](
	[EmployeeId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Attendance] [numeric](18, 2) NULL,
	[Isworkingday] [int] NULL,
	[LeaveType] [varchar](20) NULL,
	[Leave] [numeric](18, 2) NULL
) ON [PRIMARY]
GO


