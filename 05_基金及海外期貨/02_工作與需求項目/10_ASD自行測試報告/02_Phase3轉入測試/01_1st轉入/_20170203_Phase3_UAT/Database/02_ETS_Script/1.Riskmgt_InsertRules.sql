use riskmgt

DBCC CHECKIDENT ('rb_rule', RESEED, 27);
GO

delete RB_CheckList where checklistid in (10,11)

-- Rule 18 SIL
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P9','���ʲ��H�U���','10',0,'��',9,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P10','�Ѳ���P���ū����','10',0,'��',10,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P11','�Ũ髬���','30',0,'��',11,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P12','�f�������','150',0,'��',12,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert 30,'P13','��¦�س]���','20',0,'��',13,1,''


declare @ruleid as int = 0
declare @procid as int = 0 

--rule28
exec dbo.ITC_RB_SP_DS_Rule_Insert '��@���}�o��x������A���o�W�L����W�Ҥ��@�w���','��@���}�o��x������A���o�W�L����W�Ҥ��@�w���'
				,'10','IAD','0','1','RR_Alarm_R28','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR28',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule29
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '���}�o��x������`�B�A���o�W�L�i�B�θ�����@�w���','���}�o��x������`�B�A���o�W�L�i�B�θ�����@�w���'
				,'10','IAD','0','1','RR_Alarm_R29','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR29',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule30
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�~������`�B�A���o�W�L�֩w��~����ҡ]43.00%�^���]40%�^','�~������`�B�A���o�W�L�֩w��~����ҡ]43.00%�^���]40%�^'
				,'10','IAD','0','1','RR_Alarm_R30','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR30',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.4',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 


--rule31
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '��@�~���Ҩ���/���ƫ�/���ʲ����H�U/��¦�س]/�ӫ~���/ETF�A���o�W�L�i�B�θ�����@�w���','��@�~���Ҩ���/���ƫ�/���ʲ����H�U/��¦�س]/�ӫ~���/ETF�A���o�W�L�i�B�θ�����@�w���'
				,'10','IAD','0','1','RR_Alarm_R31','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR31',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule32
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '��@�~���Ҩ���/���ƫ�/���ʲ����H�U/��¦�س]/�ӫ~/��R/�p�Ҫ��v���/ETF�A���o�W�L����W�Ҥ��@�w���','��@�~���Ҩ���/���ƫ�/���ʲ����H�U/��¦�س]/�ӫ~/��R/�p�Ҫ��v���/ETF�A���o�W�L����W�Ҥ��@�w���'
				,'10','IAD','0','1','RR_Alarm_R32','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR32',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule33
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�~����R/�p�Ҫ��v����`�B�A���o�W�L�i�B�θ�����@�w���','�~����R/�p�Ҫ��v����`�B�A���o�W�L�i�B�θ�����@�w���'
				,'10','IAD','0','1','RR_Alarm_R33','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR33',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.25',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule34
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�~����R/�p�Ҫ��v����A��@����`�B�W�L�i�B�θ���U�������H�W�̡A���������Ʒ|�q�L��l�o���C���p��e�z��@����`�B���F�s�O���@�����̡A�o�H�s�O���@�����p','�~����R/�p�Ҫ��v����A��@����`�B�W�L�i�B�θ���U�������H�W�̡A���������Ʒ|�q�L��l�o���C���p��e�z��@����`�B���F�s�O���@�����̡A�o�H�s�O���@�����p'
				,'10','IAD','0','1','RR_Alarm_R34','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR34',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.0005',0,'%',1,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Value','�̧C����`�B','1',0,'��',2,1,''

set @ruleid = 0 
set @procid = 0 

--rule35
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�~����R���������g�z���q���b�g�٦X�@�[�o�i��´��a�D�޾������U�̬����A�B�޲z��R������v�����G�~�H�W�A�޲z��R������겣���o�֩�����G�����ε��ȥ~��','�~����R���������g�z���q���b�g�٦X�@�[�o�i��´��a�D�޾������U�̬����A�B�޲z��R������v�����G�~�H�W�A�޲z��R������겣���o�֩�����G�����ε��ȥ~��'
				,'10','IAD','0','1','RR_Alarm_R35','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR35',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'value','�޲z���','2',0,'����',2,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'year','�޲z��R����~','2',0,'�~',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule36
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�~���p�Ҫ��v���������޲z���c���b�g�٦X�@�[�o�i��´��a�D�޾����X�k���U�̬����A�B�޲z�p�Ҫ��v������v�������~�H�W�A�޲z�p�Ҫ��v������겣���o�֩�����������ε��ȥ~��','�~���p�Ҫ��v���������޲z���c���b�g�٦X�@�[�o�i��´��a�D�޾����X�k���U�̬����A�B�޲z�p�Ҫ��v������v�������~�H�W�A�޲z�p�Ҫ��v������겣���o�֩�����������ε��ȥ~��'
				,'10','IAD','0','1','RR_Alarm_R36','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR36',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'value','�޲z���','5',0,'����',2,1,''
exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'year','�޲z��R����~','5',0,'�~',1,1,''

set @ruleid = 0 
set @procid = 0 

--rule37
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�i��S�w�έ��j����B�Ϋe�A���X��k��N����','�i��S�w�έ��j����B�Ϋe�A���X��k��N����'
				,'10','IAD','0','1','RR_Alarm_R37','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR37',2,'','','',1,'',''



set @ruleid = 0 
set @procid = 0 


--rule38
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '���o�γB���겣�O�_���ӳ����i','���o�γB���겣�O�_���ӳ����i'
				,'10','IAD','0','1','RR_Alarm_R38','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR38',2,'','','',1,'',''


set @ruleid = 0 
set @procid = 0 


--rule39
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '�̪k�֭㤽�}�o��/�p�Ұ��','�̪k�֭㤽�}�o��/�p�Ұ��'
				,'10','IAD','0','1','RR_Alarm_R39','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR39',2,'','','',1,'',''

exec dbo.ITC_RB_SP_DS_CheckList_Insert @ruleid,'�̪k�֭㤽�}�o��/�p�Ұ���M��','����M��','��JISIN'

set @ruleid = 0 
set @procid = 0 

--rule40
				
exec dbo.ITC_RB_SP_DS_Rule_Insert '��~����`�B���o�W�L�i�B�θ�����@�w���','��~����`�B���o�W�L�i�B�θ�����@�w���'
				,'10','IAD','0','1','RR_Alarm_R40','','1',''
select top 1 @ruleid= ruleid from rb_rule order by ruleid desc

exec dbo.ITC_RB_SP_DS_Proc_Insert @ruleid,'ETSR40',2,'','','',1,'',''

select top 1 @procid = procid from rb_procedure order by procid desc

exec dbo.ITC_RB_SP_DS_Param_Insert @procid,'Rate','���','0.43',0,'%',1,1,''

set @ruleid = 0 
set @procid = 0 

