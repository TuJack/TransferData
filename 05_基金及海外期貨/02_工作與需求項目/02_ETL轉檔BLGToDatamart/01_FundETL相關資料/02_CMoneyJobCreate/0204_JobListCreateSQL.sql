Use CMoney
Go

insert into CMoney.dbo.Job_List (
   jobID, jobName, cmTable, nsTable, criteriaID, 
   criteriaID2, criteriaType, flag_use, flag_spec, flag_nonbatch 
)
Values (
   80, '基金-投信公司基本資料表' , '投信公司基本資料表', 'CMoney_SIT', '年度', 
   'YYYY', 'year', 'Y', 'N', 'N'
)


insert into CMoney.dbo.Job_List (
   jobID, jobName, cmTable, nsTable, criteriaID, 
   criteriaID2, criteriaType, flag_use, flag_spec, flag_nonbatch 
)
Values (
   81, '基金-投信基金基本資料表' , '投信基金基本資料表', 'CMoney_SITFund', '年度', 
   'YYYY', 'year', 'Y', 'N', 'N'
)
