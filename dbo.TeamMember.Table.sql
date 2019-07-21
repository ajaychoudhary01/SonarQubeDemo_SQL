USE [KaizanDB]
GO
/****** Object:  Table [dbo].[TeamMember]    Script Date: 7/21/2019 5:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeamMember](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[MemberId] [nvarchar](128) NOT NULL,
	[AddedDate] [datetime2](7) NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[MemberName] [varchar](100) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
