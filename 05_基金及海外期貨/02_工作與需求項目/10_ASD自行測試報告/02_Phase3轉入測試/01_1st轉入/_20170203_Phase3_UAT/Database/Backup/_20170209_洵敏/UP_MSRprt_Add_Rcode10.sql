USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_MSRprt_Add_Rcode10]    Script Date: 2017/2/9 上午 11:38:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








-----------------------------------------------------------------------------------------------------
--系統分類　　: 月(年)報
--系統名稱      : UP_MSRprt_Add_Rcode10
--程式性質　　: 副程式
--程式功能　　: 產生Rcode 10 資料
--使用到檔案　: dbo.Tab_PRt_MSReport
--使用到副程式: 
--程式撰寫者   : Yvonne Chen
--撰寫日期      : 2016-0614
--修改日期      : 2016-0620
--					  Yvonne 2016-0827 Sarah 20160826 來信說 平均成本匯率這欄刪除, 改放BOOK VALUE at Sale (TWD)
---					 -Yvonne 2016-0829 for Sarah 
--1.規則修改->原先是原幣*(付款日匯率-交易日匯率) 
--                  改成 進出金額*付款日匯率-進出金額*交易日匯率
/*
 RCODE			RLINE	RLNAME				
--MSReport10		02		國外債券(含還本)	
--MSReport10		03		股票					
--MSReport10		04		基金					
*/
--Yvonne 2016-0906 電話溝通, 修改Asset_Class 與IAD_中台一致
--Yvonne 2016-1011 國外現金股利有一個月領一次的情況, 原先讀取方式會重覆!! 要改寫為抓>除權日的最小一筆領取
--Yvonne 2016-1027 for Sarah 需求1051026-40-FIN-資產月報相關增修  -2.表10新增國家別等四欄
--Yvonne 2016-1107 for Sarah 需求1051104-150-FIN-現金股利=TOTAL AMOUNT(原幣)*(Pay Date fx rate - Trade Date fx rate)
--Yvonne 2016-1123 for Sarah 需求1051104-150   Sarah 2016-1123 測試發現 Update for 3.	表10的現金股利領取的存款匯差是沒錯的，只是我當初寫需求單的時候複製到比較早期的需求，我忘記後來我們有改成原幣*匯率取兩位後再相減，現在是寫成先相減後取兩位，這可以調整嗎?
--Yvonne 2016-1208 Update for 需求 1051207-30 要以交易日讀取 基本資料的 ftype (ex:上市櫃資料)!!!
--Yvonne 2017-0123 for Sarah 需求1060112-020 修改國外現金股利淨額入帳，修改傳票規則及表10
--Yvonne 2017-0124 add 國外基金
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
			  set		   @i_Dealdt			= 20161231
			  set		   @i_Dealdt_Str		= 20160901
			  set		   @i_Basedt			= 20161231
			  set		   @i_CurRatedt		= 20161231
			  set		   @i_ifund				= '1ak'
			  set		   @i_RLine				= '01'

			exec dbo.UP_MSRprt_Add_Rcode10
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
Use	     isdbTGL
Go

			  Declare @i_Dealdt		   As	    Varchar(8)	                            ;
              Declare @i_Dealdt_str	   As     Varchar(8)	                            ;
			  Declare @i_Basedt          As     Varchar(8)                             ;
			  Declare @i_CurRatedt     As     Varchar(8)                             ;
			  Declare @i_level          As     Varchar(8)                             ;
			  Declare @i_fund_Type     As     Varchar(8)                             ;
			  Declare @i_Rcode			   As     Varchar(20)						   ;
			  Declare @i_ifund		       As     Varchar(20)                           ;
			  Declare @i_RLine            As     Varchar(20)                           ;
			  Declare @i_UserID            As     Varchar(20)                           ;
			  Declare @o_TCnt			   As     Int											;
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
Begin
 		      set		   @i_Dealdt			= 20160531
			  set		   @i_Dealdt_Str		= 20151231
			  set		   @i_Level 			= '0'												;
			  set		   @i_Fund_Type		= '0'												;
			  set		   @i_ifund				= 'Z'
			  set		   @i_RLine				= '00'
			  set		   @i_rcode		    = 'MSReport10'                         			  
			  set         @i_UserId          = 'FAS'

			exec dbo.UP_MSRprt_Add_All
			  @i_Dealdt		   ,
              @i_Dealdt_str	   ,
			  @i_Basedt          ,--可不輸= @Trandt 前之工作日
			  @i_CurRatedt     ,--可不輸= i_Trandt 前之工作日
			  @i_level			   ,
			  @i_fund_Type     ,
			  @i_Rcode           ,
			  @i_ifund		       ,--
			  @i_RLine            ,--指定那一種下傳 (可傳Null or '00', 為全部)
			  @i_USerid          ,
			  @o_TCnt			   output,
			  @o_ErrCode       output,
			  @o_SqlErrm       output
			  
			  			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  			 
