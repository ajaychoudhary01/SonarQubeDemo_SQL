USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsByUserId]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTeamsByUserId]
@userId nvarchar(128)
As
BEGIN

CREATE TABLE #Temp (TeamId bigint NOT NULL);
 
    INSERT INTO #Temp
        (TeamId)
    SELECT TeamId
    FROM TeamMember
    WHERE MemberId = @userId

	select t.Id,
	t.Name, 
	t.IsPublic, 
	t.CreatedDate, 
	t.CreatedBy,
	t.[Description],
	tm.MemberID,
	tm.MemberName,
	tm.UserName,
	tm.[Role]
	from Team t
	inner join #Temp ct on ct.TeamId = t.Id
	inner join TeamMember tm on tm.TeamId = t.Id

	select b.Id, b.Name, b.[Description], 
	b.IsClosed, 
	b.IsPublic, 
	b.TeamId, 
	b.CreatedDate, 
	b.CreatedBy	
		from Board b
		inner join #Temp ct on b.TeamId = ct.TeamId

END





GO
