--RB_Rule�s�W���
--RuleSource        ����k��
--RuleClassCod   ��������
--RuleDept           �޲z����
--RuleA                  ����s��-��
--RuleB                   ����s��-��
--RuleC                  ����s��-��
--RuleD                  ����s��-��
--RuleE                   ����s��-��
--ModifyDate      ���ʤ�
--EndDate            �פ��
 
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