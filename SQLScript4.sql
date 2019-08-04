IF OBJECT_ID ('MyDepartment','U') IS NOT NULL
    DROP TABLE MyDepartment;
GO 
 
SET ANSI_NULLS ON
GO
 
SET QUOTED_IDENTIFIER ON
GO
 
CREATE TABLE [dbo].[MyDepartment]
(
   [DepartmentID] [smallint] NOT NULL,
   [DepartmentName] [nvarchar](30) NOT NULL,
   [ParentID] [nvarchar](40) NULL,
   CONSTRAINT [PK_DepartmentID] PRIMARY KEY CLUSTERED ( [DepartmentID] ASC )
   WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO


INSERT INTO [dbo].[MyDepartment] ([DepartmentID],[DepartmentName],[ParentID])
VALUES
   ('1','CEO',null),
   ('2','President','1'),
   ('3','Chairman','1'),
   ('4','Vice President','2'),
   ('5','Associate Vice President','4'),
   ('6','Senior Manager','4'),
   ('7','Delivery Manager','4'),
   ('8','Program Manager','4'),
   ('9','Project Manager','5'),
   ('10','Planning Manager','5'),
   ('11','Execution Manager','5'),
   ('12','Project Leader','6'),
   ('13','Project Planner','6'),
   ('14','Senior Project Lead','12'),
   ('15','Team Lead','12'),
   ('16','Sprint Lead','12'),
   ('17','Statistics Department','6'),
   ('18','Logistics Department','6'),
   ('19','Sales Account','7'),
   ('20','Customer Service','7'),
   ('21','Product Support B','8'),
   ('22','Sales Department','21'),
   ('23','Purchase Department','21'),
   ('24','Group Manager','8'),
   ('25','Overseas Department','24'),
   ('26','Domestic Department','24');
go	

WITH OrgTree (DepartmentID, DepartmentName, ParentID, Tree)
AS
(
   SELECT DepartmentID, DepartmentName, ParentID , 0 AS Tree 
   FROM MyDepartment
   WHERE ParentID IS NULL
   UNION ALL
   SELECT MyDepartment.DepartmentID, MyDepartment.DepartmentName, MyDepartment.ParentID , OrgTree.Tree + 1
   FROM MyDepartment
   JOIN OrgTree ON MyDepartment.ParentID = OrgTree.DepartmentID
)
SELECT * FROM OrgTree ORDER BY Tree


SELECT DepartmentID, DepartmentName, ParentID , 0 AS Tree 
FROM MyDepartment
WHERE ParentID IS NULL


SELECT MyDepartment.DepartmentID, MyDepartment.DepartmentName, MyDepartment.ParentID , OrgTree.Tree + 1
FROM MyDepartment
JOIN OrgTree ON MyDepartment.ParentID = OrgTree.DepartmentID

WITH OrgTree (DepartmentID, DepartmentName, ParentID, Tree)
AS
(
   SELECT DepartmentID, DepartmentName, ParentID, 0 AS Tree 
   FROM MyDepartment
   WHERE ParentID IS NULL
   UNION ALL
   SELECT MyDepartment.DepartmentID, MyDepartment.DepartmentName, MyDepartment.ParentID, OrgTree.Tree + 1
   FROM MyDepartment
   JOIN OrgTree ON MyDepartment.ParentID = OrgTree.DepartmentID
)
SELECT * FROM OrgTree OPTION (MAXRECURSION 10) 


-- return everyone under Program Manager (ParentID = 8)
WITH OrgTree (DepartmentID, DepartmentName, ParentID, Tree)
AS
(
   SELECT DepartmentID, DepartmentName, ParentID , 0 AS Tree 
   FROM MyDepartment
   WHERE ParentID = 8
   UNION ALL
   SELECT MyDepartment.DepartmentID, MyDepartment.DepartmentName, MyDepartment.ParentID , OrgTree.Tree + 1
   FROM MyDepartment
   JOIN OrgTree ON MyDepartment.ParentID = OrgTree.DepartmentID
)
SELECT * FROM OrgTree;


-- return Vice President (DepartmentID = 4) and direct reports (ParentID = 4)
WITH OrgTree (DepartmentID, DepartmentName, ParentID, Tree)
AS
(
   SELECT DepartmentID, DepartmentName, ParentID , 0 AS Tree 
   FROM MyDepartment
   WHERE DepartmentID = 4
   UNION ALL
   SELECT MyDepartment.DepartmentID, MyDepartment.DepartmentName, MyDepartment.ParentID , OrgTree.Tree + 1
   FROM MyDepartment
   JOIN OrgTree ON MyDepartment.ParentID = OrgTree.DepartmentID
   WHERE MyDepartment.ParentID = 4
)
SELECT * FROM OrgTree;

-- return everyone above Senior Manager (DepartmentID = 6)
WITH OrgTree(DepartmentName,ParentID,ReportsTo)AS
(
   SELECT T1.DepartmentName,T2.DepartmentID,T2.DepartmentName 
   FROM MyDepartment T1
   INNER JOIN MyDepartment T2 ON T1.ParentID=T2.DepartmentID 
   WHERE T1.DepartmentID=6
   UNION ALL
   SELECT OT.ReportsTo,T2.DepartmentID,T2.DepartmentName
   FROM OrgTree OT
   INNER JOIN MyDepartment T1 ON OT.ParentID=T1.DepartmentID
   INNER JOIN MyDepartment T2 ON T1.ParentID=T2.DepartmentID
)
SELECT * FROM OrgTree;


-- return list with of people with no direct reports
WITH OrgTree(ParentID, DepartmentID, DepartmentName, DepartmentLevel) AS 
(
    SELECT ParentID, DepartmentID, DepartmentName, 0 AS DepartmentLevell
    FROM MyDepartment 
    WHERE ParentID IS NULL
    UNION ALL
    SELECT e.ParentID, e.DepartmentID, e.DepartmentName,  DepartmentLevel + 1
    FROM MyDepartment AS e
    INNER JOIN OrgTree AS d ON e.ParentID = d.DepartmentID 
)
SELECT * FROM OrgTree WHERE DepartmentLevel = 5;

