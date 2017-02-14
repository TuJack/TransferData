--RB_Rule新增欄位
--RuleSource        條文法源
--RuleClassCod   條文類型
--RuleDept           管理部門
--RuleA                  條文編號-條
--RuleB                   條文編號-項
--RuleC                  條文編號-款
--RuleD                  條文編號-目
--RuleE                   條文編號-次
--ModifyDate      異動日
--EndDate            終止日
 
alter table Riskmgt.dbo.RB_Rule add RuleSource nvarchar(200)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleClassCod  nvarchar(50)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleDept nvarchar(50)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleA varchar(20)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleB varchar(20)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleC varchar(20)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleD varchar(20)  null 
go
alter table Riskmgt.dbo.RB_Rule add RuleE varchar(20)  null 
go
alter table Riskmgt.dbo.RB_Rule add ModifyDate varchar(8)  null 
go
alter table Riskmgt.dbo.RB_Rule add EndDate varchar(8)  null 
go