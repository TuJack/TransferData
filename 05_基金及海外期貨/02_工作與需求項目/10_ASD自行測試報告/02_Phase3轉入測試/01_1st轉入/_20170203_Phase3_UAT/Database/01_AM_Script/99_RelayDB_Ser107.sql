

--1�`��
insert into isdbTGL.dbo.vfnbroker_head 
select * from RelayDB.dbo.vfnbroker_head 
--2����
insert into isdbTGL.dbo.vfnbroker
select * from RelayDB.dbo.vfnbroker 
--3������q
insert into isdbTGL.dbo.fn_fd_com
select * from RelayDB.dbo.fn_fd_com

--4��s����򥻸�ƪ�compno
update a set a.compno = b.compno 
from isdbTGL.DBO.fn_Fd_data a 
left join isdbTGL.DBO.fn_Fd_com b on b.compno = left(convert(varchar,a.memo) ,5)
