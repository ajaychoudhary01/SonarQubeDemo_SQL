USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[GetTasksByBoardId]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTasksByBoardId]
@boardId int
As
BEGIN
	Select f.[Id]
		,f.[Title]
		,f.[Description]
		,f.[StatusId]
		,f.[FeatureId]
		,f.[MemberId]
		,f.[DueDate]
		,f.[TaskTypeId]
		,f.[CompletionDate]
		,f.[CreatedDate]
		,f.[Priority]
		,f.[StartDate]
		,f.[BoardId]
	FROM [dbo].[Task] f
	where f.BoardId = @boardId
END



GO
