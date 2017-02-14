USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_MSRprt_Add_Rcode11]    Script Date: 2017/2/9 上午 11:38:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO























-----------------------------------------------------------------------------------------------------
--系統分類　　: 月(年)報
--系統名稱      : UP_MSRprt_Add_Rcode11
--程式性質　　: 副程式
--程式功能　　: 產生Rcode 11 資料
--使用到檔案　: dbo.Tab_PRt_MSReport
--使用到副程式: 
--程式撰寫者   : Yvonne Chen
--撰寫日期      : 2016-0701
--修改日期      : 2016-0701
--					  Yvonne 2016-0726 Add 現金股利要增加 AccountType 條件
--					  Yvonne 2016-0726 Add for 需求1051026-43 改為領取在途現金報表, 增加領取項目一欄
--					  Yvonne 2016-1027 for Sarah 需求1051026-40-FIN-資產月報相關增修
--					  Yvonne 2017-0125 Add 國內基金
/*
--MSReport11 	01 	基金               	  	                             	
--MSReport11 	03 	股票               	  股票(含ETF/REIT/無活絡/創投)

*/
----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go
			  Declare @i_Dealdt		   As	    Varchar(8)	                            ;
              Declare @i_Dealdt_str	   As     Varchar(8)	                            ;
			  Declare @i_Basedt          As     Varchar(8)                             ;
			  Declare @i_CurRatedt     As     Varchar(8)                             ;
			  Declare @i_ifund		       As     Varchar(20)                           ;
			  Declare @i_RLine            As     Varchar(20)                           ;
			  Declare @i_UserId		   As     Varchar(20)                           ;
			  Declare @o_TCnt			   As     Int											;
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
Begin
			  set		   @i_Dealdt			= 20160413
			  set		   @i_Dealdt_Str		= 20160331
			  set		   @i_Basedt			= 20160331
			  set		   @i_CurRatedt		= 20160331
			  set		   @i_ifund				= 'ZATG'
			  set		   @i_RLine				= '00'

			exec dbo.UP_MSRprt_Add_Rcode11
			  @i_Dealdt		   ,
              @i_Dealdt_str	   ,
			  @i_Basedt          ,--可不輸= @Trandt 前之工作日
			  @i_CurRatedt     ,--可不輸= i_Trandt 前之工作日
			  @i_ifund		       ,--原StType
			  @i_RLine            ,--指定那一種下傳 (可傳Null or '00', 為全部)
			  @i_UserId		   ,
			   @o_TCnt			   output ,
			  @o_ErrCode       output ,
			  @o_SqlErrm       output 

			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  