End		  ;	
*/
----------------------------------------------------------------------------------------------------
ALTER PRocedure [dbo].[UP_MSRprt_Add_Rcode10]
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
			 declare @Asset_Type      as    Varchar(30)								;
			 
			 declare @Dealdt			as    Varchar(8)									;
			 declare @Dealdt_Str  	as    Varchar(8)									;

			 declare @iFund              as    Varchar(20)								;
			 declare @iFund_C          as    Varchar(100)								;			 
			 

			 declare @classcod			 as    Varchar(20)								;
			 declare @AccountType    as    Varchar(30)								;
			 declare @ClassItemX		 as    Varchar(100)								;
			 declare @Cusip				 as   Varchar(15)                               ;			 
			 declare @TRANSACTION_TYPE
												 as    Varchar(30)								;
			 declare @FundCod			 as    Varchar(20)								;
			 declare @FUNDNAME		 as    Varchar(200)								;
			 declare @FundCod_Deal	 as    Varchar(100)								;			 			 
			 declare @Purchase_Date as    Varchar(8)								;
			 declare @Trade_Date		 as    Varchar(8)								    ;
			 declare @Settle_Date		 as    Varchar(8)								    ;			 
			 declare @Pay_Date		 as    Varchar(8)								    ;--Yvonne 2016-0329 Add for Sarah			 			 
			 declare @Sale_Date		 as    Varchar(8)								    ;
			 			 
			 declare @Quantity_Units as    numeric(30,8)							;
			 declare @TOTAL_AMOUNT
												 as    numeric(30,8)							;
			 declare @BOOK_VALUE_AT_SALE
												 as    numeric(30,8)							;			 			 
--					  Yvonne 2016-0827 Sarah 20160826 來信說 平均成本匯率這欄刪除, 改放BOOK VALUE at Sale (TWD)
			 declare @BOOK_VALUE_AT_SALE_twd
												 as    numeric(30,8)							;			 			 
			 declare @REALIZED_GL	 as    numeric(30,8)							;			 
			 declare @icurid				 as    Varchar(3)									;
			 declare @TD_FX_RATE    as    numeric(12,6)							;
			 declare @PD_FX_RATE    as    numeric(12,6)							;
			 declare @BLST_AVG_FX_RATE
												  as   numeric(12,6)							;						 
			 declare @REALIZED_GL_TWD
												 as    numeric(30,8)							;			 						 
			 declare @REALIZED_GL_C
												 as    numeric(30,8)							;			 						 
			 declare @REALIZED_GL_PT
												 as    numeric(30,8)							;			 						 
			 declare @PortFolio		     as    Varchar(100)								;
			 declare @Oracle_Class	 as    Varchar(100)								;
			 declare @Asset_Class	 as    Varchar(100)								;
			 declare @FundType        as    Varchar(20)                               ;

--Yvonne 2016-1027 for Sarah 需求1051026-40-FIN-資產月報相關增修  -2.表10新增國家別等四欄			 
			 declare @ICOUNTRY		 as    Varchar(3)								    ;
			 declare @issue_cntry		 as    Varchar(3)									;
			 declare @iextrid		     as    Varchar(100) 							;
			 declare @SA_BANK		 as    Varchar(100)								;

			 
			 declare @u_Date        	 as     datetime									;
			 declare @userid         	 as     varchar(20)								;


			 
