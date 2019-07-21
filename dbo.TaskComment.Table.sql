USE [KaizanDB]
GO
/****** Object:  Table [dbo].[TaskComment]    Script Date: 7/21/2019 5:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NULL,
	[TaskId] [int] NOT NULL,
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