End		  ;
*/
/*
select a.ddate_w as '領息日', a.itdNO as '成交單編號', 
         a.ifund as '帳戶別代號', b.nc as '帳戶別名稱',
         a.AccountType as '會計分類', 
         a.istkID as '股票代號', c.ncstk as '股票簡稱', 
         a.iagtID as '銀行代號', isnull(a.CashAccount, '') as 'CashAccount', 
         a.icurid as '幣別', a.icountry as '市場別', a.fget as '領取項目', 
         a.mcash as '領取金額', a.mfee as '郵電費', a.mtax as '所得稅', a.msum as '入帳淨額', 
         isnull(a.msumdiff, 0) as '差異金額', isnull(d.mcash, 0) as '庫存金額', 
         a.memo as '備註' 
         from fn_stk_getch a 
         inner join cm_fund_data b on a.ifund = b.ifund
         inner join fn_stk_data c on a.istkID = c.istkID and a.ddate_w between c.duse_w and c.dexpire_w 
         left join fn_dstk d on a.ifund = d.ifund and a.istkID = d.istkID and a.AccountType = d.AccountType and a.icountry = d.icountry and d.ddate_w = '20160614'--dbo.F_Q_DateAfterType_w(b.new_fkind4, '0', '0', -1, a.ddate_w) 
         where 1 = 1 
         and b.level = 2 
		 AND A.DDATE_W ='20160615'
*/
/*
SELECT Rcode,
			                RLine,
							RLineSno,	
							Asset_Type,		
							ReMark,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund                  ,
							iFund_C					  ,
							Classcod               ,
							AccountType            ,							
							FundCod                  ,
							FUNDNAME				  ,
							FundCod_Deal           ,
							icurid						   ,														
							Quantity_Units          ,    
                            Purchase_Date         ,   
							Trade_Date              ,
                            Sale_Date                ,
							Pay_Date                 ,
							TransAction_Type     ,
                            BOOK_VALUE_AT_SALE,
                            TOTAL_AMOUNT		  ,
                            REALIZED_GL		  ,
                            zothchgBuy			 ,

							ClassItemX             ,							
							Portfolio					  ,
							Oracle_Class			  
FROM	dbo.TAB_PRT_MSREPORT
where   rcode='MSReport11'

*/
/*
--  應產生筆數
SELECT DISTINCT A.ISTKID, A.ddate_w ,a.accounttype --a.dsato_w --.*
FROM	DBO.FN_STK_TRADE A
WHERE	A.ifund = '1AK'
AND     A.DDATE_W BETWEEN 20160101 AND 20160131
AND     A.ftrade = 'S'
*/
ALTER PRocedure [dbo].[UP_MSRprt_Add_Rcode11]
			( @i_Dealdt		   As	    Varchar(8)	                            ,
              @i_Dealdt_str	   As     Varchar(8)	                            ,
			  @i_Basedt          As     Varchar(8)                                ,--可不輸= @Trandt 前之工作日
			  @i_CurRatedt     As     Varchar(8)                                ,--可不輸= i_Trandt 前之工作日
			  @i_ifund		       As     Varchar(20)                              ,--原StType
			  @i_RLine            As     Varchar(20)                              ,--指定那一種下傳 (可傳Null or '00', 為全部)
			  @i_UserId          As     Varchar(20)                              ,--使用者
			  @o_TCnt            As      int					OUTPUT									,			  
			  @o_ErrCode       As      int					OUTPUT									,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As
--           宣告
				declare @RCode			as    Varchar(20)                                ;
				declare @RLine				as	    Varchar(20)                               ;
				declare @RLineSno		as     numeric(30,0)                            ;
				declare @Remark			as	    Varchar(300)                             ;
			 
				declare @Dealdt			as    Varchar(8)									;
				declare @Dealdt_Str  	as    Varchar(8)									;

				declare @iFund              as    Varchar(20)								;
				declare @iFund_C          as    Varchar(100)								;			 
			 

				declare @classcod			 as    Varchar(20)								;
				declare @AccountType    as    Varchar(30)								;
				declare @ClassItemX		 as    Varchar(100)								;
				declare @FundCod			 as    Varchar(20)								;
				declare @FUNDNAME		 as    Varchar(200)								;
				declare @FundCod_Deal	 as    Varchar(100)								;
				declare @icurid				 as    Varchar(3)									;
			 
				declare @Trade_Date		 as    Varchar(8)								    ;
				declare @Settle_Date		 as    Varchar(8)								    ;
			 
				declare @Pay_Date		 as    Varchar(8)								    ;--Yvonne 2016-0329 Add for Sarah
				declare @Asset_Type      as    Varchar(30)								;
				declare @TRANSACTION_TYPE
													as    Varchar(30)								;			 
				declare @TOTAL_AMOUNT
													as    numeric(30,8)							;						 			 
				declare @Quantity_Units as    numeric(30,8)							;
				declare @mcash				as	   decimal(20,4)						    ;
				declare @mfee				as	   decimal(20,6)						    ;
				declare @mtax				as	   decimal(20,4)						    ;
				declare @msum				as	   decimal(20,4)						    ;
				declare @msumdiff			as	   decimal(20,4)						    ;
				declare @iagtId				as	   Varchar(5)								;
				declare @iagtId_C			as	   Varchar(100) 						    ;
				declare @CashAccount   as	   Varchar(20)							;
				declare @CashAccount_C
												    as	   Varchar(100)  						;

			 
			 
				declare @PortFolio		     as    Varchar(100)								;
				declare @Oracle_Class	 as    Varchar(100)								;
				declare @Asset_Class	 as    Varchar(100)								;

				declare @Td_price_DT    as    Varchar(8)								    ;
				declare @Td_price          as    numeric(12,6)							;
				declare @Couponrate		 as     numeric(12,6)                          ;
				declare @u_Date        	 as     datetime									;
				declare @userid         	 as     varchar(20)								;


			 
--           宣告			  
             Declare    Data_03_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport11'		   Rcode        ,
			      '03'                            RLine         ,
                  --ROW_NUMBER() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --DENSE_RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID				 
                 '國內股票'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  t.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
										  m.Classcod                                          ,                      --(fn_dstk.Calsscod)
										  t.AccountType                                        ,--會計分類(ClassITem) --(fn_dstk.AccountType)                  
--Yvonne 2016-0328 Add for Sarah	Transaction_Type
										  t.Transaction_Type  ,
										  m.istkID                     Security_Name          ,--股票代碼            --(fn_dstk.istkID) 
										  m.nCstk                      Security_Description   ,--證券中文名稱        --(fn_stk_Data.nCstk)
										  t.Quantity_Units         ,    


										  t.trade_Date												 ,
										  t.Settle_Date												 ,
										  t.Pay_Date													 ,										  
										  t.TOTAL_AMOUNT											 ,
										  t.mcash														 ,
										  t.msumdiff													 ,
										  t.mtax															 ,
										  t.mfee															 ,
										  t.msum														 ,
										  t.iagtid															 ,										  
										  t.CashAccount												 ,
										  
										  "Portfolio" =
										  case 
											when t.icurid ='TWD'
											then  'T'										    
											else  t.icurid
											end
										  +'_'
										  +
										  case 
											when  t.iFund like 'Z%'
											then  'TGL'										    
											else  'KHL'
											end
										   +'-'
										   +t.AccountType												 ,

																												   --基本上是 幣別_KHL/TGL-AccountType
																												   --幣別:    NTD->T , Else  icurID 
																												   --資產別:  KH-> KHL ; TG-> TGL
																												   --ex:      T_KHL-TRANDING    (FVTPL)

  
--Yvonne 2016-0328 For Sarah 	 ClassITemX show fn_Stk_data 's FType information
										  "ClassItemX"=
										  dbo.Uf_cm_symbol
																	  (
																	  @i_Dealdt,
																	  'FN01',
																	  M.ftype,
																	  'SId-SNAME'
																	   ),
										  --''                                 ClassItemX             ,                      --這欄好像不需要了 
										  t.istkID+ '-' +t.accountType
																			 FundCod_Deal           ,                      --交易編號(股票沒有這欄)                       
										  "Oracle_Class" =
										  'T_' +
										  case 
											when M.ftype in('4','ETF')
											then  'ETF'
										    when  M.ftype  in ('9','REITS')
											then	'REIT'
											when  M.ftype  in ('15')
											then	'PREFERRED'
											else  'STOCK'
											end															,
											'EQUITY'                                    Asset_Class
																								 

								  From    dbo.fn_stk_data				M,			  --基本資料
											 (	 
--From (1)	fn_stk_cash 現金股利 & fn_stk_getch(發放)											 
											select a.ifund,a.istkID,a.accountType,'現金股利' Transaction_Type, a.ddate_W Trade_Date, 
--Yvonne 2016-0606 Sarah 股利's Settle Date 同 Pay Date
														 gc.ddate_W			 Settle_Date,													     
														 gc.ddate_W			 Pay_Date,c.icurid icurid,
														 isnull(e.qshare , 0) Quantity_Units, --as '持有股數',  
														 a.msum				 Total_Amount,
														 gc.mcash              mcash,
														 gc.msumdiff          msumdiff,
														 gc.mtax				 mtax,
														 gc.mfee                mfee,
														 gc.msum               msum,
														 gc.iagtID				 iagtid,
														 gc.CashAccount     CashAccount
														 
												from --fn_stk_cash 
												(select aa.*,
--Yvonne 2016-1011 國外股票有每月發放股息的狀況, 改寫成大於除息日的最小一筆領取日期
																			  (select Min(x.ddate_w) from fn_stk_getch x where x.istkid =aa.istkid and x.ifund = aa.ifund  and x.fget = '1' and x.accountType = aa.accounttype and x.icurid = aa.icurid and x.ddate_w >= aa.ddate_W) as 'Min_GetCh_Ddate_W' 
																	from     -- fn_stk_cash 
																			  (select ifund,istkID,ddate_w,perint,icurid ,AccountType, icountry,TWDcurprice,sum(msum)  msum
																				From [isdbTGL].[dbo].[fn_stk_cash] 
																				Group by ifund,istkID,ddate_w,perint,icurid ,AccountType,icountry,TWDcurprice)
																				aa
																	where	aa.ddate_w          <= @i_Dealdt
																	and       aa.ddate_w           >   @i_Dealdt_Str
  																	and       aa.icurid                = 'TWD'
																	and    ( (@i_ifund				= '00')
																	or  	   (@i_ifund				  <>  '00'
																				And 
																				aa.ifund                 =  @i_ifund) 	
																				)
																	 )
																				a												
																				inner join	cm_fund_data b on a.ifund = b.ifund 
																				inner join	fn_stk_data c on a.istkID = c.istkID and a.ddate_w between c.duse_w and c.dexpire_w 
																				left join     fn_dstk e on a.ifund = e.ifund and a.istkID = e.istkID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w) and a.icountry = e.icountry and a.AccountType = e.AccountType 
--Yvonne 2016-1027 for Sarah 需求 Income報表修改為"領取在途現金報表, 相關內容增修
																				left join (select  ifund,istkID,ddate_w,icurid,AccountType,icountry,iagtid, CashAccount,sum(msum)  msum ,sum(mcash) mcash,sum(msumdiff) msumdiff,sum(mtax) mtax, sum(mfee) mfee
																										From [isdbTGL].[dbo].[fn_stk_getch] 
																										Where fget = '1'
																										group by ifund,istkID,ddate_w,icurid,AccountType,icountry,iagtid, CashAccount)  gc 
																										on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.ddate_w >=a.ddate_w and gc.ddate_w = a.min_getch_ddate_W
--Yvonne 2016-0726 Add 現金股利要增加 AccountType 條件
																				--left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.AccountType =a.AccountType and gc.ddate_w >=a.ddate_w and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																				--left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.ddate_w >=a.ddate_w and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																				----left join fn_stk_cash f on a.cur_itdNO = f.itdNO 
																				----left join fn_stk_getch g on a.itdno = g.itdno
												where   b.level = 2 
												and		(isnull(a.perint, 0) <> 0 --or isnull(a.cur_itdno, '') <> '') 
												and		a.ddate_w          <= @i_Dealdt
											    and        a.ddate_w           >   @i_Dealdt_Str
----Yvonne 2016-0602 Add 僅抓國內交易(TWD) 
--  											  And    a.icurid                 ='TWD'
--											     And    ( (@i_ifund				  = '00')
--															or
--														  (@i_ifund				  <>  '00'
--														    And 
--															 a.ifund                 =  @i_ifund) 	
														   )											  											 												
								 Union all

--Yvonne 2016-1027 for Sarah 需求1051026-40-FIN-資產月報相關增修改為領取在途現金報表, 增加領取項目一欄
--From (2)	fn_stk_reduce  & fn_stk_getch(發放)											 
											select a.ifund,a.istkID,a.accountType,'減資' Transaction_Type, a.ddate_W Trade_Date, 
														 gc.ddate_W			 Settle_Date,													     
														 gc.ddate_W			 Pay_Date,c.icurid icurid,
														 isnull(a.qstks , 0)   Quantity_Units, --as '減資股數',  
														 a.msum				 Total_Amount,
														 gc.mcash              mcash,
														 gc.msumdiff          msumdiff,
														 gc.mtax				 mtax,
														 gc.mfee                mfee,
														 gc.msum               msum,
														 gc.iagtID				 iagtid,
														 gc.CashAccount     CashAccount
														 
												from --fn_stk_cash 
												(select aa.*,
--Yvonne 2016-1011 國外股票有每月發放股息的狀況, 改寫成大於除息日的最小一筆領取日期
																			  (select Min(x.ddate_w) from fn_stk_getch x where x.istkid =aa.istkid and x.ifund = aa.ifund  and x.fget = '2' and x.accountType = aa.accounttype and isNull(x.icurid,'TWD') = aa.icurid and x.ddate_w >= aa.ddate_W) as 'Min_GetCh_Ddate_W' 
																	from     -- fn_stk_cash 
																			  (select ifund,istkID,ddate_w,perint,isNull(icurid,'TWD') icurid ,AccountType,icountry,--TWDcurprice,
																																										sum(mcash)  msum,sum(qstks) qstks
																				From [isdbTGL].[dbo].[fn_stk_reduce] 
																				Group by ifund,istkID,ddate_w,perint,icurid ,AccountType,icountry--,TWDcurprice
																			)
																				aa
																	where	aa.ddate_w          <= @i_Dealdt
																	and       aa.ddate_w           >   @i_Dealdt_Str
  																	and       isnull(aa.icurid,'TWD')                = 'TWD'
																	and    ( (@i_ifund				= '00')
																	or  	   (@i_ifund				  <>  '00'
																				And 
																				aa.ifund                 =  @i_ifund) 	
																				)
																	 )
																				a												
																				inner join	cm_fund_data b on a.ifund = b.ifund 
																				inner join	fn_stk_data c on a.istkID = c.istkID and a.ddate_w between c.duse_w and c.dexpire_w 
																				left join     fn_dstk e on a.ifund = e.ifund and a.istkID = e.istkID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w) and a.icountry = e.icountry and a.AccountType = e.AccountType 
