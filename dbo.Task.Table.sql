USE [KaizanDB]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 7/21/2019 5:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[Description] [varchar](max) NULL,
	[TaskTypeId] [int] NULL,
	[FeatureId] [int] NOT NULL,
	[StatusId] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Priority] [int] NULL,
	[StartDate] [datetime2](7) NULL,
	[DueDate] [datetime2](7) NULL,
	[CompletionDate] [datetime2](7) NULL,
	[BoardId] [int] NULL,
	[MemberId] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
