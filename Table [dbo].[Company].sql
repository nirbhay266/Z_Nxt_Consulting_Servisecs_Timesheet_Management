USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 31-08-2025 1:32:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company](
	[CompanyCode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PAN] [nvarchar](50) NULL,
	[GSTIN] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Company] ADD  DEFAULT ((1)) FOR [IsActive]
GO


