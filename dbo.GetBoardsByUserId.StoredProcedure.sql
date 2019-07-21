USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[GetBoardsByUserId]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetBoardsByUserId]
@userId nvarchar(128)
As
BEGIN
	select b.Id, b.Name, b.[Description], 
	b.IsClosed, 
	b.IsPublic, 
	b.TeamId, 
	b.CreatedDate, 
	b.CreatedBy,
	t.Name as 'TeamName', 
	t.Id as 'TeamId'	
		from Board b
		inner join Team t on b.TeamId = t.Id
		inner join TeamMember tm on tm.TeamId = t.Id
	where @userId = tm.MemberId
	
END


GO
