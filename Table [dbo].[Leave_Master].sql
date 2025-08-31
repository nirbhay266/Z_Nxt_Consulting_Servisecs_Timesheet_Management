USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Leave_Master]    Script Date: 31-08-2025 1:34:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Leave_Master](
	[EmployeeID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Remmaining_EL] [int] NULL,
	[Remmaining_CL] [int] NULL,
	[LOAD_DATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


