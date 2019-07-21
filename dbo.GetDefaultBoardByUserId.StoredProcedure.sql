USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[GetDefaultBoardByUserId]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetDefaultBoardByUserId]
@userId nvarchar(128)
As
BEGIN
	Select f.[Id]
		,f.[Title]
		,f.[Description]
		,f.[StageId]
		,f.[ResourceId]
		,f.[DueDate]
		,f.[CompletionDate]
		,f.[CreatedDate]
		,f.[Priority]
		,f.[StartDate]
		,f.[BoardId]
		,tk.[Id] As 'TaskId'
		,tk.[Title] As 'TaskName'
		,tk.[Description] As 'TaskDescription'
		,tk.[TaskTypeId] 
		,tk.[StatusId] 
		,tk.[CreatedDate] As 'TaskCreatedDate'
		,tk.[ResourceId] As 'TaskResourceId'
		,tk.[Priority] As 'TaskPriority'
		,tk.[StartDate] As 'TaskStartDate'
		,tk.[DueDate] As 'TaskDueDate'
		,tk.[CompletionDate] AS 'TaskCompletionDate'
	FROM [dbo].[Feature] f
	inner join Board b on b.Id = f.BoardId
	inner join Task tk on f.Id = tk.BoardId
	inner join BoardMember bm on b.Id = bm.BoardId and bm.IsDefaultBoard = 1
	where bm.MemberId = @userId
END


GO