--           宣告			  
             Declare    Data_03_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport10'	   	       Rcode           ,
			      '03'                            RLine            ,                  				 
                 '國外股票'                      ReMark         ,				 
				  Z.*
			  From
									   (Select 
										  t.iFund														  ,							
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC')	,
										  m.Classcod																,                
										  t.AccountType															,
										  t.Transaction_Type													,
										  m.istkID                     Security_Name						,--股票代碼            --(fn_dstk.istkID) 
										  m.nCstk                      Security_Description				,--證券中文名稱        --(fn_stk_Data.nCstk)
										  t.Quantity_Units         ,    
--2016-0320 Yvonne 依據Alice 信件--> Purchase_Date 指定賣出資產抓取當初購買日, 其餘資產別此欄位可空白. 
										  '' 	Purchase_Date     ,
										  t.trade_Date              ,
										  t.Settle_Date             ,
										  t.Pay_Date                 ,										  
										  t.TOTAL_AMOUNT		   ,
--Yvonne 2016-0620 買賣只有賣出有金額，買進為空白 ; 其他皆為空白
										  "BOOK_VALUE_AT_SALE" =										  
										  case 
											when t.Transaction_Type ='S'
											then  t.BOOK_VALUE_AT_SALE
											else  Null										
											end															,						     										  
--Yvonne 2016-0825 買賣只有賣出有金額，買進為空白 ; 其他皆為空白
										  "BOOK_VALUE_AT_SALE_TWD" =										  
										  case 
											when t.Transaction_Type ='S'
											then  t.BOOK_VALUE_AT_SALE_TWD
											else  Null										
											end															,						     										  
--Yvonne 2016-0620 買賣只有賣出有金額，買進為空白 ; 其他皆為空白
										  "REALIZED_GL" =
										  case 
										    when t.Transaction_Type ='S' 
											then
													case
													when IsNull(BOOK_VALUE_AT_SALE,0)*IsNull(TOTAL_AMOUNT,0) =0 
													then  Null 					
													else  TOTAL_AMOUNT-BOOK_VALUE_AT_SALE
													end														     
											else Null
											end,														
										  
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
										  t.icurid
										  +'_' 
										  +
										  case 
											when M.ftype in('4','ETF')
											then  'ETF'
										    when  M.ftype  in ('9','REITS')
											then	'REIT'
											when  M.ftype  in ('15')
											then	'PREFERRED'
											else  'STOCK'
											end															,
--Yvonne 2016-0906 電話溝通, 修改Asset_Class 與IAD_中台一致										
										case 											
											when  M.ftype  in ('15')
											then	'FIXED INCOME'
											else  'EQUITY'
											end
																						    Asset_Class,
--											'EQUITY'                                    Asset_Class,
--Yvonne 2016-0627 For 國外股票新增欄位
										    T.icurid			,
										   	TD_FX_RATE ,
											PD_FX_RATE ,
											BLST_AVG_FX_RATE,--庫存平均匯率
											REALIZED_GL_TWD,
											REALIZED_GL_C,
											REALIZED_GL_PT,
											m.icountry                                               ,
										    m.issue_cntry											,
										    m.iextrid                                                 																								 
								  From    --dbo.fn_stk_data				M,			  --基本資料
											 (	

--From (1) fn_fd_sell
--Yvonne 2016-0318 賣出成本改抓庫存檔的資料											 
--Yvonne 2016-0321 怕庫存檔沒有產生, 所以改用left join											 

											 Select  t1.ifund, t1.IstkID,t1.AccountType,t1.Ftrade Transaction_Type,t1.ddate_W Trade_Date, t1.dsato_w Settle_Date, t1.dpay_w Pay_Date,t1.icurid, sum(t1.qstks) Quantity_Units,
													    t1.ddateTWDCurPrice   TD_FX_RATE,
														t1.dpayTWDCurPrice	  PD_FX_RATE,
														isnull(td.mscost,0)        BOOK_VALUE_AT_SALE,
														isnull(td.mscostTWD,0) BOOK_VALUE_AT_SALE_TWD,														
														case 
																when isnull(td.mcost,0) =0
																then  case
																		when isnull(td.mscost,0) <> 0
																	    then  ROUND(isnull(td.mscostTWD,0)/ isnull(td.mscost,0),4)
																		else  0
																		end
																else
																	    case
																		when isnull(td.mcost,0) <> 0
																		then  ROUND(isnull(td.mcostTWD,0)/ isnull(td.mcost,0),4)
																		else   0
																		end
																end	
																			              BLST_AVG_FX_RATE,
							                            isnull(td.mprftTWD,0)-isnull(td.mprftcurTWD,0)
																						    REALIZED_GL_TWD,
							                            isnull(td.mprftcurTWD,0) REALIZED_GL_C,
	
														--1.賣出交易=TOTAL AMOUNT(原幣)*(Pay Date fx rate - Trade Date fx rate)
														--2.買進交易=TOTAL AMOUNT(原幣)*(Trade Date fx rate - Pay Date fx rate)
														
														case
															when isnull(t1.ddateTWDCurPrice,0) * isnull(t1.dpayTWDCurPrice,0) <> 0
															then
--Yvonne 2016-0829 for Sarah 
--1.規則修改->原先是原幣*(付款日匯率-交易日匯率) 
--                  改成 進出金額*付款日匯率-進出金額*交易日匯率
																	case
																		when  t1.Ftrade = 'B'
																		then    round(sum(t1.msum)*t1.ddateTWDCurPrice,2)
																				 -round(sum(t1.msum)*t1.dpayTWDCurPrice,2)
																		--then    sum(t1.msum)*(t1.ddateTWDCurPrice-t1.dpayTWDCurPrice)
																		when  t1.Ftrade = 'S'
																		then    round(sum(t1.msum)*t1.dpayTWDCurPrice,2)
																				- round(sum(t1.msum)*t1.ddateTWDCurPrice,2)
																		--then    sum(t1.msum)*(t1.dpayTWDCurPrice-t1.ddateTWDCurPrice)
																		Else    0
																		End   
															Else    0
															End   			 
																							 REALIZED_GL_PT,
														   sum(t1.msum)				 TOTAL_AMOUNT
											  From      dbo.fn_stk_trade  t1
											  left join   dbo.fn_dstk td on    td.ddate_w            = t1.ddate_w
																			    and    td.ifund                 = t1.ifund
											                                    and    td.istkID               = t1.istkid
											                                    and    td.AccountType     = t1.AccountType
											                                    and    td.icurid                = t1.icurid		
											  where t1.ddate_w          <= @i_Dealdt
											  And    t1.ddate_w           >   @i_Dealdt_Str
											  And    t1.icurid                 <>'TWD'
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IstkID,t1.AccountType,t1.Ftrade,t1.ddate_W, t1.dsato_w,t1.dPay_w,T1.ICURID,t1.ddateTWDCurPrice,t1.dpayTWDCurPrice
											                ,isnull(td.mscost,0),isnull(td.mscostTWD,0),isnull(td.mcostTWD,0), isnull(td.mcost,0),isnull(td.mprftTWD,0),isnull(td.mprftcurTWD,0),isnull(td.mprftcurTWD,0)											 		  
											 Union all
--From (2)	fn_stk_cash 現金股利 & fn_stk_getch(發放)
											 Select   ifund,istkID,accountType,Transaction_Type, Trade_Date, 
														 Settle_Date,													     
														 Pay_Date,
														 icurid,
														 Quantity_Units, --as '持有股數',  
														 TD_FX_RATE,
														 PD_FX_RATE,
														 BOOK_VALUE_AT_SALE,				 						
														 BOOK_VALUE_AT_SALE_TWD,					
														 BLST_AVG_FX_RATE,			 
														 REALIZED_GL_TWD,
														 REALIZED_GL_C,
--Yvonne 2016-1107 for Sarah 需求1051104-150-FIN-現金股利=TOTAL AMOUNT(原幣)*(Pay Date fx rate - Trade Date fx rate)
													    case
															when isnull(TD_FX_RATE,0) * isnull(PD_FX_RATE,0) <> 0
															then  --Round(Total_Amount*(PD_FX_RATE- TD_FX_RATE),2)	
--Yvonne 2016-1123 Sarah 說之前需求提成舊版..要改
																	round((Total_Amount*PD_FX_RATE),2)
															 	   -round((Total_Amount*TD_FX_RATE),2)
																	
															else   ''
															end   REALIZED_GL_PT,
														 --REALIZED_GL_PT,
														 
														 Total_Amount
											 From
											 (
														 select    a.ifund,a.istkID,a.accountType,'現金股利' Transaction_Type, a.ddate_W Trade_Date, 
																	 gc.ddate_W Settle_Date,													     
																	 gc.ddate_W Pay_Date,
																	 a.icurid icurid,
																	 isnull(e.qshare , 0) Quantity_Units, --as '持有股數',  
																	 a.TWDcurprice                                              TD_FX_RATE,
																	 dbo.F_Q_Change2TWD(gc.icurid,gc.ddate_w)  PD_FX_RATE,
																	 Null BOOK_VALUE_AT_SALE,				 						
																	 Null BOOK_VALUE_AT_SALE_TWD,					
																	 Null BLST_AVG_FX_RATE,			 
																	 Null REALIZED_GL_TWD,
																	 Null REALIZED_GL_C,
																	 Null	REALIZED_GL_PT,
--1.若無Pay Date，抓取TG0108畫面的(發放總額-稅金) 2.若有Pay Date，抓取TG0110畫面的(領取金額-所得稅)																	 
																	 --(case isnull(gc.ddate_W, '') when '' then a.msum else gc.mcash end) as Total_Amount																	 
																	 (case    isnull(gc.ddate_W, '') 
																	  when   '' 
																	  then   (a.msum-a.mtax) 
																	  else   (gc.mcash-gc.mtax) 
																	  end)												as Total_Amount
															from (select aa.*,
--Yvonne 2016-1011 國外股票有每月發放股息的狀況, 改寫成大於除息日的最小一筆領取日期
																			  (select Min(x.ddate_w) from fn_stk_getch x where x.istkid =aa.istkid and x.ifund = aa.ifund  and x.fget = '1' and x.accountType = aa.accounttype and x.icurid = aa.icurid and x.ddate_w >= aa.ddate_W) as 'Min_GetCh_Ddate_W' 
																	from     -- fn_stk_cash 
																			  (Select ifund,istkID,ddate_w,perint,icurid ,AccountType,icountry,TWDcurprice,sum(msum)  msum,sum(mtax) mtax
																				From [isdbTGL].[dbo].[fn_stk_cash] 
																				Group by ifund,istkID,ddate_w,perint,icurid ,AccountType,icountry,TWDcurprice)
																				aa
																	where	aa.ddate_w          <= @i_Dealdt
																	and       aa.ddate_w           >   @i_Dealdt_Str
  																	and       aa.icurid                 <>'TWD'
																	and    ( (@i_ifund				  = '00')
																	or  	   (@i_ifund				  <>  '00'
																				And 
																				aa.ifund                 =  @i_ifund) 	
																				)
																	 )					   a 
																							inner join	cm_fund_data b on a.ifund = b.ifund 
																							------left join	fn_stk_data c on a.istkID = c.istkID and a.ddate_w between c.duse_w and c.dexpire_w 
																							left join fn_dstk e on a.ifund = e.ifund and a.istkID = e.istkID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w) and a.icountry = e.icountry and a.AccountType = e.AccountType 
																							----Yvonne 2016-1011 國外現金股利有一個月領一次的情況, 原先讀取方式會重覆!! 要改寫為抓>除權日的最小一筆領取
																							left join --fn_stk_getch 
--Yvonne 2017-0123 for Sarah 需求1060112-020 修改國外現金股利淨額入帳，修改傳票規則及表10
--1.若無Pay Date，抓取TG0108畫面的(發放總額-稅金) 2.若有Pay Date，抓取TG0110畫面的(領取金額-所得稅)
																									   (select  ifund,istkID,ddate_w,icurid,AccountType,icountry,sum(msum)  msum ,sum(mcash) mcash, sum(mtax) mtax 
																										From [isdbTGL].[dbo].[fn_stk_getch] 
																										Where fget = '1'
																										group by ifund,istkID,ddate_w,icurid,AccountType,icountry) gc 
																										on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.ddate_w >=a.ddate_w and gc.ddate_w = a.min_getch_ddate_W
																							--left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.ddate_w >=a.ddate_w and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																							------left join fn_stk_cash f on a.cur_itdNO = f.itdNO 
																							------left join fn_stk_getch g on a.itdno = g.itdno
															where 1 = 1 
															and		b.level = 2 
--Yvonne 2016-0628 下行因為porita 都沒提供, 所以我只好先mark 起來
															--and		(isnull(a.perint, 0) <> 0 or isnull(a.cur_itdno, '') <> '') 
--Yvonne 2016-1011 因目前改成寫在裡層, 所以外層就不用這些條件了..															
															--and		a.ddate_w          <= @i_Dealdt
															--and       a.ddate_w           >   @i_Dealdt_Str
  														    --and       a.icurid                 <>'TWD'
															--and    ( (@i_ifund				  = '00')
															--			or
															-- 		  (@i_ifund				  <>  '00'
															--			And 
															--			 a.ifund                 =  @i_ifund) 	
															--		   )
											 )			    C1
																									   
											  )											T
											  LEFT JOIN dbo.fn_stk_data	M 
											  ON			  M.ISTKID = T.ISTKID 
