USE [isdbTGL]
GO


INSERT INTO [isdbTGL].[dbo].[TAB_PRT_MSREPORT_L]
SELECT 
       'MSREPORT09_1' [RCODE]
      ,[RLINE]
      ,[RLNAME]
      ,[STARTDT]
      ,[ENDDT]
      ,[REMARK]
      ,[USERID]
      ,[U_DATE]
  FROM [isdbTGL].[dbo].[TAB_PRT_MSREPORT_L]
  where rcode ='MSREPORT09'
  GO

UPDATE [dbo].[TAB_PRT_MSREPORT_L]
   SET   RLine = '01'
 WHERE RCODE in ('MSREPORT10')
 AND     RLINE = '04'
 AND     RLNAME ='°òª÷'
GO

UPDATE [dbo].[TAB_PRT_MSREPORT_L]
   SET 
      [STARTDT] = '20151231'
     
 WHERE RCODE in ('MSReport07','MSREPORT08','MSReport09_1','MSREPORT10','MSREPORT11')
 AND     RLINE = '01'
GO

/*
select a.*
from	dbo.tab_prt_msreport_l a
 WHERE RCODE in ('MSReport07','MSREPORT08','MSReport09','MSReport09_1','MSREPORT10','MSREPORT11','MSREPORT12')
 AND     RLINE = '01'


 select a.*
 from	dbo.tab_prt_msreport_l a
 WHERE RCODE in ('MSREPORT10')


 */