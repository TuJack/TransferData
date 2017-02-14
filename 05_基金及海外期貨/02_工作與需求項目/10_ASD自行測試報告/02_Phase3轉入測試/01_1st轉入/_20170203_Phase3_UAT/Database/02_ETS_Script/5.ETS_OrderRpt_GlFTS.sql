USE [ETS_P]
GO

/****** Object:  StoredProcedure [dbo].[P_Q_GetOrderRpt_GlFTS]    Script Date: 2017/2/2 ¤W¤È 10:28:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[P_Q_GetOrderRpt_GlFTS] (@ddate Varchar(8), @batchno varchar(8)) 
As

Begin

declare @ddate_fas as varchar(8)
select top 1 @ddate_fas =  ddate_w from v_fas_fn_dstk where ddate_w < @ddate order by ddate_w desc
declare @ddate_hedgemapping as varchar(8)
select top 1 @ddate_hedgemapping = ddate from FOHedgeMappingHistory where ddate <@ddate order by ddate desc


		DECLARE @tb_currency TABLE
		(
			ddate varchar(8),
			icurid Varchar(3),
			price Decimal(18,7)
		)
		Insert Into @tb_currency
		select d.ddate_w,d.icurid,d.price from
		(
		select * from 
		(
		select *,ROW_NUMBER () OVER(PARTITION BY icurid ORDER BY ddate_w DESC) as rn from 
		(
		select distinct ddate_w, icurid from isdbtgl.dbo.fn_cur_priceTWD where ddate_w < @ddate and ddate_w >= convert(varchar,dateadd(day,-150 ,convert(datetime,@ddate,112)),112)
		) a 
		) b 
		where b.rn = 1
		)c 
		left join isdbtgl.dbo.fn_cur_priceTWD d on c.ddate_w = d.ddate_w and c.icurid = d.icurid 



	select a.fundid,b.fundSname,d.fundid,e.fundsname hedgeFund,
a.productid + '  ' +c.ShortName as productname,a.Maturity,
(
  select sum(price * (case when qshare < (amount*1000) then qshare else (amount*1000) end)) from 
 (
	select qshare,price,ifund,istkid from v_fas_fn_dstk where ifund = d.fundid  and ddate_w = @ddate_fas
 ) a inner join FOHedgeSetting tb on tb.fofundid = d.fofundid and tb.begindt <= @ddate and isnull(enddt,'29991231') >= @ddate and a.istkid = tb.stock
 inner join v_fas_fn_stk_data tc on a.istkid = tc.istkid and @ddate between tc.duse_w and tc.dexpire_w and tc.icountry = c.icountry
) hedgevalue,
(
  select sum(a.price * cur.price * (case when qshare < (amount*1000) then qshare else (amount*1000) end)) from 
 (
 select qshare,price,ifund,istkid from v_fas_fn_dstk where ifund = d.fundid  and ddate_w = @ddate_fas
 ) a inner join FOHedgeSetting tb on tb.fofundid = d.fofundid and tb.begindt <= @ddate and isnull(enddt,'29991231') >= @ddate and a.istkid = tb.stock
 inner join v_fas_fn_stk_data tc on a.istkid = tc.istkid and @ddate between tc.duse_w and tc.dexpire_w and tc.icountry = c.icountry
 left join @tb_currency cur on tc.icurid = cur.icurid
)  hedgevalueTW,
d.Correlation,
d.beta,
isnull(f.amount,0) samount, isnull(f.TotalPrice ,0) * c.point svalue,
a.bs,
a.Price,
a.Price2,
a.amount,
g.mname,
(a.Price * a.amount * c.point) + (isnull(f.TotalPrice ,0) * c.point)   as 'mvalue',b.AccountType,
(case when a.amount = f.amount then 0 else  (isnull((a.Price * a.amount * c.point),0)  + (isnull(f.TotalPrice ,0) * c.point))end) /
isnull(
(
  select sum(price * (case when qshare < (amount*1000) then qshare else (amount*1000) end)) from 
 (
	select qshare,price,ifund,istkid from v_fas_fn_dstk where ifund = d.fundid  and ddate_w = @ddate_fas
 ) a inner join FOHedgeSetting tb on tb.fofundid = d.fofundid and tb.begindt <= @ddate and isnull(enddt,'29991231') >= @ddate and a.istkid = tb.stock
	inner join v_fas_fn_stk_data tc on a.istkid = tc.istkid and @ddate between tc.duse_w and tc.dexpire_w and tc.icountry = c.icountry
)
,1) * 100 as rate,
(case when a.bs='B' then a.amount else (0-a.amount) end) + isnull(f.amount,0)  as bamount
,a.Currency
from funddecision a 
left join funddata b on a.fundid = b.fundid  
left join fodata c on a.productid = c.foid 
left join FOHedgeMappingHistory d on a.fundid = d.fofundid and d.ddate = @ddate_hedgemapping
left join funddata e on d.fundid  = e.fundid  
left join 
(
	select ifund,iftsid,sum(qftss) amount,sum(qftss * price ) TotalPrice from v_fas_fn_dfts where ddate_w = @ddate_fas group by ifund,iftsid,ftrade
) f on a.fundid = f.ifund and a.productid+ a.Maturity  = f.iftsid 
left join mappingcode g on g.mcID = 'HedgeType' and g.mID = a.hedgetype
left join @tb_currency cur on a.Currency = cur.icurid
where a.product = 'FTS' and convert(varchar, a.decdt,112) = @ddate  and a.IsDelete = '0' And a.RiskST in ('0','1') and c.region <> 'TW' and a.batchno = @batchno 
	

--select top 1 AX250D,* from [dbo].[v_Cmoney_CMoney_DailyTechIndex]
--where istkid = 'TWA00' and ddate <= convert(varchar,getdate(),112)
--order by ddate desc



--select top 1 close_price,* from [dbo].[v_Cmoney_Cmoney_FtsRateIndex]
--where idno = 'VIX15' and ddate < convert(varchar,getdate(),112)
--order by ddate desc

--select avg(close_price) close_price
--from 
--(
--select top 750 (close_price) from [dbo].[v_Cmoney_Cmoney_FtsRateIndex]
--where idno = 'VIX15' and ddate < convert(varchar,getdate(),112)
--order by ddate desc
--)a

--select * from 
--(
--select  rank() over(order by close_price) 'rank',* from 
--(
--select top 750 close_price from [dbo].[v_Cmoney_Cmoney_FtsRateIndex]
--where idno = 'VIX15' and ddate < convert(varchar,getdate(),112)
--order by ddate desc
--)a
--)b where b.rank = '38'




End

GO


