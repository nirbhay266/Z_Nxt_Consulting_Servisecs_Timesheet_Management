USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Salary]    Script Date: 31-08-2025 1:35:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salary](
	[EmployeeID] [int] NOT NULL,
	[Components] [varchar](100) NOT NULL,
	[Amount] [int] NULL,
	[Basic] [int] NULL,
	[HRA] [int] NULL,
	[ProfessionalTax] [varchar](20) NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[Components] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Employee]
GO


