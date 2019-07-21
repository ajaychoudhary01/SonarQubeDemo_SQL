USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[CreateNewBoard]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CreateNewBoard]
@name varchar(50),
@isPublic bit,
@teamId bigint,
@createdBy nvarchar(128),
@description nvarchar(max),
@boardId bigINT OUTPUT
AS
BEGIN
	INSERT INTO [dbo].[Board]
           ([Name]
           ,[IsPublic]
           ,[TeamId]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[Description]
           ,[IsClosed])
	 VALUES (@name, @isPublic, @teamId, GetDate(), @createdBy, @description, 0)

	SELECT @boardId = SCOPE_IDENTITY();
END
GO
