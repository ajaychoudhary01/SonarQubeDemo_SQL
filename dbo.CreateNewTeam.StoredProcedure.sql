USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[CreateNewTeam]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CreateNewTeam]
@name varchar(50),
@isPublic bit,
@createdBy nvarchar(128),
@description nvarchar(max),
@memberName nvarchar(100),
@userName nvarchar(200),
@teamId bigINT OUTPUT
AS
BEGIN
	INSERT INTO [dbo].[Team]
           ([Name]
           ,[IsPublic]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[Description]
		   ,[IsClosed])
	 VALUES (@name, @isPublic, GetDate(), @createdBy, @description, 0)

	SELECT @teamId = SCOPE_IDENTITY();

	INSERT INTO [dbo].[TeamMember]
           ([TeamId]
           ,[MemberId]
		   ,[AddedDate]
		   ,[AddedBy]
		   ,[Role]
           ,[MemberName]
           ,[UserName])
     VALUES (@teamId, @createdBy, GetDate(), @createdBy, 'Admin', @memberName, @userName)
END


GO
