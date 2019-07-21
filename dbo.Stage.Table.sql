USE [KaizanDB]
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 7/21/2019 5:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [varchar](50) NULL,
	[IsNewButtonAvailable] [bit] NULL,
	[IsLastStage] [bit] NULL,
	[FlowId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
