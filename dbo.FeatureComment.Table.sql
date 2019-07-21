USE [KaizanDB]
GO
/****** Object:  Table [dbo].[FeatureComment]    Script Date: 7/21/2019 5:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeatureComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NULL,
	[FeatureId] [int] NOT NULL,
	[ResourceId] [varchar](50) NOT NULL,
	[CommentDate] [datetime2](7) NOT NULL,
	[CommentedBy] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