--Yvonne 2016-1027 for Sarah 需求 Income報表修改為"領取在途現金報表, 相關內容增修
																				left join (select  ifund,istkID,ddate_w,icurid,AccountType,icountry,iagtid, CashAccount,sum(msum)  msum ,sum(mcash) mcash,sum(msumdiff) msumdiff,sum(mtax) mtax, sum(mfee) mfee
																										From [isdbTGL].[dbo].[fn_stk_getch] 
																										Where fget = '2'
																										group by ifund,istkID,ddate_w,icurid,AccountType,icountry,iagtid, CashAccount)  gc 
																										on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.ddate_w >=a.ddate_w and gc.ddate_w = a.min_getch_ddate_W
--Yvonne 2016-0726 Add 現金股利要增加 AccountType 條件
																				--left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.AccountType =a.AccountType and gc.ddate_w >=a.ddate_w and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																				--left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.ddate_w >=a.ddate_w and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																				----left join fn_stk_cash f on a.cur_itdNO = f.itdNO 
																				----left join fn_stk_getch g on a.itdno = g.itdno
												where   b.level = 2 
												and	  ( a.ddate_w          <= @i_Dealdt
											    and       a.ddate_w           >   @i_Dealdt_Str
----Yvonne 2016-0602 Add 僅抓國內交易(TWD) 
--  											  And    a.icurid                 ='TWD'
--											     And    ( (@i_ifund				  = '00')
--															or
--														  (@i_ifund				  <>  '00'
--														    And 
--															 a.ifund                 =  @i_ifund) 	
														   )											  											 												
											  )											T
								Where    @i_RLine              in('00','03')								  
								  And      m.istkID              =   T.istkID								  
								  And      m.duse_w           <=  @i_Dealdt 
								  And      m.dexpire_w       >=  @i_Dealdt
								  
								  )														Z
		  Where(Quantity_Units               <> 0 )                 
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
		  ;		  

