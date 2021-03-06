USE [ETS_P]
GO
/****** Object:  StoredProcedure [dbo].[P_Q_GetOrderRpt_FoF_Detail]    Script Date: 2017/2/3 上午 11:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[P_Q_GetOrderRpt_FoF_Detail] (@ddate Varchar(8),@fundtype varchar(1),@tradetype varchar(1),@batchno int) 
As

Begin



declare @ddate_fas as table
(
	ifund varchar(12),
	ddate varchar(8)
)

insert into @ddate_fas 
select ifund,ddate_w from 
			 (
			 select *,ROW_NUMBER () OVER(PARTITION BY ifund ORDER BY ddate_w DESC) as rn from 
			 (
			 select distinct ifund, ddate_w from v_fas_fn_dfd where ddate_w < @ddate and ddate_w >= convert(varchar,dateadd(day,-5 ,convert(datetime,@ddate,112)),112)
			 )a
			 ) b where b.rn = '1'

	/*
	Declare @ddate Varchar(8)
	Set @ddate = '20150130'
	*/

		--===========================================================
		-----------------------------------------------------
		Declare @TempMain Table 
		(
			ad_date Datetime,
			Data_Group Varchar(10),
			Data_Type Varchar(50),
			fundid Varchar(50),
			fundsname Varchar(100),
			stockid Varchar(100),
			stockname Varchar(100),
			storeamount Decimal(18, 6),
			lastprice Decimal(18, 6),
			cost Decimal(18, 6),
			currency varchar(10),
			currencyrate decimal(18,6),
			amount Decimal(20, 8),
			amountrate Decimal(20, 8),		
			totalprice Decimal(18, 6),
			totalpriceTWD Decimal(18, 6),
			SILP Varchar(50),
			SILPLimit Varchar(50),
			capitalrate Varchar(50),
			capitalratelimit Varchar(50),
			totalcapitalrate Varchar(50),
			income Float,
			totalamountrate Decimal(18, 6),				
			StockPool Varchar(10),
			FundUserTrans Varchar(10),
			FundCost Decimal(20, 6),
			FundAUM Decimal(20, 6)
		)
		-----------------------------------------------------
		--===========================================================

		--===========================================================
		-----------------------------------------------------
		--買進子表
		DECLARE @tb_SILPLimit TABLE
		(
			stock Varchar(50),
			limitvalue Decimal(10,2)
		)

			Insert Into @tb_SILPLimit
				Select a.BTicker 
					, (Case When b.itemiddesc Is Not Null Then b.itemiddesc
								When a.AssetType = '17' Then (Select paramvalue From [dbo].[v_Riskmgt_Rules] Where ruleid = '18' And execsystem  = '2' and ParamPosition = '9')
								When a.AssetType = '02' or a.AssetType = '03' Then (Select paramvalue From [dbo].[v_Riskmgt_Rules] Where ruleid = '18' And execsystem  = '2' and ParamPosition = '10')
								When a.AssetType = '01' Then (Select paramvalue From [dbo].[v_Riskmgt_Rules] Where ruleid = '18' And execsystem  = '2' and ParamPosition = '11')
								When a.AssetType = '06' Then (Select paramvalue From [dbo].[v_Riskmgt_Rules] Where ruleid = '18' And execsystem  = '2' and ParamPosition = '12')
								When a.AssetType = '18' Then (Select paramvalue From [dbo].[v_Riskmgt_Rules] Where ruleid = '18' And execsystem  = '2' and ParamPosition = '13')
								Else 0
					End) As LimitValue
				From FofFundData a
				Left Join v_Riskmgt_RuleMultiValue b On b.ruleid = '18' And checklistid = '6' And a.BTicker = b.itemid
				

		DECLARE @tb_SILP TABLE
		(
			stock Varchar(50),
			value Decimal(20,2),
			amount Decimal(20,2)
		)
		Insert Into @tb_SILP
		select productid,sum(mamt) as mamt, sum(amount) as amount from 
		(
			select ifdid productid,isnull(sum(mamttwd ),0) mamt, isnull(sum(q_qty),0) amount from v_fas_fn_dfd a
			inner join @ddate_fas b on a.ifund = b.ifund and a.ddate_w = b.ddate where q_qty <> 0 and a.ifund in (select fundid from FundData where fundlevel = '2' and fundid not in (select orifund from v_fas_cm_monfund_relation) and fundkind = '1') group by ifdid
			union all
			select productid, IsNull(Sum(a.amount2), 0) , isnull(sum(a.amount),0) from vFundDecision a 
			Where a.Product = 'FoF' And a.bs = 'B' And a.IsDelete = '0' and a.RiskST in ('0','1')
			And convert(varchar,a.DecDT,112) = @ddate
			and a.fundid in (select fundid from FundData where  fundkind = '1')
			group by productid 
		)a
		group by productid

		DECLARE @tb_TotalAmount TABLE
		(
			stock Varchar(50),
			value Decimal(20,2),
			amount Decimal(20,2)
		)
		Insert Into @tb_TotalAmount
		select productid,sum(mamt) as mamt, sum(amount) as amount from 
		(
			select ifdid productid,isnull(sum(mamttwd),0) mamt, isnull(sum(q_qty),0) amount from v_fas_fn_dfd a
			inner join @ddate_fas b on a.ifund = b.ifund and a.ddate_w = b.ddate where  q_qty <> 0 and a.ifund in (select fundid from FundData where fundlevel = '2' and fundid not in (select orifund from v_fas_cm_monfund_relation) ) group by ifdid
			union all
			select productid, IsNull(Sum(a.amount2), 0) , isnull(sum(a.newamount),0) As Amount from vFundDecision a 
			Where a.Product = 'FoF' And a.bs = 'B' And a.IsDelete = '0' and a.RiskST in ('0','1')
			And convert(varchar,a.DecDT,112) = @ddate
			group by productid 
		)a
		group by productid

		-----------------------------------------------------

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
		select distinct ddate_w, icurid from isdbtgl.dbo.fn_cur_priceTWD where ddate_w < @ddate and ddate_w >= convert(varchar,dateadd(day,-30 ,convert(datetime,@ddate,112)),112)
		) a 
		) b 
		where b.rn = 1
		)c 
		left join isdbtgl.dbo.fn_cur_priceTWD d on c.ddate_w = d.ddate_w and c.icurid = d.icurid 

		DECLARE @tb_TotalEquity TABLE
		(
			stockid varchar(20),
			ddate varchar(8),
			price Decimal(30,2),
			icurid Varchar(3)
					)
		Insert Into @tb_TotalEquity
		select itemcod as stockid,ddate_w, mvalue * 1000000 mvalue,icurid from 
		(
		select *,ROW_NUMBER () OVER(PARTITION BY itemcod ORDER BY ddate_w DESC) as rn
		from isdbtgl.dbo.fn_invest_index where  classcod = 'FoF' and ddate_w < @ddate 
		) a where rn = 1



		-----------------------------------------------------
		--買進
		Insert Into @TempMain (ad_date, Data_Group, Data_Type, fundid, fundsname, stockid, stockname, lastprice, cost, amount, totalprice, SILP, SILPLimit, capitalrate, capitalratelimit, totalcapitalrate, StockPool, FundUserTrans, currency,currencyrate)
			Select @ddate, ('B'+a.fundid ), '02'+ a.currency, a.fundid, Isnull(c.fundsname, '') As fundsname, a.productid, (a.productid + '  ' + Isnull(e.ChtName , '')) As stockname
				,(select top 1(pnav) from v_fas_fn_fd_pnav where ifdid = a.productid and ddate_w  < @ddate order by ddate_w desc) As lastprice
				, Convert(Decimal(18,2), f.avgprice) As cost
				,  a.amount As amount
				, round( a.amount2 / 1000,0) As totalprice
				, Convert(Varchar, Convert(Decimal(18,2), (i.value * cur.price ) / 100000000 )) + '億' As SILP
				, '上限 ' + Convert(Varchar, h.limitvalue ) + '億' As SILPLimit
				, (case when fundasset.price = 0 then '0' else (Convert(Varchar, Convert(Decimal(6,3), ((i.amount * (select top 1(pnav) from v_fas_fn_fd_pnav where ifdid = a.productid and ddate_w  < @ddate order by ddate_w desc)) / (fundasset.price  )) * 100 ))) end) 
				  + '%' As capitalrate
				, '上限 ' + Convert(Varchar, (Select Convert(Decimal(5,2), Convert(Float, paramvalue) * 100) From [dbo].[v_Riskmgt_Rules] Where ruleid = '28')) + '%' As capitalratelimit
				, (case when fundasset.price = 0 then '0' else (convert(varchar,convert(decimal(6,3),((j.amount * (select top 1(pnav) from v_fas_fn_fd_pnav where ifdid = a.productid and ddate_w  < @ddate order by ddate_w desc) /fundasset.price ) * 100)))) end )
				  + '%' As totalcapitalrate
				, (Case When d.product Is Null Then '否' Else '是' End) StockPool
				,(case when isnull(k.ItemID,'') = '' then '否' else '是' end) As FundUserTrans
				,a.Currency 
				,cur.price
			From funddecision a
			Left Join StkTradeVolume b On a.productid = b.stock
			Left Join funddata c On a.fundid = c.fundid
			Left Join InvestmentPool d On a.fundid = d.fundid And d.product = 'FoF' And a.productid = d.productid And d.setdate < Getdate() And d.Enddate Is Null
			Left Join FofFundData  e On a.productid = e.bticker 
			Left Join 
			(
				select a.ifund 'fundid',ifdid 'productid',(sum(mcost )/sum(q_qty)) 'avgprice',sum(q_qty) amount  from v_fas_fn_dfd a
				inner join @ddate_fas b on a.ifund = b.ifund and a.ddate_w = b.ddate  where q_qty <> 0  group by a.ifund,ifdid
			) f On a.fundid = f.fundid And a.productid = f.productid 
			Left Join @tb_SILPLimit h On a.productid = h.stock
			Left Join @tb_SILP i On a.productid = i.stock
			Left join @tb_TotalAmount j on a.productid = j.stock
			Left Join (select ItemID from v_Riskmgt_RuleMultiValue where ruleid = '27' and CheckListId = '9') k on k.ItemID = e.TaiwanCode 
			left join @tb_currency cur on a.currency = cur.icurid 
			left join @tb_TotalEquity fundasset on fundasset.stockid = a.productid 
			Where convert(varchar,a.decdt,112) =@ddate  And a.product = 'FoF' And a.bs = 'B'
				And a.IsDelete = '0' And a.RiskST in ('0','1') and a.FundType = @fundtype --and a.tradetype = @tradetype
				 and a.BatchNo = @batchno
		


		-----------------------------------------------------
		--===========================================================	

		--===========================================================	
		--賣出
		Insert Into @TempMain (ad_date, Data_Group, Data_Type, fundid, fundsname, stockid, stockname, storeamount, lastprice, cost, amount, amountrate, totalprice, income, totalamountrate, currency, currencyrate)
			Select @ddate, ('B'+a.fundid), '03'+ a.currency, a.fundid, Isnull(c.fundsname, '') As fundsname,a.productid, (a.productid + '  ' + Isnull(e.ChtName , '')) As stockname
				, (f.amount) As storeamount
				, (select top 1(pnav) from v_fas_fn_fd_pnav where ifdid = a.productid and ddate_w < @ddate order by ddate_w desc) As lastprice
				, Convert(Decimal(18,2), f.avgprice) As cost			
				, a.amount As amount
				, Convert(Decimal(5,2), a.amount / f.amount * 100) As amountrate
				, a.amount2 / 1000 As totalprice
				,  (a.amount * (a.price - f.avgprice)/1000) As income
				, (Select Convert(Decimal(5,2), a.amount/sum(q_qty) * 100) From v_fas_fn_dfd z inner join @ddate_fas b on z.ifund = b.ifund and z.ddate_w = b.ddate Where  q_qty <> 0  And z.ifund = a.fundid ) As totalamountrate
				, a.currency
				, cur.price
			From funddecision a
			Left Join funddata c On a.fundid = c.fundid
			Left Join FofFundData e On a.productid = e.BTicker 
			Left Join 
			(
				select a.ifund 'fundid',ifdid 'productid',(sum(mcost )/sum(q_qty)) 'avgprice',sum(q_qty) amount  from v_fas_fn_dfd a inner join @ddate_fas b on a.ifund = b.ifund and a.ddate_w = b.ddate where q_qty <> 0  group by a.ifund,ifdid
			) f On a.fundid = f.fundid And a.productid = f.productid 
			left join @tb_currency cur on a.currency = cur.icurid 
			Where convert(varchar,a.decdt,112) =@ddate And a.product = 'FoF' And a.bs = 'S'
				And a.IsDelete = '0' And a.RiskST in ('0','1') and a.FundType = @fundtype --and a.tradetype = @tradetype
				 and a.BatchNo = @batchno
		--===========================================================	



		--===========================================================	
		Update a 
			Set FundAUM = b.AUM/1000, FundCost = b.cost/1000, totalpriceTWD = totalprice * currencyrate , income = income * currencyrate
			From @TempMain a
			Left Join (
				Select a.fundid, Isnull(Max(b.fundsname), '') As fundsname, Sum(a.mcost) As cost 
					, Isnull((Select Top 1 mvalue From v_fas_cm_fund_data_dtl Where fkind = 'SIZE' And ifund = a.fundid Order By ddate_w Desc), 0) As AUM
				From 
				(
					select z.ifund fundid ,ifdid productid,sum(mcost) mcost from v_fas_fn_dfd z inner join @ddate_fas b on z.ifund = b.ifund and z.ddate_w = b.ddate where  q_qty <> 0 group by z.ifund,ifdid
				) a
				Left Join funddata b On a.fundid = b.fundid
				Group By a.fundid) b On b.fundid = a.fundid


		
			
			--總表申贖明細
			Insert Into @TempMain (ad_date, Data_Group, Data_Type, fundid, fundsname
								, stockid, stockname, storeamount, lastprice, cost
								, amount, amountrate, totalprice, totalpriceTWD, SILP
								, SILPLimit, capitalrate, capitalratelimit, totalcapitalrate, income
								, totalamountrate, StockPool, FundUserTrans, FundCost, FundAUM
								,currency,currencyrate)
				Select @ddate, 'A1', Data_Type, max(fundid), max(fundsname)
						, stockid, stockname, max(f.totalamount) , max(lastprice),  Convert(Decimal(18,2), avg(f.avgprice))
						, sum(amount), sum(round(( a.amount/f.totalamount ) * 100,2))	, sum(totalprice), sum(totalpriceTWD), max(SILP)
						, max(SILPLimit), max(capitalrate)	, max(capitalratelimit), max(totalcapitalrate),sum(round( ((convert(decimal(18,2),lastprice) - f.avgprice) * amount) * currencyrate ,0)) /1000
						, sum(totalamountrate), max(StockPool)	, max(FundUserTrans), max(FundCost), max(FundAUM)
						,max(currency),max(currencyrate)
					From @TempMain a	
					Left Join 
					(
						select ifdid 'productid',(sum(mcost)/sum(q_qty)) 'avgprice', sum(q_qty)  'totalamount'  from v_fas_fn_dfd z inner join @ddate_fas b on z.ifund = b.ifund and z.ddate_w = b.ddate where  q_qty <> 0 and z.ifund in (select fundid from funddata where fundtype = @fundtype and fundid in (select orifund from v_fas_cm_monfund_relation)) group by ifdid
					) f On  a.stockid = f.productid 	
					group by stockname,stockid,data_type,lastprice
		--===========================================================	
		
		Select * From @TempMain Where Data_Group <> 'A' Order By Data_Group, Data_Type,  stockname 
		
End

