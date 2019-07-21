USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[GetFeaturesByBoardId]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetFeaturesByBoardId]
@boardId int
As
BEGIN
	Select f.[Id]
		,f.[Title]
		,f.[Description]
		,f.[StageId]
		,f.[MemberId]
		,f.[DueDate]
		,f.[CompletionDate]
		,f.[CreatedDate]
		,f.[Priority]
		,f.[StartDate]
		,f.[BoardId]
	FROM [dbo].[Feature] f
	where f.BoardId = @boardId
END



GO