--           宣告			  
             Declare    Data_01_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport11'		   Rcode        ,
			      '01'                            RLine         ,
                  --ROW_NUMBER() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --DENSE_RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID				 
                 '國內基金'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  t.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
										  m.Classcod                                          ,                      --(fn_dstk.Calsscod)
										  t.AccountType                                        ,--會計分類(ClassITem) --(fn_dstk.AccountType)                  
--Yvonne 2016-0328 Add for Sarah	Transaction_Type
										  t.Transaction_Type  ,
										  m.ifdID                           Security_Name          ,--代碼            --(fn_dstk.istkID) 
										  m.ifdname                      Security_Description   ,--中文名稱        --(fn_stk_Data.nCstk)
										  t.Quantity_Units         ,    


										  t.trade_Date												 ,
										  t.Settle_Date												 ,
										  t.Pay_Date													 ,										  
										  t.TOTAL_AMOUNT											 ,
										  t.mcash														 ,
										  t.msumdiff													 ,
										  t.mtax															 ,
										  t.mfee															 ,
										  t.msum														 ,
										  t.iagtid															 ,										  
										  t.CashAccount												 ,
										  
										  "Portfolio" =
										  case 
											when t.icurid ='TWD'
											then  'T'										    
											else  t.icurid
											end
										  +'_'
										  +
										  case 
											when  t.iFund like 'Z%'
											then  'TGL'										    
											else  'KHL'
											end
										   +'-'
										   +t.AccountType												 ,

																												   --基本上是 幣別_KHL/TGL-AccountType
																												   --幣別:    NTD->T , Else  icurID 
																												   --資產別:  KH-> KHL ; TG-> TGL
																												   --ex:      T_KHL-TRANDING    (FVTPL)

  