--Yvonne 2016-1208 Update for 需求 1051207-30 要以交易日讀取 基本資料的 ftype (ex:上市櫃資料)!!!
												And         m.duse_w           <=  T.Trade_Date  --@i_Dealdt  
												And         m.dexpire_w       >=  T.Trade_Date  --@i_Dealdt
								Where    @i_RLine              in('00','03') 																  								  								  
								  )														Z
		  Where(TOTAL_AMOUNT               <> 0 )                 
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
		  ;		  

--           宣告			  
             Declare    Data_01_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport10'	   	       Rcode           ,
			      '01'                            RLine            ,                  				 
                 '國外基金'                      ReMark         ,				 
				  Z.*
			  From
									   (Select 
										  t.iFund														  ,							
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC')	,
										  m.Classcod																,                
										  t.AccountType															,
										  t.Transaction_Type													,
										  m.ifdID                           Security_Name					,--代碼
										  m.ifdName                      Security_Description			,--中文名稱
										  t.Quantity_Units         ,    
--2016-0320 Yvonne 依據Alice 信件--> Purchase_Date 指定賣出資產抓取當初購買日, 其餘資產別此欄位可空白. 
										  '' 	Purchase_Date     ,
										  t.trade_Date              ,
										  t.Settle_Date             ,
										  t.Pay_Date                 ,										  
										  t.TOTAL_AMOUNT		   ,
--Yvonne 2016-0620 買賣只有賣出有金額，買進為空白 ; 其他皆為空白
										  "BOOK_VALUE_AT_SALE" =										  
										  case 
											when t.Transaction_Type ='S'
											then  t.BOOK_VALUE_AT_SALE
											else  Null										
											end															,						     										  
--Yvonne 2016-0825 買賣只有賣出有金額，買進為空白 ; 其他皆為空白
										  "BOOK_VALUE_AT_SALE_TWD" =										  
										  case 
											when t.Transaction_Type ='S'
											then  t.BOOK_VALUE_AT_SALE_TWD
											else  Null										
											end															,						     										  
--Yvonne 2016-0620 買賣只有賣出有金額，買進為空白 ; 其他皆為空白
										  "REALIZED_GL" =
										  case 
										    when t.Transaction_Type ='S' 
											then
													case
													when IsNull(BOOK_VALUE_AT_SALE,0)*IsNull(TOTAL_AMOUNT,0) =0 
													then  Null 					
													else  TOTAL_AMOUNT-BOOK_VALUE_AT_SALE
													end														     
											else Null
											end,														
										  
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
																	  M.fKind,
																	  'SId-SNAME'
																	   ),
										  --''                                 ClassItemX             ,                      --這欄好像不需要了 
										  t.ifdID+ '-' +t.accountType
																			 FundCod_Deal           ,                      --交易編號(股票沒有這欄)                       
										  "Oracle_Class" =
										  t.icurid
										  +'_' 
										  +
										 dbo.Uf_cm_symbol
																	  (
																	  @i_Dealdt,
																	  'FN37',
																	  M.fkind,
																	  'SNAME'
																	   )			  						 ,

										
										    'EQUITY'
																						    Asset_Class,
										    T.icurid			,
										   	TD_FX_RATE ,
											PD_FX_RATE ,
											BLST_AVG_FX_RATE,--庫存平均匯率
											REALIZED_GL_TWD,
											REALIZED_GL_C,
											REALIZED_GL_PT,
											m.icountry                                               ,
										    m.issue_cntry											,
										    m.iextrid                                                 																								 
								  From    --dbo.fn_stk_data				M,			  --基本資料
											 (	

--From (1.1) fn_fd_Buy
											 Select  t1.ifund, t1.ifdID,t1.AccountType,'B' Transaction_Type,t1.dtrans_w Trade_Date, t1.dpay_w Settle_Date, t1.dpay_w Pay_Date,t1.icurid, sum(t1.tb_qty) Quantity_Units,
													    t1.ddateTWDCurPrice   TD_FX_RATE,
														t1.dpayTWDCurPrice	  PD_FX_RATE,
														0							      BOOK_VALUE_AT_SALE,
														0                                BOOK_VALUE_AT_SALE_TWD,														
														case 
																when isnull(td.mcost,0) =0
																then  case
																		when isnull(td.mscost,0) <> 0
																	    then  ROUND(isnull(td.mscostTWD,0)/ isnull(td.mscost,0),4)
																		else  0
																		end
																else
																	    case
																		when isnull(td.mcost,0) <> 0
																		then  ROUND(isnull(td.mcostTWD,0)/ isnull(td.mcost,0),4)
																		else   0
																		end
																end	
																			              BLST_AVG_FX_RATE,
							                            isnull(td.mprftTWD,0)-isnull(td.mprftcurTWD,0)
																						    REALIZED_GL_TWD,
							                            isnull(td.mprftcurTWD,0) REALIZED_GL_C,
	
														--1.賣出交易=TOTAL AMOUNT(原幣)*(Pay Date fx rate - Trade Date fx rate)
														--2.買進交易=TOTAL AMOUNT(原幣)*(Trade Date fx rate - Pay Date fx rate)
														
														case
															when isnull(t1.ddateTWDCurPrice,0) * isnull(t1.dpayTWDCurPrice,0) <> 0
															then
															        round(sum(t1.tb_msum)*t1.ddateTWDCurPrice,2)
																   -round(sum(t1.tb_msum)*t1.dpayTWDCurPrice,2)																	   
															Else    0
															End   			 
																						      	     REALIZED_GL_PT,
														   sum(t1.tb_msum)				 TOTAL_AMOUNT
											  From      dbo.fn_fd_buy  t1
											  left join   dbo.fn_dfd      td on    td.ddate_w       = t1.dtrans_w
																			    and    td.ifund               = t1.ifund
											                                    and    td.ifdID               = t1.ifdID
											                                    and    td.AccountType    = t1.AccountType
											                                    and    td.icurid               = t1.icurid		
											  where t1.dtrans_w          <= @i_Dealdt
											  And    t1.dtrans_w          >   @i_Dealdt_Str
											  And    t1.icurid                 <>'TWD'
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.ifdID,t1.AccountType,t1.dtrans_W, t1.dacc_w,t1.dPay_w,T1.ICURID,t1.ddateTWDCurPrice,t1.dpayTWDCurPrice
											                ,isnull(td.mscost,0),isnull(td.mscostTWD,0),isnull(td.mcostTWD,0), isnull(td.mcost,0),isnull(td.mprftTWD,0),isnull(td.mprftcurTWD,0),isnull(td.mprftcurTWD,0)											 		  
											 Union all
--From (1.2) fn_fd_sell
--Yvonne 2016-0318 賣出成本改抓庫存檔的資料											 
--Yvonne 2016-0321 怕庫存檔沒有產生, 所以改用left join											 

											 Select  t1.ifund, t1.ifdID,t1.AccountType,'S' Transaction_Type,t1.dtrans_w Trade_Date, t1.dpay_w Settle_Date, t1.dpay_w Pay_Date,t1.icurid, sum(t1.ts_qty) Quantity_Units,
													    t1.ddateTWDCurPrice   TD_FX_RATE,
														t1.dpayTWDCurPrice	  PD_FX_RATE,
														isnull(td.mscost,0)        BOOK_VALUE_AT_SALE,
														isnull(td.mscostTWD,0) BOOK_VALUE_AT_SALE_TWD,														
														case 
																when isnull(td.mcost,0) =0
																then  case
																		when isnull(td.mscost,0) <> 0
																	    then  ROUND(isnull(td.mscostTWD,0)/ isnull(td.mscost,0),4)
																		else  0
																		end
																else
																	    case
																		when isnull(td.mcost,0) <> 0
																		then  ROUND(isnull(td.mcostTWD,0)/ isnull(td.mcost,0),4)
																		else   0
																		end
																end	
																			              BLST_AVG_FX_RATE,
							                            isnull(td.mprftTWD,0)-isnull(td.mprftcurTWD,0)
																						    REALIZED_GL_TWD,
							                            isnull(td.mprftcurTWD,0) REALIZED_GL_C,
	
														--1.賣出交易=TOTAL AMOUNT(原幣)*(Pay Date fx rate - Trade Date fx rate)
														--2.買進交易=TOTAL AMOUNT(原幣)*(Trade Date fx rate - Pay Date fx rate)
														
														case
															when isnull(t1.ddateTWDCurPrice,0) * isnull(t1.dpayTWDCurPrice,0) <> 0
															then
															        round(sum(t1.ts_msum)*t1.dpayTWDCurPrice,2)
																  - round(sum(t1.ts_msum)*t1.ddateTWDCurPrice,2)																		
																	--case
																	--	when  t1.Ftrade = 'B'
																	--	then    round(sum(t1.msum)*t1.ddateTWDCurPrice,2)
																	--			 -round(sum(t1.msum)*t1.dpayTWDCurPrice,2)
																	
																	--	when  t1.Ftrade = 'S'
																	--	then    round(sum(t1.msum)*t1.dpayTWDCurPrice,2)
																	--			- round(sum(t1.msum)*t1.ddateTWDCurPrice,2)																		
																	--	Else    0
																	--	End   
															Else    0
															End   			 
																							 REALIZED_GL_PT,
														   sum(t1.ts_msum)				 TOTAL_AMOUNT
											  From      dbo.fn_fd_sell  t1
											  left join   dbo.fn_dfd      td on    td.ddate_w       = t1.dtrans_w
																			    and    td.ifund               = t1.ifund
											                                    and    td.ifdID               = t1.ifdID
											                                    and    td.AccountType    = t1.AccountType
											                                    and    td.icurid               = t1.icurid		
											  where t1.dtrans_w          <= @i_Dealdt
											  And    t1.dtrans_w          >   @i_Dealdt_Str
											  And    t1.icurid                 <>'TWD'
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.ifdID,t1.AccountType,t1.dtrans_W, t1.dacc_w,t1.dPay_w,T1.ICURID,t1.ddateTWDCurPrice,t1.dpayTWDCurPrice
											                ,isnull(td.mscost,0),isnull(td.mscostTWD,0),isnull(td.mcostTWD,0), isnull(td.mcost,0),isnull(td.mprftTWD,0),isnull(td.mprftcurTWD,0),isnull(td.mprftcurTWD,0)											 		  
											 Union all
--From (2)	fn_fd_getch(基金配息)
											 Select   ifund,ifdID,accountType,Transaction_Type, Trade_Date, 
														 Settle_Date,													     
														 Pay_Date,
														 icurid,
														 Quantity_Units, 
														 TD_FX_RATE,
														 PD_FX_RATE,
														 BOOK_VALUE_AT_SALE,				 						
														 BOOK_VALUE_AT_SALE_TWD,					
														 BLST_AVG_FX_RATE,			 
														 REALIZED_GL_TWD,
														 REALIZED_GL_C,
													    case
															when isnull(TD_FX_RATE,0) * isnull(PD_FX_RATE,0) <> 0
															then  round((Total_Amount*PD_FX_RATE),2)
															 	   -round((Total_Amount*TD_FX_RATE),2)
																	
															else   ''
															end   REALIZED_GL_PT,														 														 
														 Total_Amount
											 From
											 (
														 select    a.ifund,a.ifdID,a.accountType,'基金配息' Transaction_Type, a.ddate_W Trade_Date, 
																	 a.ddate_W Settle_Date,													     
																	 a.ddate_W Pay_Date,
																	 a.icurid icurid,
																	 isnull(e.q_Qty , 0) Quantity_Units,					--as '持有單位',  
																	 --a.TWDcurprice															   --基金沒有這一欄~~~~  
																	 dbo.F_Q_Change2TWD(a.icurid,a.ddate_w)     TD_FX_RATE,
																	 dbo.F_Q_Change2TWD(a.icurid,a.ddate_w)     PD_FX_RATE,--只有領取日....
																	 Null BOOK_VALUE_AT_SALE,				 						
																	 Null BOOK_VALUE_AT_SALE_TWD,					
																	 Null BLST_AVG_FX_RATE,			 
																	 Null REALIZED_GL_TWD,
																	 Null REALIZED_GL_C,
																	 Null	REALIZED_GL_PT,
																	 (a.msum-a.mtax) 
																	 																	as Total_Amount
															from (select aa.*
																	from     
																			  (Select ifund,ifdID,ddate_w,div_rate,icurid ,AccountType--,TWDcurprice
																						,sum(msum)  msum,sum(mtax) mtax
																				From [isdbTGL].[dbo].[fn_fd_getch] 
																				Group by ifund,ifdID,ddate_w,div_rate,icurid ,AccountType--,TWDcurprice
																			  )
																				aa
																	where	aa.ddate_w          <= @i_Dealdt
																	and       aa.ddate_w           >   @i_Dealdt_Str
  																	and       aa.icurid                 <>'TWD'
																	and    ( (@i_ifund				  = '00')
																	or  	   (@i_ifund				  <>  '00'
																				And 
																				aa.ifund                 =  @i_ifund) 	
																				)
																	 )					   a 
																							inner join	cm_fund_data b on a.ifund = b.ifund 																							
																							left join fn_dfd e on a.ifund = e.ifund and a.ifdID = e.ifdID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w)  and a.AccountType = e.AccountType 
																							
															where 1 = 1 
															and		b.level = 2 

											 )			    C1
																									   
											  )											T
											  LEFT JOIN dbo.fn_fd_data	M 
											  ON			  M.ifdID = T.ifdID
