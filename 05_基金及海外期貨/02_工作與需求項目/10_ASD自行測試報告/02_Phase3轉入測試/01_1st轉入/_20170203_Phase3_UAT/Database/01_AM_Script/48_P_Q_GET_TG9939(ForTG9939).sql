USE [isdbTGL]
GO
/****** Object:  StoredProcedure [dbo].[P_Q_GET_TG9939]    Script Date: 2017/1/19 �U�� 02:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/*
�\�@�@��GTG9939-����t�������v��
�ǤJ�ѼơG	@i_Fund1			����N��(�겣�O)
						@i_Fund2			����N��(Portfolio)
						@i_FundType		����(�۾�/�N��) For level2		--> 1:�۾� 2:�N��
						@i_Fundlevel		�h��	--> 1:�겣�O 2:�b��O 3:���զX
						@i_Dstart				�}�l���
						@i_Dend				�������
						@i_DateType		�������	-->1:����� 2:��Τ�
						@i_Fdis				�ꤺ    -->1:�ꤺ 2:��~

�d�@�@�ҡG
 exec P_Q_GET_TG9939 '0', '0000', '1', '2', '20161109', '20170118' , 1 , 1 
 exec P_Q_GET_TG9939 '0', '0000', '1', '2', '20170113', '20170113' , 2 , 1 
 exec P_Q_GET_TG9939 '0', '0000', '2', '2', '20161101', '20170118' , 1 , 2 
					
*/

CREATE PROCEDURE [dbo].[P_Q_GET_TG9939] 
	@i_Fund1 varchar(20),
	@i_Fund2 varchar(20),
	@i_FundType varchar(1),
	@i_Fundlevel varchar(1),
	@i_Dstart varchar(8),
	@i_Dend varchar(8),
	@i_DateType int,
	@i_Fdis int
 AS

Declare @querySQL as varchar(150)
Declare @whereSQL as varchar(100)

Set @whereSQL=''
--�d�߱��� (�����or��Τ�) (�ꤺor��~) ---
	If @i_Fdis = 1 Set @whereSQL += ' and icurid = ''TWD'' '
	If @i_Fdis = 2 Set @whereSQL += ' and icurid <> ''TWD'' '
	If @i_DateType = 1 Set @whereSQL += ' and ddate_w >= ' + @i_Dstart + ' and ddate_w <= ' + @i_Dend + ' order by ddate_w '
	If @i_DateType = 2 Set @whereSQL += ' and Iaccdate_w >= ' + @i_Dstart + ' and Iaccdate_w <= ' + @i_Dend + ' order by Iaccdate_w '
----------------------------------------------------

 Select 
   isnull(Substring(r.monfund,1,1),'') as ifund1 
 , isnull(a.ifund,'') as ifund2 
 , isnull(g.fund_type,'') as fund_type 
 , isnull(g.level,'') as fund_level
 , isnull(a.ddate_w,'') as ddate_w 
 , isnull(a.Iaccdate_w,'') as Iaccdate_w 
 , isnull(a.ifdID,'') as ifdID 
 , isnull(b.ifdname,'') as ifdname 
 , isnull(a.icurid,'') as icurid 
 , isnull(a.msumTWD,0) as msumTWD 
 , isnull(a.msumCur,0) as msumCur 
 , isnull(c.ActName,'') as ActName 
 , isnull(d.nagt,'') as nagt 
 , isnull(a.CashAccount,'') as CashAccount 
 , isnull(f.q_qty,0) as q_qty 
 , Convert(decimal(20,4), isnull(a.msumTWD,0)/isnull(f.q_qty,1)) as unitTWD 
 , Convert(decimal(20,4), isnull(a.msumCur,0)/isnull(f.q_qty,1)) as unitCur 
 , (case when @i_fundtype = '1' then (select nC from cm_fund_data where ifund=(case when Substring(r.monfund,1,1)='1' then '1AKH' else 'ZATG' end))
            when @i_fundtype = '2' then (case when Substring(r.monfund,1,1)='1' then '�N��(KH)' else '�N��(TG)' end)
    end) as ifund1name
 , isnull(g.nC, '') as ifund2name
 Into #tmpTG9939
 From fn_fd_getch a 
 inner join fn_fd_data b on a.ifdID = b.ifdID 
 left join cm_act_data c on a.ibank = c.iagt and c.classcod = 'BANK' 
 left join vfnbroker d on a.Iagtid = d.iagt 
 left join fn_dfd f on a.ifund = f.ifund and a.ifdID = f.ifdID and f.ddate_w = dbo.F_Q_DateAfterType_w('A','1' ,'0' ,-1 , a.ddate_w )
 inner join cm_fund_data g on a.ifund = g.ifund
 inner join cm_fund_relation r on a.ifund = r.sonfund 
 where 1=1 
 And ( (@i_Fund1 = '0') Or (@i_Fund1 = '1' And substring(r.monfund,1,1) = '1') Or (@i_Fund1 = 'Z' And substring(r.monfund,1,1) ='Z') )
 And ( (@i_Fund2 = '0000') Or (@i_Fund2 <> '0000' And a.iFund = @i_Fund2) )
 And ( (@i_FundType = '0') Or (@i_FundType <> '0' And g.fund_type = @i_FundType) )
 And ( (@i_Fundlevel = '0') Or (@i_Fundlevel <> '0' And g.level = @i_Fundlevel) )

 Set @querySQL= 'select * from #tmpTG9939 where 1=1 ' + @whereSQL 
 exec (@querySQL)