--Yvonne 2016-0328 For Sarah 	 ClassITemX show fn_Stk_data 's FType information
										  "ClassItemX"=
										  dbo.Uf_cm_symbol
																	  (
																	  @i_Dealdt,
																	  'FN37',
																	  M.fkind,
																	  'SId-SNAME'
																	   ),
										  --''                                 ClassItemX             ,                      --這欄好像不需要了 
										  t.ifdID+ '-' +t.accountType
																			 FundCod_Deal           ,                      --交易編號(股票沒有這欄)                       
										  "Oracle_Class" =
										  'T_' 
+
										 dbo.Uf_cm_symbol
																	  (
																	  @i_Dealdt,
																	  'FN37',
																	  M.fkind,
																	  'SNAME'
																	   )			
																				   						      ,

											'EQUITY'                                    Asset_Class
																								 

								  From    dbo.fn_fd_data				M,			  --基本資料											
											((	 
--From (1)	fn_fd_getch (發放)											 
											select a.ifund,a.ifdID,a.accountType,'基金配息' Transaction_Type, a.ddate_W Trade_Date, 
														 a.ddate_W			 Settle_Date,													     
														 a.ddate_W			 Pay_Date,c.icurid icurid,
														 isnull(e.q_qty , 0)  Quantity_Units, --as '持有股數',  
														 a.msum				 Total_Amount,
														 a.mcash               mcash,
														 0                         msumdiff,
														 a.mtax				    mtax,
														 a.mfee                 mfee,
														 a.msum                msum,
														 a.iagtID				 iagtid,
														 a.CashAccount      CashAccount														 
												from 
												(select aa.*
--Yvonne 2016-1011 國外股票有每月發放股息的狀況, 改寫成大於除息日的最小一筆領取日期																			  
																	from     
																			  (select ifund,ifdID,ddate_w,icurid,AccountType,iagtid, CashAccount,sum(msum)  msum ,sum(mcash) mcash,sum(mtax) mtax, sum(mfee) mfee
																				From [isdbTGL].[dbo].[fn_fd_getch] 
																				Group by ifund,ifdID,ddate_w,icurid ,AccountType,CashAccount,iagtid)
																				aa
																	where	aa.ddate_w          <= @i_Dealdt
																	and       aa.ddate_w           >   @i_Dealdt_Str
  																	and       aa.icurid                = 'TWD'
																	and    ( (@i_ifund				= '00')
																	or  	   (@i_ifund				  <>  '00'
																				And 
																				aa.ifund                 =  @i_ifund) 	
																				)
												  )
																				a												
																				inner join	cm_fund_data b on a.ifund = b.ifund 
																				inner join	fn_fd_data c on a.ifdID = c.ifdID and a.ddate_w between c.duse_w and c.dexpire_w 
																				left join     fn_dfd e on a.ifund = e.ifund and a.ifdID = e.ifdID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w)  and a.AccountType = e.AccountType 
												where   b.level = 2 
												--and		(isnull(a.perint, 0) <> 0 --or isnull(a.cur_itdno, '') <> '') 
												and		a.ddate_w          <= @i_Dealdt
											    and        a.ddate_w           >   @i_Dealdt_Str
														   )											  											 												
											  )											T
								Where    @i_RLine              in('00','01')								  
								  And      m.ifdID              =   T.ifdID								  
								  And      m.duse_w           <=  @i_Dealdt 
								  And      m.dexpire_w       >=  @i_Dealdt
								  
								  )														Z
		  Where(Quantity_Units               <> 0 )                 
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
		  ;		  			  
