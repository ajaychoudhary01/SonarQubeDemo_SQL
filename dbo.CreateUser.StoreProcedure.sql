USE [KaizanDB]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 7/21/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[CreateUser]
@name char(50),
@email char(128),
@userName char(256)
AS
BEGIN
	IF exists (select * from [dbo].[User])
	BEGIN
		INSERT INTO [dbo].[User]
			   ([Name]
			   ,[Email]
			   ,[UserName])
		 VALUES (@name, @email, @userName)
		END
		SELECT * FROM Fruit WHERE type='apple' AND type='orange' 
END
GO
