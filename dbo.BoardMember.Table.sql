USE [KaizanDB]
GO
/****** Object:  Table [dbo].[BoardMember]    Script Date: 7/21/2019 5:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoardMember](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[BoardId] [bigint] NOT NULL,
	[IsDefaultBoard] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