BEGIN	Try
--	Step0.0		 初始化
			 set			@o_Sqlerrm															= ' '
			 set			@o_ErrCode															= 0
			 set			@o_TCnt																= 0
			 set		    @u_Date																= SYSDATETIME()			  
			 set		    @Userid																	=  isnull(@i_UserId,User)				 			 
			 set			@Dealdt																	= @i_Dealdt
			 set			@Dealdt_Str															= isnull(@i_Dealdt_Str,floor((@Dealdt/100)*100+01))
			 set			@icurid																	= 'TWD'

                    /*If      Syn_QQS常用一般日期２_Khl2.F_Is_WorkDay(v_Dealdt_Str) = 1
                    Then    v_WorkDt_Str                            := v_Dealdt_Str                ;
                    Else    v_WorkDt_Str                            := Syn_StcDate_Work_Khl1.uf_add_workday(v_Dealdt_Str,-1)
                                                                                                   ;--(含)起始日的第一個工作天
                    End     If                                                                     ;
                    If      Syn_QQS常用一般日期２_Khl2.F_Is_WorkDay(v_Dealdt) = 1
                    Then    v_WorkDt_End                            := v_Dealdt                    ;
                    Else    v_WorkDt_End                            := Syn_StcDate_Work_Khl1.uf_add_workday(v_Dealdt,-1)
                                                                                                   ;--(含)起始日的第一個工作天
                    End     If                                                                     ;
                    */
			 
			 If				@i_RLine  In  ('00','01')	
						   goto        Data_Rline_01
			 else		   goto		 Data_RLine_02			 
			 Data_Rline_01:			  
