use isdbTGL
--新增欄位
alter table isdbTGL.dbo.fn_fts_style add icountry varchar(2)
alter table isdbTGL.dbo.fn_Dfts add TWDcurprice decimal(20,6) default 1
alter table isdbtgl.dbo.fn_fd_com add email varchar(100)

--修改欄位大小
alter table isdbTGL.dbo.vfnbroker_head alter column neagt varchar(100)
alter table isdbTGL.dbo.vfnbroker_head alter column nagt varchar(100)
alter table isdbTGL.dbo.vfnbroker_head alter column nsagt varchar(100)

alter table isdbTGL.dbo.vfnbroker alter column neagt varchar(100)
alter table isdbTGL.dbo.vfnbroker alter column nagt varchar(100)
alter table isdbTGL.dbo.vfnbroker alter column nsagt varchar(100)

--加上default值
alter table isdbTGL.dbo.vfnbroker ADD constraint [DF__vfnbroker_time_update] default getdate() for [time_update]
alter table isdbTGL.dbo.vfnbroker ADD constraint [DF__vfnbroker_systime] default getdate() for [systime]




