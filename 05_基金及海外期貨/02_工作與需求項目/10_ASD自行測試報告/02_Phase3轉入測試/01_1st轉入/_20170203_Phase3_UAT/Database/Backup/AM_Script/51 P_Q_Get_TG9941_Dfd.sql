USE [isdbTGL]
GO
/****** Object:  StoredProcedure [dbo].[P_Q_Get_TG9941_Dfd]    Script Date: 2017/2/9 下午 05:17:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
MMF管理報表-持有基金佔基金規模比例検核表
*/

--exec [dbo].[P_Q_Get_TG9941_Dfd] '20160930'
CREATE PROCEDURE [dbo].[P_Q_Get_TG9941_Dfd] (@Sddate as varchar(8) ) 

AS

--1 建立tmptable, 塞入各基金的庫存_台幣成本資料
 select ifund ,ddate_w ,ifdid ,mcostTWD  
 into #tmpfn_dfd 
 from fn_dfd 
 where ifund in ('1ak','zat','ka') 
 and ddate_w =@Sddate

 --2 基金規模fundsize(抓查詢日最新的fundsize資料)
 insert into #tmpfn_dfd
select 'fundsize' as ifund , a.ddate_w ,a.itemcod ,sum(mvalue) as mcostTWD 
from fn_invest_index a 
inner join (
	select itemcod ,max(ddate_w) as ddate_w from fn_invest_index where classcod ='fof' and fkind ='Oamt'and ddate_w <=@Sddate group by itemcod 
) x on x.itemcod =a.itemcod and x.ddate_w =a.ddate_w 
where a.classcod ='fof' and fkind ='oamt'
and a.itemcod in (select distinct ifdid From #tmpfn_dfd )
GROUP BY a.ddate_w ,a.itemcod 
 
 --3 show(由直轉成橫，顯示)
 select ddate_w ,ifdid 
 ,isnull([ZAT],0) as'TG',isnull([1AK],0) as'KH',isnull([KA],0) as 'KH883',isnull(fundsize,0) as 'fundsize' 
 into #tmpfinaal_fn_dfd
 from #tmpfn_dfd 
 PIVOT (
	sum(mcostTWD) for ifund in ([ZAT],[1AK],[KA],[fundsize])
 ) x 

 --5 做資料的運算(數值以「億」為單位)
 select x.ifdid as '基金代號', isnull( b.ifdname ,'') as '基金名稱'
 ,x.TG ,x.KH,x.KH883 as 'KH-883'
 ,x.msum as '合計' ,FUNDSIZE as '基金規模(億)'
 ,(case when x.fundsize = 0 then 0 else x.msum / x.fundsize  end) AS '佔率(估計)'
 ,(case when x.fundsize = 0 then '-' when  x.msum / x.fundsize >0.08 then 'X' else 'PASS' end) as '<8%(警戒水位)'
 from (
	  select ddate_w ,ifdid 
	 ,Round(TG /100000000,2) as TG 
	 ,Round(KH /100000000,2) as KH
	 ,Round(KH883 /100000000,2) as KH883
	 ,Round(TG /100000000,2)+ Round(KH /100000000,2)+Round(KH883 /100000000,2) as msum
	 ,Round(FUNDSIZE /100000000,2) as FUNDSIZE
	  from #tmpfinaal_fn_dfd   
 ) x 
 left join fn_Fd_data b on b.ifdid =x.ifdid and x.ddate_w between b.duse_w and b.dexpire_w 

drop table #tmpfn_dfd
drop table #tmpfinaal_fn_dfd