--	Step1.1 刪除
			 set			@Rcode																    = 'MSReport11'
			 set			@Rline																	= '01'			 
			 set			@RLineSno															    = 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
			 
--	Step1.2 讀取& Insert 資料
			 Open Data_01_Cur
			 while (@@error = 0)			                
				begin
					--print @RLineSno
					fetch next from Data_01_Cur into 
							@Rcode,
			                @RLine,
							--@RLineSno,
							@Asset_Type         	,
						    @iFund						,
							@iFund_C				    ,
							@Classcod                 ,
							@AccountType            ,							
							@Transaction_Type		 ,
							@FundCod                  ,
							@FUNDNAME				 ,							
							@Quantity_Units         ,    
							
							@Trade_Date              ,
							@Settle_Date              ,
							@Pay_Date				 ,							
							@TOTAL_AMOUNT		 ,							
							@mcash						 ,
							@msumdiff					 ,
							@mtax						 ,
							@mfee						 ,
							@msum						 ,
							@iagtid						 ,
							@CashAccount			 ,
							@Portfolio                   ,
							@ClassItemX              ,
							@FundCod_Deal          ,
							@Oracle_Class			 ,
							@Asset_Class
																				
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @CashAccount_C = ''
							Set           @iagtId_C         = ''
						    Select       @CashAccount_C  = c.ActNo +' '+ c.ActName     from    isdbtgl.dbo.cm_act_data c  where iagt = @iagtid  and  actno =@cashaccount  and @i_Dealdt between  dstart_w and dend_w 
							Select       @iagtId_C             = c.nsagt     from    isdbtgl.dbo.vfnbroker c  where iagt = @iagtid    and @i_Dealdt between  dstart_w and dend_w 
							--Set			@CashAccount_C  =   CashAccount_C

							insert into dbo.TAB_PRT_MsReport 
						   (Rcode,
			                RLine,
							RLineSno,			
							ASSET_TYPE,
							ReMark,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund,
							iFund_C,
							Classcod,
							AccountType,
							Transaction_Type,
							FundCod,
							FUNDNAME,
							FundCod_Deal,
							icurid,
							Quantity_Units,
                            --Purchase_Date,
							Trade_Date,                            
							Settle_Date,
							Pay_Date,
                            --BOOK_VALUE_AT_SALE,
                            TOTAL_AMOUNT,
                            --REALIZED_GL,                            
							STTYPEXCHIN,
							ClassItemX,
							Portfolio	,
							Oracle_Class,
							Asset_Class,
							mcash,
							mfee,
							mtax,
							msum,
							msumdiff,
							iagtId,
							iagtId_C,
							CashAccount,
							CashAccount_C
										  
							)
							Values
							(
							@Rcode,
			                @RLine,
							@RLineSno,							
							@Asset_Type,
							@Asset_Type,
							@Userid,
							@U_Date,

							@Dealdt,
							@Dealdt_Str,
						    @iFund,
							@iFund_C,
							@Classcod,
							@AccountType,
							@TRANSACTION_TYPE,
							@FundCod,
							@FUNDNAME,
							@FundCod_Deal,
							@icurid,

							@Quantity_Units,
                            --@Purchase_Date,
							@Trade_Date,
							@Settle_Date,
							@Pay_Date,
                            --@BOOK_VALUE_AT_SALE,
                            @TOTAL_AMOUNT,
                            --@REALIZED_GL,                            
							@iFund_C,
							@ClassItemX,
							@Portfolio,
							@Oracle_Class,
							@Asset_Class	,

							@mcash,
							@mfee,
							@mtax,
							@msum,
							@msumdiff,
							@iagtId,
							@iagtId_C,
							@CashAccount,
							@CashAccount_C
							);
    
				       end									
			 CLOSE Data_01_Cur
			 DEALLOCATE Data_01_Cur			 


			 If				@i_RLine  In  ('00','02')	
						   goto        Data_Rline_02
			 else		   goto		 Data_RLine_03			 			 
			 Data_Rline_02:			  

			 If				@i_RLine  In  ('00','03')	
						   goto        Data_Rline_03
			 else		   goto		 Data_RLine_04	
			 Data_Rline_03:			  
