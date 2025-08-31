USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Working_Calender]    Script Date: 31-08-2025 1:36:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Working_Calender](
	[Date] [date] NULL,
	[Day_Name] [nvarchar](50) NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Isworkingday] [int] NULL
) ON [PRIMARY]
GO


