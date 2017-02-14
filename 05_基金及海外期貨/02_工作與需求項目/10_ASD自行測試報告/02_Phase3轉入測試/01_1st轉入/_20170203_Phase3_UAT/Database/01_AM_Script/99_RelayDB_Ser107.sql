

--1總行
insert into isdbTGL.dbo.vfnbroker_head 
select * from RelayDB.dbo.vfnbroker_head 
--2分行
insert into isdbTGL.dbo.vfnbroker
select * from RelayDB.dbo.vfnbroker 
--3基金公司
insert into isdbTGL.dbo.fn_fd_com
select * from RelayDB.dbo.fn_fd_com

--4更新基金基本資料的compno
update a set a.compno = b.compno 
from isdbTGL.DBO.fn_Fd_data a 
left join isdbTGL.DBO.fn_Fd_com b on b.compno = left(convert(varchar,a.memo) ,5)
