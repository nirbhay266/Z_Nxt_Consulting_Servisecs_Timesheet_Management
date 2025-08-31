USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 31-08-2025 1:34:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](255) NOT NULL,
	[Contact] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](500) NULL,
	[DateOfJoining] [date] NOT NULL,
	[DateOfLeaving] [date] NULL,
	[IsActive] [bit] NULL,
	[EmployeeCode] [nvarchar](50) NULL,
	[FathersName] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[Branch] [varchar](50) NULL,
	[BankName] [varchar](100) NULL,
	[BankAccountNo] [varchar](20) NULL,
	[Emergency_Contact] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


