USE [isdbTGL]
GO
--REBATE���v��
update vfnbroker set neagt = 'First Commercial Bank, Taipei, Taiwan' 
where iagt = '10009' and isBank = 'Y'

update vfnbroker_head set swift_code ='FCBKTWFP' where imagt ='10003'
