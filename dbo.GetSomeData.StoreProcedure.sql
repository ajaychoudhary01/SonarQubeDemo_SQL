USE [SomeDB]
GO
/****** Object:  StoredProcedure [dbo].[GetSomeData]    Script Date: 7/24/2019 5:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetSomeData]
@userId nvarchar(128)
As
BEGIN
	select b.Id, b.Name, b.[Description], 
	b.CreatedDate, 
	b.CreatedBy,
		from SomeTable b
	where @userId = b.UserId
	
	delete from [SomeTable]
	
END


GO
