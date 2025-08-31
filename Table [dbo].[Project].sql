USE [Z_NXT_CONSULTING_SERVICES]
GO

/****** Object:  Table [dbo].[Project]    Script Date: 31-08-2025 1:35:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectDescription] [nvarchar](500) NOT NULL,
	[CustomerCode] [nvarchar](50) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Project] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Project]  WITH CHECK ADD FOREIGN KEY([CustomerCode])
REFERENCES [dbo].[Company] ([CompanyCode])
GO