--	Step3.1 刪除
			 set			@Rcode																    = 'MSReport11'
			 set			@Rline																	= '03'			 
			 set			@RLineSno															    = 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
			 
--	Step3.2 讀取& Insert 資料
			 Open Data_03_Cur
			 while (@@error = 0)			                
				begin
					--print @RLineSno
					fetch next from Data_03_Cur into 
							@Rcode,
			                @RLine,
							--@RLineSno,
							@Asset_Type         	,
						    @iFund						,
							@iFund_C				    ,
							@Classcod                 ,
							@AccountType            ,							
							@Transaction_Type		 ,
							@FundCod                  ,
							@FUNDNAME				 ,							
							@Quantity_Units         ,    
							
							@Trade_Date              ,
							@Settle_Date              ,
							@Pay_Date				 ,							
							@TOTAL_AMOUNT		 ,							
							@mcash						 ,
							@msumdiff					 ,
							@mtax						 ,
							@mfee						 ,
							@msum						 ,
							@iagtid						 ,
							@CashAccount			 ,
							@Portfolio                   ,
							@ClassItemX              ,
							@FundCod_Deal          ,
							@Oracle_Class			 ,
							@Asset_Class
																				
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @CashAccount_C = ''
							Set           @iagtId_C         = ''
						    Select       @CashAccount_C  = c.ActNo +' '+ c.ActName     from    isdbtgl.dbo.cm_act_data c  where iagt = @iagtid  and  actno =@cashaccount  and @i_Dealdt between  dstart_w and dend_w 
							Select       @iagtId_C             = c.nsagt     from    isdbtgl.dbo.vfnbroker c  where iagt = @iagtid    and @i_Dealdt between  dstart_w and dend_w 
							--Set			@CashAccount_C  =   CashAccount_C

							insert into dbo.TAB_PRT_MsReport 
						   (Rcode,
			                RLine,
							RLineSno,			
							ASSET_TYPE,
							ReMark,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund,
							iFund_C,
							Classcod,
							AccountType,
							Transaction_Type,
							FundCod,
							FUNDNAME,
							FundCod_Deal,
							icurid,
							Quantity_Units,
                            --Purchase_Date,
							Trade_Date,                            
							Settle_Date,
							Pay_Date,
                            --BOOK_VALUE_AT_SALE,
                            TOTAL_AMOUNT,
                            --REALIZED_GL,                            
							STTYPEXCHIN,
							ClassItemX,
							Portfolio	,
							Oracle_Class,
							Asset_Class,
							mcash,
							mfee,
							mtax,
							msum,
							msumdiff,
							iagtId,
							iagtId_C,
							CashAccount,
							CashAccount_C
										  
							)
							Values
							(
							@Rcode,
			                @RLine,
							@RLineSno,							
							@Asset_Type,
							@Asset_Type,
							@Userid,
							@U_Date,

							@Dealdt,
							@Dealdt_Str,
						    @iFund,
							@iFund_C,
							@Classcod,
							@AccountType,
							@TRANSACTION_TYPE,
							@FundCod,
							@FUNDNAME,
							@FundCod_Deal,
							@icurid,

							@Quantity_Units,
                            --@Purchase_Date,
							@Trade_Date,
							@Settle_Date,
							@Pay_Date,
                            --@BOOK_VALUE_AT_SALE,
                            @TOTAL_AMOUNT,
                            --@REALIZED_GL,                            
							@iFund_C,
							@ClassItemX,
							@Portfolio,
							@Oracle_Class,
							@Asset_Class	,

							@mcash,
							@mfee,
							@mtax,
							@msum,
							@msumdiff,
							@iagtId,
							@iagtId_C,
							@CashAccount,
							@CashAccount_C
							);
    
				       end									
			 CLOSE Data_03_Cur
			 DEALLOCATE Data_03_Cur			 
			 
			 If				@i_RLine  In  ('00','04')	
						   goto        Data_Rline_04
			 else		   goto		 Procedure_End
			 Data_Rline_04:			  



			 Procedure_End:		
			 set @o_TCnt					= dbo.Uf_MsReport_IfExist (@i_Dealdt,
																					@i_Dealdt_str,						
																					@Rcode,
																					@i_ifund		,--原StType
																					@i_RLine       )	  

END		Try
BEGIN CATCH
			SELECT
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage;

			  Set @o_ErrCode       = ERROR_NUMBER()
			  Set @o_SqlErrm	     = ERROR_MESSAGE()


END CATCH;





















































GO