--Yvonne 2016-1208 Update for 需求 1051207-30 要以交易日讀取 基本資料的 ftype (ex:上市櫃資料)!!!
												And         m.duse_w           <=  T.Trade_Date  --@i_Dealdt  
												And         m.dexpire_w       >=  T.Trade_Date  --@i_Dealdt
								Where    @i_RLine              in('00','01') 
								  )														Z
		  Where(TOTAL_AMOUNT               <> 0 )                 
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
			 
			 If				@i_RLine  In  ('00','01')	
						   goto        Data_Rline_01
			 else		   goto		 Data_RLine_02			 
			 Data_Rline_01:			  
--	Step1.1 刪除
			 set			@Rcode																    = 'MSReport10'
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
							@Purchase_Date         ,   
							@Trade_Date              ,
							@Settle_Date              ,
							@Pay_Date				 ,
							@TOTAL_AMOUNT		 ,
							@BOOK_VALUE_AT_SALE,							
							@BOOK_VALUE_AT_SALE_TWD,
							@REALIZED_GL			 ,							
							@Portfolio                   ,
							@ClassItemX              ,
							@FundCod_Deal          ,
							@Oracle_Class			 ,
							@Asset_Class             ,
							@icurid                      ,
							@TD_FX_RATE,
							@PD_FX_RATE,
							@BLST_AVG_FX_RATE,--庫存平均匯率
							@REALIZED_GL_TWD,
							@REALIZED_GL_C,
							@REALIZED_GL_PT,
							@iCountry                 ,
							@issue_cntry             ,
							@iextrid					    
																				
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @FundType =	Case
																	when         @Oracle_Class like '%Stock%'
																	then          'M'
																	when		     @Oracle_Class like '%ETF%' 
																	then			'L'
																	else		    ''
																	End

							--庫存平均匯率
							set			@BLST_AVG_FX_RATE =    
																 Case 
																	when   @TRANSACTION_TYPE in ('B','S')
																	then     @Blst_Avg_Fx_Rate
																	else     Null
																	end
							
						    set			@REALIZED_GL_TWD =
																 Case 
																	when   @TRANSACTION_TYPE in ('S')
																	then     @REALIZED_GL_TWD
																	else     Null
																	end  
							set			@REALIZED_GL_C =
																Case 
																	when   @TRANSACTION_TYPE in ('S')
																	then     @REALIZED_GL_C
																	else     Null
																	end		
							set			@BOOK_VALUE_AT_SALE_twd=
																	Case 
																	when   @TRANSACTION_TYPE in ('S')
																	then    @BOOK_VALUE_AT_SALE_twd
																	else     Null
																	end

							insert into dbo.TAB_PRT_MsReport 
						   (Rcode,
			                RLine,
							RLineSno,										
							ReMark,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund,							
							Classcod,
							AccountType,
														
							ASSET_TYPE,
							FundCod_Deal,
							Cusip,
							FundCod,
							FUNDNAME,							
							Transaction_Type,							
							Quantity_Units,
                            Purchase_Date,
							Trade_Date,
                            --Sale_Date,
							Settle_Date,
							Pay_Date,                            
                            TOTAL_AMOUNT,
							BOOK_VALUE_AT_SALE,
							BOOK_VALUE_AT_SALE_TWD,
                            REALIZED_GL,
							icurid,
							TD_FX_RATE,
							PD_FX_RATE,
                            BLST_AVG_FX_RATE,
							REALIZED_GL_TWD,
							REALIZED_GL_C,
							REALIZED_GL_PT,
							
							Portfolio	,
							Oracle_Class,
							iFund_C,
							ClassItemX,														
							Asset_Class,
							FundType,
							ICOUNTRY,
							issue_cntry,
							iextrid,
							SA_BANK		  
							)
							Values
							(
							@Rcode,
			                @RLine,
							@RLineSno,										
							@ReMark,
							@Userid,
							@U_Date,
							@Dealdt,
							@Dealdt_Str,				
						    @iFund,
							
							@Classcod,
							@AccountType,
														
							@ASSET_TYPE,
							@FundCod_Deal,
							@Cusip,
							@FundCod,
							@FUNDNAME,							
							@Transaction_Type,							
							@Quantity_Units,
                            @Purchase_Date,
							@Trade_Date,
                            --Sale_Date,
							@Settle_Date,
							@Pay_Date,                            
                            @TOTAL_AMOUNT,
							@BOOK_VALUE_AT_SALE,
							@BOOK_VALUE_AT_SALE_TWD,
                            @REALIZED_GL,
							@icurid,
							@TD_FX_RATE,
							@PD_FX_RATE,
                            @BLST_AVG_FX_RATE,
							@REALIZED_GL_TWD,
							@REALIZED_GL_C,
							@REALIZED_GL_PT,
							@Portfolio	,
							@Oracle_Class,
							@iFund_C,
							@ClassItemX,														
							@Asset_Class,
							@FundType,
							@ICOUNTRY,
							@issue_cntry,
							@iextrid,
							@SA_BANK			  
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
			 set			@Rcode																    = 'MSReport10'
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
							@Purchase_Date         ,   
							@Trade_Date              ,
							@Settle_Date              ,
							@Pay_Date				 ,
							@TOTAL_AMOUNT		 ,
							@BOOK_VALUE_AT_SALE,							
							@BOOK_VALUE_AT_SALE_TWD,
							@REALIZED_GL			 ,							
							@Portfolio                   ,
							@ClassItemX              ,
							@FundCod_Deal          ,
							@Oracle_Class			 ,
							@Asset_Class             ,
							@icurid                      ,
							@TD_FX_RATE,
							@PD_FX_RATE,
							@BLST_AVG_FX_RATE,--庫存平均匯率
							@REALIZED_GL_TWD,
							@REALIZED_GL_C,
							@REALIZED_GL_PT,
							@iCountry                 ,
							@issue_cntry             ,
							@iextrid					    
																				
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @FundType =	Case
																	when         @Oracle_Class like '%Stock%'
																	then          'M'
																	when		     @Oracle_Class like '%ETF%' 
																	then			'L'
																	else		    ''
																	End

							--庫存平均匯率
							set			@BLST_AVG_FX_RATE =    
																 Case 
																	when   @TRANSACTION_TYPE in ('B','S')
																	then     @Blst_Avg_Fx_Rate
																	else     Null
																	end
							
						    set			@REALIZED_GL_TWD =
																 Case 
																	when   @TRANSACTION_TYPE in ('S')
																	then     @REALIZED_GL_TWD
																	else     Null
																	end  
							set			@REALIZED_GL_C =
																Case 
																	when   @TRANSACTION_TYPE in ('S')
																	then     @REALIZED_GL_C
																	else     Null
																	end		
							set			@BOOK_VALUE_AT_SALE_twd=
																	Case 
																	when   @TRANSACTION_TYPE in ('S')
																	then    @BOOK_VALUE_AT_SALE_twd
																	else     Null
																	end

							insert into dbo.TAB_PRT_MsReport 
						   (Rcode,
			                RLine,
							RLineSno,										
							ReMark,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund,							
							Classcod,
							AccountType,
														
							ASSET_TYPE,
							FundCod_Deal,
							Cusip,
							FundCod,
							FUNDNAME,							
							Transaction_Type,							
							Quantity_Units,
                            Purchase_Date,
							Trade_Date,
                            --Sale_Date,
							Settle_Date,
							Pay_Date,                            
                            TOTAL_AMOUNT,
							BOOK_VALUE_AT_SALE,
							BOOK_VALUE_AT_SALE_TWD,
                            REALIZED_GL,
							icurid,
							TD_FX_RATE,
							PD_FX_RATE,
                            BLST_AVG_FX_RATE,
							REALIZED_GL_TWD,
							REALIZED_GL_C,
							REALIZED_GL_PT,
							
							Portfolio	,
							Oracle_Class,
							iFund_C,
							ClassItemX,														
							Asset_Class,
							FundType,
							ICOUNTRY,
							issue_cntry,
							iextrid,
							SA_BANK		  
							)
							Values
							(
							@Rcode,
			                @RLine,
							@RLineSno,										
							@ReMark,
							@Userid,
							@U_Date,
							@Dealdt,
							@Dealdt_Str,				
						    @iFund,
							
							@Classcod,
							@AccountType,
														
							@ASSET_TYPE,
							@FundCod_Deal,
							@Cusip,
							@FundCod,
							@FUNDNAME,							
							@Transaction_Type,							
							@Quantity_Units,
                            @Purchase_Date,
							@Trade_Date,
                            --Sale_Date,
							@Settle_Date,
							@Pay_Date,                            
                            @TOTAL_AMOUNT,
							@BOOK_VALUE_AT_SALE,
							@BOOK_VALUE_AT_SALE_TWD,
                            @REALIZED_GL,
							@icurid,
							@TD_FX_RATE,
							@PD_FX_RATE,
                            @BLST_AVG_FX_RATE,
							@REALIZED_GL_TWD,
							@REALIZED_GL_C,
							@REALIZED_GL_PT,
							@Portfolio	,
							@Oracle_Class,
							@iFund_C,
							@ClassItemX,														
							@Asset_Class,
							@FundType,
							@ICOUNTRY,
							@issue_cntry,
							@iextrid,
							@SA_BANK			  
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


