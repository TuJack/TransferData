use riskmgt

DBCC CHECKIDENT ('rb_rule', RESEED, 27);
GO

delete RB_CheckList where checklistid in (10,11)

-- Rule 18 SIL
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P9','不動產信託基金','10',0,'億',9,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P10','股票基與平衡型基金','10',0,'億',10,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P11','債券型基金','30',0,'億',11,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P12','貨幣型基金','150',0,'億',12,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P13','基礎建設基金','20',0,'億',13,1,''


declare @ruleid as int = 0
declare @procid as int = 0 

--rule28
exec dbo.ITC_RB_SP_DS_Rule_Insert '單一公開發行台幣基金，不得超過基金規模之一定比例','單一公開發行台幣基金，不得超過基金規模之一定比例'
				,'10','IAD','0','1','RR_Alarm_R28','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR28',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule29
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '公開發行台幣基金總額，不得超過可運用資金之一定比例','公開發行台幣基金總額，不得超過可運用資金之一定比例'
				,'10','IAD','0','1','RR_Alarm_R29','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR29',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule30
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '外幣基金總額，不得超過核定國外投資比例（43.00%）之（40%）','外幣基金總額，不得超過核定國外投資比例（43.00%）之（40%）'
				,'10','IAD','0','1','RR_Alarm_R30','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR30',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.4',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 


--rule31
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '單一外幣證券投資/指數型/不動產投資信託/基礎建設/商品基金/ETF，不得超過可運用資金之一定比例','單一外幣證券投資/指數型/不動產投資信託/基礎建設/商品基金/ETF，不得超過可運用資金之一定比例'
				,'10','IAD','0','1','RR_Alarm_R31','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR31',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule32
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '單一外幣證券投資/指數型/不動產投資信託/基礎建設/商品/對沖/私募股權基金/ETF，不得超過基金規模之一定比例','單一外幣證券投資/指數型/不動產投資信託/基礎建設/商品/對沖/私募股權基金/ETF，不得超過基金規模之一定比例'
				,'10','IAD','0','1','RR_Alarm_R32','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR32',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule33
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '外幣對沖/私募股權基金總額，不得超過可運用資金之一定比例','外幣對沖/私募股權基金總額，不得超過可運用資金之一定比例'
				,'10','IAD','0','1','RR_Alarm_R33','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR33',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule34
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '外幣對沖/私募股權基金，單一投資總額超過可運用資金萬分之五以上者，應提報董事會通過後始得投資。但計算前述單一投資總額未達新臺幣一億元者，得以新臺幣一億元計','外幣對沖/私募股權基金，單一投資總額超過可運用資金萬分之五以上者，應提報董事會通過後始得投資。但計算前述單一投資總額未達新臺幣一億元者，得以新臺幣一億元計'
				,'10','IAD','0','1','RR_Alarm_R34','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR34',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.0005',0,'%',1,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Value','最低投資總額','1',0,'億',2,1,''

set @ruleid = 0 
set @procid = 0 

--rule35
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '外幣對沖基金之基金經理公司須在經濟合作暨發展組織國家主管機關註冊者為限，且管理對沖基金歷史須滿二年以上，管理對沖基金之資產不得少於美金二億元或等值外幣','外幣對沖基金之基金經理公司須在經濟合作暨發展組織國家主管機關註冊者為限，且管理對沖基金歷史須滿二年以上，管理對沖基金之資產不得少於美金二億元或等值外幣'
				,'10','IAD','0','1','RR_Alarm_R35','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR35',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'value','管理基金','2',0,'億元',2,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'year','管理對沖基金年','2',0,'年',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule36
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '外幣私募股權基金之基金管理機構須在經濟合作暨發展組織國家主管機關合法註冊者為限，且管理私募股權基金歷史須滿五年以上，管理私募股權基金之資產不得少於美金五億元或等值外幣','外幣私募股權基金之基金管理機構須在經濟合作暨發展組織國家主管機關合法註冊者為限，且管理私募股權基金歷史須滿五年以上，管理私募股權基金之資產不得少於美金五億元或等值外幣'
				,'10','IAD','0','1','RR_Alarm_R36','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR36',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'value','管理基金','5',0,'億元',2,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'year','管理對沖基金年','5',0,'年',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule37
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '進行特定或重大資金運用前，應出具法遵意見書','進行特定或重大資金運用前，應出具法遵意見書'
				,'10','IAD','0','1','RR_Alarm_R37','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR37',2,'','','',1,'',''



set @ruleid = 0 
set @procid = 0 


--rule38
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '取得或處分資產是否須申報公告','取得或處分資產是否須申報公告'
				,'10','IAD','0','1','RR_Alarm_R38','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR38',2,'','','',1,'',''


set @ruleid = 0 
set @procid = 0 


--rule39
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '依法核准公開發行/私募基金','依法核准公開發行/私募基金'
				,'10','IAD','0','1','RR_Alarm_R39','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR39',2,'','','',1,'',''

exec dbo.ITC_RB_SP_DS_CheckList_Insert @ruleid,'依法核准公開發行/私募基金清單','基金清單','填入ISIN'

set @ruleid = 0 
set @procid = 0 

--rule40
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '國外投資總額不得超過可運用資金之一定比例','國外投資總額不得超過可運用資金之一定比例'
				,'10','IAD','0','1','RR_Alarm_R40','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR40',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','比例','0.43',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

