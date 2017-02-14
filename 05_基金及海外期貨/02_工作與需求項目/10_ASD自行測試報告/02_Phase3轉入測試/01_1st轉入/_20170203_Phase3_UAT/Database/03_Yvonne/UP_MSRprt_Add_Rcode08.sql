USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_MSRprt_Add_Rcode08]    Script Date: 2017/2/9 上午 11:37:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






















-----------------------------------------------------------------------------------------------------
--系統分類　　: 月(年)報
--系統名稱      : UP_MSRprt_Add_Rcode08
--程式性質　　: 副程式
--程式功能　　: 產生Rcode 08 資料
--使用到檔案　: dbo.Tab_PRt_MSReport
--使用到副程式: 
--程式撰寫者   : Yvonne Chen--
--撰寫日期      : 2016-0602
--修改日期      : 2016-0620
--					  Yvonne 2016-0706 Sarah 20160630 來信說 國家、註冊地、交易所 都要
--					  Yvonne 2016-0729 Sarah 20160728 來信說 台幣欄位也要取到小數兩位
--					  Yvonne 2016-0826 Sarah 20160826 來信說 平均成本匯率這欄刪除, 改放BOOK VALUE(TWD)(累積數)
--																					BV unrealized G/L (TWD) =BOOK VALUE(TWD)(原幣*月底匯率) - BOOK VALUE(TWD)(累積數)
--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
--					  Yvonne 2017-0105 Add 國外基金
/*
MSReport08	01	基金	
MSReport08	02	定存	
MSReport08	03	國外債券	
MSReport08	04	股票	
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
			  Declare @o_TCnt			   As     Int											;
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
Begin
			  set		   @i_Dealdt			= 20140829
			  set		   @i_Dealdt_Str		= 20140831
			  set		   @i_Basedt			= 20140829
			  set		   @i_CurRatedt		= 20140829
			  set		   @i_ifund				= '1AKH'
			  set		   @i_RLine				= '00'

			exec dbo.UP_MSRprt_Add_Rcode08
			  @i_Dealdt		   ,
              @i_Dealdt_str	   ,
			  @i_Basedt          ,--可不輸= @Trandt 前之工作日
			  @i_CurRatedt     ,--可不輸= i_Trandt 前之工作日
			  @i_ifund		       ,--原StType
			  @i_RLine            ,--指定那一種下傳 (可傳Null or '00', 為全部)
			   @o_TCnt			   OUTPUT,
			  @o_ErrCode       OUTPUT,
			  @o_SqlErrm       OUTPUT

			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  

End		  ;	
*/
----------------------------------------------------------------------------------------------------
ALTER PRocedure [dbo].[UP_MSRprt_Add_Rcode08]
			( @i_Dealdt		   As	    Varchar(8)	                            ,
              @i_Dealdt_str	   As     Varchar(8)	                            ,
			  @i_Basedt          As     Varchar(8)                             ,--可不輸= @Trandt 前之工作日
			  @i_CurRatedt     As     Varchar(8)                             ,--可不輸= i_Trandt 前之工作日
			  @i_ifund		       As     Varchar(20)                           ,--原StType
			  @i_RLine            As     Varchar(20)                           ,--指定那一種下傳 (可傳Null or '00', 為全部)
			  @i_UserId          As     Varchar(20)                           ,--使用者
			  @o_TCnt            As      int					OUTPUT				,
			  @o_ErrCode       As      int					OUTPUT				,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As
--           宣告
			 declare @RCode						 as    Varchar(20)                                ;
             declare @RLine							 as	 Varchar(20)                               ;
             declare @RLineSno					 as     numeric(30,0)                            ;
             declare @Asset_Type   			 as	 Varchar(300)                             ;
			 
			 declare @Dealdt						 as    Varchar(8)									;
			 declare @Dealdt_Str  				 as    Varchar(8)									;

			 declare @Cusip							 as   Varchar(15)                                ;
			 declare @iFund							 as    Varchar(20)								;
			 declare @iFund_C						 as    Varchar(100)								;			 
			 declare @classcod						 as    Varchar(20)								;
			 declare @AccountType				 as    Varchar(30)								;
			 declare @FundCod						 as    Varchar(20)								;
			 declare @FUNDNAME					 as    Varchar(200)								;
			 declare @FundCod_Deal				 as    Varchar(100)								;
			 declare @icurid							 as    Varchar(3)								    ;
			 declare @BLST_AVG_FX_RATE    as    numeric(12,6)							;
			 declare @VALUATION_FX_RATE   as    numeric(12,6)							;			 
			 declare @Maturity_Date				 as    Varchar(8)								    ;
			 declare @issue_date					 as    Varchar(8)								    ;

			 declare @PAR_VALUE					 as    numeric(30,8)							;
			 declare @PAR_VALUE_TWD		 as    numeric(30,8)							;
			 
			 declare @BOOK_VALUE				 as    numeric(30,8)							;
			 declare @BOOK_VALUE_TWD		 as    numeric(30,8)							;
----					  Yvonne 2016-0826 Sarah 20160826 來信說 平均成本匯率這欄刪除, 改放BOOK VALUE(TWD)(累積數)
			 declare @BOOK_VALUE_TWD_X	 as    numeric(30,8)							;
			 
			 declare @MARKET_VALUE			 as    numeric(30,8)							;
			 declare @MARKET_VALUE_TWD	 as    numeric(30,8)							;
			 declare @BM_VALUE_TWD			 as    numeric(30,8)							;
			 
			 declare @UNREALIZED_GL			 as    numeric(30,8)							;

			 declare @UNREALIZED_GL_TWD	 as    numeric(30,8)							;
			 declare @BV_UNREALIZED_GL_TWD	 
															 as    numeric(30,8)							;
			 declare @MV_UNREALIZED_GL_TWD	 
															 as    numeric(30,8)							;
			 declare @ClassItemX					 as    Varchar(100)								;
			 
			 declare @Oracle_Class				 as    Varchar(100)								;
			 declare @portfolio					     as    Varchar(100)								;
			 declare @Td_price_DT				 as    Varchar(8)								    ;
			 declare @Td_price						 as    numeric(12,6)							;

			 declare @TD_180AVGPRICE	  	 as    numeric(12,6)							;
			 declare @TD_180AVGMARKET_VALUE          
															 as    numeric(30,8)							;
			 declare @TD_180AVGMARKET_VALUE_TWD          
															 as    numeric(30,8)							;
			 
			 declare @ICOUNTRY					 as    Varchar(3)								    ;
--					  Yvonne 2016-0706 Sarah 20160630 來信說 國家、註冊地、交易所 都要
			 declare @issue_cntry					 as    Varchar(3)									;
			 declare @iextrid					     as    Varchar(100) 							;
			 declare @SA_BANK					 as    Varchar(100)								;

--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
			 declare @isin					 as    Varchar(100)								;
			 declare @dprcAmt			 as    numeric(30,8)							;
			 declare @DprcAmtCur	 as    numeric(30,8)							;		

			 
			 declare @u_Date        	 as     datetime									;
			 declare @userid         	 as     varchar(20)								;			 
			 
--           宣告			  
             Declare    Data_04_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport08'			   Rcode        ,
			      '04'                            RLine         ,                  
                 '國外股票'                     Asset_Type        ,				 
				  Z.*,
--					  Yvonne 2016-0729 Sarah 20160728 來信說 台幣欄位也要取到小數兩位
				  Round(PAR_VALUE* VALUATION_FX_RATE,2)			PAR_VALUE_TWD,		 --=PAR VALUE(原幣)* V FX
				  Round(BOOK_VALUE* VALUATION_FX_RATE,2)	    BOOK_VALUE_TWD,   --= BV(原幣) * V FX
				  
				 
				  Round((MARKET_VALUE*VALUATION_FX_RATE)	,2)MARKET_VALUE_TWD,--= MV(原幣)*V FX
										  									              --BM_VALUE_TWD		,--= 會計分類為FVPL和AFS者，帳載數為Market Value (TWD) ，否則帳載數為BOOK VALUE(TWD)

--Yvonne 2016-0826 Sarah 20160826 來信說 平均成本匯率這欄刪除, 改放BOOK VALUE(TWD)(累積數)
--															   BV unrealized G/L (TWD) =BOOK VALUE(TWD)(原幣*月底匯率) - BOOK VALUE(TWD)(累積數)
				  Round(BOOK_VALUE*    VALUATION_FX_RATE,2)-Book_Value_TWD_X
--				  Round(BOOK_VALUE*    (VALUATION_FX_RATE-BLST_AVG_FX_RATE),2)
				     					  									    BV_UNREALIZED_GL_TWD,--= BV(原幣)*(V FX - 庫 FX)
				  Round(MV_UNREALIZED_GL*VALUATION_FX_RATE,2)
						 				                                        MV_UNREALIZED_GL_TWD --=MV unrealizedG/L (原幣) * V FX				  

				  --Round(PAR_VALUE* VALUATION_FX_RATE,0)			PAR_VALUE_TWD,		 --=PAR VALUE(原幣)* V FX
				  --Round(BOOK_VALUE* VALUATION_FX_RATE,0)	    BOOK_VALUE_TWD,   --= BV(原幣) * V FX
				  --Round((MARKET_VALUE*VALUATION_FX_RATE)	,0)MARKET_VALUE_TWD,--= MV(原幣)*V FX
						--				  									              --BM_VALUE_TWD		,--= 會計分類為FVPL和AFS者，帳載數為Market Value (TWD) ，否則帳載數為BOOK VALUE(TWD)
				  --Round(BOOK_VALUE*    (VALUATION_FX_RATE
						--			       -BLST_AVG_FX_RATE),0)
				  --   					  									    BV_UNREALIZED_GL_TWD,--= BV(原幣)*(V FX - 庫 FX)
				  --Round(MV_UNREALIZED_GL*VALUATION_FX_RATE,0)
						-- 				                                        MV_UNREALIZED_GL_TWD --=MV unrealizedG/L (原幣) * V FX				  
			  From
									   (Select 
										  d.iFund                                                 ,
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),																			
										  m.Classcod                                             ,
										  d.AccountType                                         ,
										  
										  m.icountry                                               ,
										  m.issue_cntry											,
										  m.iextrid                                                 ,
										  m.cusip					    Cusip,
										  d.istkID                       Security_Name       ,
										  m.nCstk                      Security_Description,
--					  Yvonne 2016-0408 For Sarah     20160401 eMail 調整表7 股票類的Issue Date抓取規則為，抓TG0101 基本資料欄位的上市上櫃日欄位，如無上市上櫃日欄位，改抓發行日欄位
										  isNull(m.d_agree_w,
										           m.dissue_w)        issue_date             ,
										  m.dExpire_w                 Maturity_Date       ,
										  d.qshare                      PAR_VALUE           ,
										  d.mcost                       BOOK_VALUE        ,
										  d.mcostTWD                Book_Value_TWD_X,
										  d.mamt                       MARKET_VALUE    ,
										  "MV_UNREALIZED_GL" =
--					  Yvonne 2016-1028 Sarah 來電說不要下行判斷, 怎麼樣都要算
										  isnull(d.mamt,0)- isnull(mcost ,0)
										 -- case 
											--when IsNull(d.mcost,0)*IsNull(d.mamt,0) =0 
											--then  0 					
											--else  d.mamt-mcost 
											--end
																										,				  																										
										 "Portfolio" =
										  case 
											when d.icurid ='TWD'
											then  'T'										    
											else  d.icurid
											end
										  +'_'
										  +
										  case 
											when  d.iFund like 'Z%'
											then  'TGL'										    
											else  'KHL'
											end
										   +'-'
										   +d.AccountType	
																										  ,        --Portfolio
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
										  d.istkID+ '-' +d.accountType
																			 FundCod_Deal           ,                      --交易編號(股票沒有這欄)                       
										  "Oracle_Class" =
										  d.icurid
										  +'_' 
										  +
										  case 
											when M.ftype in('4','ETF')
											then  'ETF'
										    when  M.ftype  in ('9','REITS')
											then	'REIT'
											else  'STOCK'
											end															,
										  d.dprice_w                   Td_price_DT				,
										  d.price                         Td_price					,
--					  Yvonne 2016-0519  韋婷改抓改成抓fas的股價table『fn_Stk_price』。&改放在isdbTGL
									      --cMoney.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 是指6個月
										  isdbTgl.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 是指6個月
																			 TD_180AVGPRICE     ,
--					  Yvonne 2016-0620 
										  d.icurId                         iCurid						,										  
										  										  
									      ROUND(d.mcostTWD/d.mcost,4)				
																			 BLST_AVG_FX_RATE  , --庫存平均FX Rate,取至小數4位

										  dbo.F_Q_Change2TWD(d.icurid,d.ddate_w)
										  									 VALUATION_FX_RATE --1.月底結帳匯率
																											 --2.取至小數4位
																											 --3.以下在台幣換算時的規則簡稱V FX
																											 ,
--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
										    m.isin														,
											isdbTgl.dbo.Uf_Invest_IndexValue(d.ddate_w,'dPrcAmt-'+d.ifund,d.istkid) dprcAmt,
											isdbTgl.dbo.Uf_Invest_IndexValue(d.ddate_w,'dPrcAmtCur-'+d.ifund,d.istkid) dprcAmtCur						
						

								  From    dbo.fn_dstk					    D           --庫存
											 left join dbo.fn_stk_data		M   on m.istkID =  D.istkID And  m.duse_w  <=  @i_Dealdt   And  m.dexpire_w >=  @i_Dealdt
								Where    D.ddate_w             =  @i_Dealdt
--Yvonne 2016-0602 Add 僅抓國外交易(<>TWD)
								  And    d.icurid                 <> 'TWD'
								  And    ( (@i_ifund				  = '00')
												or
											  (@i_ifund				  <>  '00'
											  And 
											    D.ifund                 =  @i_ifund) 	
											)
								  And      @i_RLine              in('00','04')		  
								  
								  )														Z
		  Where(IsNull(PAR_VALUE,0)                    <> 0
                 or
                    IsNull(BOOK_VALUE,0)                   <> 0 )
                 or
                (Security_Name in ('1408s','1408t','1602','1706e','2398s','5605'))
           Order By
                 ifund,Oracle_Class,portfolio, Classcod,ClassItemX, Security_Name
		  ;		  

			  
--           宣告			  
             Declare    Data_01_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport08'			   Rcode        ,
			      '01'                            RLine         ,                  
                 '國外基金'                     Asset_Type        ,				 
				  Z.*,
--					  Yvonne 2016-0729 Sarah 20160728 來信說 台幣欄位也要取到小數兩位
				  Round(PAR_VALUE* VALUATION_FX_RATE,2)			PAR_VALUE_TWD,		 --=PAR VALUE(原幣)* V FX
				  Round(BOOK_VALUE* VALUATION_FX_RATE,2)	    BOOK_VALUE_TWD,   --= BV(原幣) * V FX
				  
				 
				  Round((MARKET_VALUE*VALUATION_FX_RATE)	,2)MARKET_VALUE_TWD,--= MV(原幣)*V FX
										  									              --BM_VALUE_TWD		,--= 會計分類為FVPL和AFS者，帳載數為Market Value (TWD) ，否則帳載數為BOOK VALUE(TWD)

--Yvonne 2016-0826 Sarah 20160826 來信說 平均成本匯率這欄刪除, 改放BOOK VALUE(TWD)(累積數)
--															   BV unrealized G/L (TWD) =BOOK VALUE(TWD)(原幣*月底匯率) - BOOK VALUE(TWD)(累積數)
				  Round(BOOK_VALUE*    VALUATION_FX_RATE,2)-Book_Value_TWD_X
--				  Round(BOOK_VALUE*    (VALUATION_FX_RATE-BLST_AVG_FX_RATE),2)
				     					  									    BV_UNREALIZED_GL_TWD,--= BV(原幣)*(V FX - 庫 FX)
				  Round(MV_UNREALIZED_GL*VALUATION_FX_RATE,2)
						 				                                        MV_UNREALIZED_GL_TWD --=MV unrealizedG/L (原幣) * V FX				  				  
			  From
									   (Select 
										  d.iFund                                                 ,
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),																			
										  m.Classcod                                             ,
										  d.AccountType                                         ,
										  
										  m.icountry                                               ,
										  m.issue_cntry											,
										  m.iextrid                                                 ,
										  Null    					       Cusip,
										  d.ifdID                       Security_Name       ,
										  m.ifdName                  Security_Description,
										  m.dissue_w        issue_date             ,
										  m.dExpire_w                 Maturity_Date       ,
										  d.q_qty                         PAR_VALUE           ,
										  d.mcost                         BOOK_VALUE        ,
										  d.mcostTWD                  Book_Value_TWD_X,
										  d.mamt                       MARKET_VALUE    ,
										  "MV_UNREALIZED_GL" =
--					  Yvonne 2016-1028 Sarah 來電說不要下行判斷, 怎麼樣都要算
										  isnull(d.mamt,0)- isnull(mcost ,0)
										 -- case 
											--when IsNull(d.mcost,0)*IsNull(d.mamt,0) =0 
											--then  0 					
											--else  d.mamt-mcost 
											--end
																										,				  																										
										 "Portfolio" =
										  case 
											when d.icurid ='TWD'
											then  'T'										    
											else  d.icurid
											end
										  +'_'
										  +
										  case 
											when  d.iFund like 'Z%'
											then  'TGL'										    
											else  'KHL'
											end
										   +'-'
										   +d.AccountType	
																										  ,        --Portfolio
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
										  d.ifdID+ '-' +d.accountType
																			 FundCod_Deal           ,                      --交易編號(股票沒有這欄)                       
										  "Oracle_Class" =
										  d.icurid
										  +'_' 
										  +										 
										 dbo.Uf_cm_symbol
																	  (
																	  @i_Dealdt,
																	  'FN37',
																	  M.fkind,
																	  'SNAME'
																	   )									,
										  d.dPnav_w                   Td_price_DT				,
										  d.Pnav                       Td_price					,
--					  Yvonne 2016-0519  韋婷改抓改成抓fas的股價table『fn_Stk_price』。&改放在isdbTGL
									      --cMoney.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 是指6個月
										  isdbTgl.dbo.GetMA(d.ifdid,d.ddate_W,6,M.fkind) -- 6 是指6個月
																			 TD_180AVGPRICE     ,
--					  Yvonne 2016-0620 
										  d.icurId                         iCurid						,										  
										  										  
									      ROUND(d.mcostTWD/d.MCost,4)				
																			 BLST_AVG_FX_RATE  , --庫存平均FX Rate,取至小數4位

										  dbo.F_Q_Change2TWD(d.icurid,d.ddate_w)
										  									 VALUATION_FX_RATE --1.月底結帳匯率
																											 --2.取至小數4位
																											 --3.以下在台幣換算時的規則簡稱V FX
																											 ,
--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
										    m.isincode														,
											isdbTgl.dbo.Uf_Invest_IndexValue(d.ddate_w,'dPrcAmt-'+d.ifund,d.ifdid) dprcAmt,
											isdbTgl.dbo.Uf_Invest_IndexValue(d.ddate_w,'dPrcAmtCur-'+d.ifund,d.ifdid) dprcAmtCur						
						

								  From    dbo.fn_dfd					    D           --庫存
											 left join dbo.fn_fd_data		M   on m.ifdID =  D.ifdID And  m.duse_w  <=  @i_Dealdt   And  m.dexpire_w >=  @i_Dealdt
								Where    D.ddate_w             =  @i_Dealdt
--Yvonne 2016-0602 Add 僅抓國外交易(<>TWD)
								  And    d.icurid                 <> 'TWD'
								  And    ( (@i_ifund				  = '00')
												or
											  (@i_ifund				  <>  '00'
											  And 
											    D.ifund                 =  @i_ifund) 	
											)
								  And      @i_RLine              in('00','01')		  
								  
								  )														Z
		  Where(IsNull(PAR_VALUE,0)                    <> 0
                 or
                    IsNull(BOOK_VALUE,0)                   <> 0 )                 
           Order By
                 ifund,Oracle_Class,portfolio, Classcod,ClassItemX, Security_Name
		  ;		  


BEGIN		Try
--	Step00		 初始化
			 set			@o_Sqlerrm															= ' '
			 set			@o_ErrCode															= 0
			 set			@o_TCnt																= 0
			 set		    @u_Date																= SYSDATETIME()			  
			 set		    @Userid																	=  isnull(@i_UserId,User)				 			 
			 set			@Dealdt																	= @i_Dealdt
			 set			@Dealdt_Str															= isnull(@i_Dealdt_Str,floor((@Dealdt/100)*100+01))
			 --set			@icurid																	='TWD'

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

			 set			@Rcode																    = 'MSReport08'
			 set			@Rline																	= '01'
			 set			@Rlinesno																= 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
--	Step1.2 讀取& Insert 資料
			 Open Data_01_Cur
			 while (@@error = 0)
			 
				begin
					fetch next from Data_01_Cur into 
							@Rcode						,
							@RLine						,
							--@RLineSno				,
						    @Asset_Type  			,				 							
							@iFund                      ,
							@iFund_C                  ,
							@Classcod                 ,
							@AccountType           ,--會計分類
							@iCountry                 ,
							@issue_cntry             ,
							@iextrid					    ,
							@Cusip                     ,
							@FundCod			       ,--股票代碼
							@FundName			   ,--中文名稱
							@issue_date              ,--發行日
							@Maturity_Date         ,--到期日														
							@PAR_VALUE             ,--面額	(fn_dstk.qshare)             面額(單位數、股數)							
							@BOOK_VALUE          ,--攤銷後成本(fn_dstk.mcost)            報表日之攤銷後成本
							@BOOK_VALUE_TWD_X,--攤銷後成本(fn_dstk.mcostTWD)   報表日之攤銷後成本(TWD)
							@MARKET_VALUE      ,--市值         (fn_dstk.mamt,外幣為mntamt)
							@UNREALIZED_GL	   ,
							@Portfolio		           ,
							@ClassItemX             ,
							@FundCod_Deal         ,
							@Oracle_Class			,
							@Td_price_DT			,
							@Td_price					,
							@Td_180AVGPRICE   ,
							@icurid                     ,
							@BLST_AVG_FX_RATE,
							@VALUATION_FX_RATE,
							@isin							,
							@dprcAmt					,
							@dprcAmtCur			    ,
							@PAR_VALUE_TWD	    ,
							@BOOK_VALUE_TWD,
							@MARKET_VALUE_TWD,
							--@BM_VALUE_TWD,
							@BV_UNREALIZED_GL_TWD,
							@MV_UNREALIZED_GL_TWD
							
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @TD_180AVGMARKET_VALUE =Null
							Set			@TD_180AVGMARKET_VALUE_TWD=Null
							If				 isnull(@Td_180AVGPRICE,0) <> 0 
							Begin
								Set	 @TD_180AVGMARKET_VALUE = isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0)
								Set	 @TD_180AVGMARKET_VALUE_TWD = Round(isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0),2)							

							End	
							--帳載數BM_VALUE_TWD => 會計分類為FVPL和AFS者，帳載數為Market Value (TWD) ，否則帳載數為BOOK VALUE(TWD)
							Set		 @BM_VALUE_TWD		= case 
																				when @accountType in ('FVPL','AFS','FVTPL')
																				then  @MARKET_VALUE_TWD
																				else  @BOOK_VALUE_TWD
																				end
							
													
							insert into dbo.TAB_PRT_MsReport 
						   (Rcode,
			                RLine,
							RLineSno,			
							ReMark,
							Asset_Type,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund,							
							Classcod,							
							Cusip,
							FundCod,
							FUNDNAME,
							FundCod_Deal,							
							issue_date,
							Maturity_Date,
							PAR_VALUE,
							BOOK_VALUE,
							BOOK_VALUE_TWD_X,
							MARKET_VALUE,
							UNREALIZED_GL,
							icurid,							
							BLST_AVG_FX_RATE,
							VALUATION_FX_RATE,
							PAR_VALUE_TWD,
							BOOK_VALUE_TWD,
							MARKET_VALUE_TWD,
							BM_VALUE_TWD,
							BV_UNREALIZED_GL_TWD,
							MV_UNREALIZED_GL_TWD,
																					
							Portfolio,
							Oracle_Class,
							iFund_C,							
							ClassItemX,
							
							Td_price_DT,
							Td_price,
							TD_180AVGPRICE,
						    TD_180AVGMARKET_VALUE,
							TD_180AVGMARKET_VALUE_TWD,

							ACCOUNTTYPE,
							ICOUNTRY,
							issue_cntry,
							iextrid,
							SA_BANK,
							--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
							isin,
							dprcAmt,
							dprcAmtCur


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
							@Classcod,							
							@Cusip,
							@FundCod,
							@FUNDNAME,
							@FundCod_Deal,							
							@issue_date,
							@Maturity_Date,
							@PAR_VALUE,
							@BOOK_VALUE,
							@BOOK_VALUE_TWD_X,
							@MARKET_VALUE,
							@UNREALIZED_GL,
							@icurid,							
							@BLST_AVG_FX_RATE,
							@VALUATION_FX_RATE,
							@PAR_VALUE_TWD,
							@BOOK_VALUE_TWD,
							@MARKET_VALUE_TWD,
							@BM_VALUE_TWD,
							@BV_UNREALIZED_GL_TWD,
							@MV_UNREALIZED_GL_TWD,
																					
							@Portfolio,
							@Oracle_Class,
							@iFund_C,							
							@ClassItemX,
							
							@Td_price_DT,
							@Td_price,
							@TD_180AVGPRICE,
						    @TD_180AVGMARKET_VALUE,
							@TD_180AVGMARKET_VALUE_TWD,

							@ACCOUNTTYPE,
							@ICOUNTRY,
							@issue_cntry,
							@iextrid,
							@SA_BANK,
							--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
							@isin,
							@dprcAmt,
							@dprcAmtCur
								 							
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
			 
			 
			 If				@i_RLine  In  ('00','04')	
						   goto        Data_Rline_04
			 else		   goto		 Data_RLine_05
			 Data_Rline_04:			  

--	Step4.1 刪除

			 set			@Rcode																    = 'MSReport08'
			 set			@Rline																	= '04'
			 set			@Rlinesno																= 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
--	Step4.2 讀取& Insert 資料
			 Open Data_04_Cur
			 while (@@error = 0)
			 
				begin
					fetch next from Data_04_Cur into 
							@Rcode						,
							@RLine						,
							--@RLineSno				,
						    @Asset_Type  			,				 							
							@iFund                      ,
							@iFund_C                  ,
							@Classcod                 ,
							@AccountType           ,--會計分類
							@iCountry                 ,
							@issue_cntry             ,
							@iextrid					    ,
							@Cusip                     ,
							@FundCod			       ,--股票代碼
							@FundName			   ,--中文名稱
							@issue_date              ,--發行日
							@Maturity_Date         ,--到期日														
							@PAR_VALUE             ,--面額	(fn_dstk.qshare)             面額(單位數、股數)							
							@BOOK_VALUE          ,--攤銷後成本(fn_dstk.mcost)            報表日之攤銷後成本
							@BOOK_VALUE_TWD_X,--攤銷後成本(fn_dstk.mcostTWD)   報表日之攤銷後成本(TWD)
							@MARKET_VALUE      ,--市值         (fn_dstk.mamt,外幣為mntamt)
							@UNREALIZED_GL	   ,
							@Portfolio		           ,
							@ClassItemX             ,
							@FundCod_Deal         ,
							@Oracle_Class			,
							@Td_price_DT			,
							@Td_price					,
							@Td_180AVGPRICE   ,
							@icurid                     ,
							@BLST_AVG_FX_RATE,
							@VALUATION_FX_RATE,
--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
							@isin							,
							@dprcAmt					,
							@dprcAmtCur			    ,
							@PAR_VALUE_TWD	    ,
							@BOOK_VALUE_TWD,
							@MARKET_VALUE_TWD,
							--@BM_VALUE_TWD,
							@BV_UNREALIZED_GL_TWD,
							@MV_UNREALIZED_GL_TWD
							
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @TD_180AVGMARKET_VALUE =Null
							Set			@TD_180AVGMARKET_VALUE_TWD=Null
							If				 isnull(@Td_180AVGPRICE,0) <> 0 
							Begin
								Set	 @TD_180AVGMARKET_VALUE = isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0)
								Set	 @TD_180AVGMARKET_VALUE_TWD = Round(isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0),2)							

							End	
							--帳載數BM_VALUE_TWD => 會計分類為FVPL和AFS者，帳載數為Market Value (TWD) ，否則帳載數為BOOK VALUE(TWD)
							Set		 @BM_VALUE_TWD		= case 
																				when @accountType in ('FVPL','AFS','FVTPL')
																				then  @MARKET_VALUE_TWD
																				else  @BOOK_VALUE_TWD
																				end
							
													
							insert into dbo.TAB_PRT_MsReport 
						   (Rcode,
			                RLine,
							RLineSno,			
							ReMark,
							Asset_Type,
							Userid,
							U_Date,
							Dealdt,
							Dealdt_Str,				
						    iFund,							
							Classcod,							
							Cusip,
							FundCod,
							FUNDNAME,
							FundCod_Deal,							
							issue_date,
							Maturity_Date,
							PAR_VALUE,
							BOOK_VALUE,
							BOOK_VALUE_TWD_X,
							MARKET_VALUE,
							UNREALIZED_GL,
							icurid,							
							BLST_AVG_FX_RATE,
							VALUATION_FX_RATE,
							PAR_VALUE_TWD,
							BOOK_VALUE_TWD,
							MARKET_VALUE_TWD,
							BM_VALUE_TWD,
							BV_UNREALIZED_GL_TWD,
							MV_UNREALIZED_GL_TWD,
																					
							Portfolio,
							Oracle_Class,
							iFund_C,							
							ClassItemX,
							
							Td_price_DT,
							Td_price,
							TD_180AVGPRICE,
						    TD_180AVGMARKET_VALUE,
							TD_180AVGMARKET_VALUE_TWD,

							ACCOUNTTYPE,
							ICOUNTRY,
							issue_cntry,
							iextrid,
							SA_BANK,
							--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
							isin,
							dprcAmt,
							dprcAmtCur


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
							@Classcod,							
							@Cusip,
							@FundCod,
							@FUNDNAME,
							@FundCod_Deal,							
							@issue_date,
							@Maturity_Date,
							@PAR_VALUE,
							@BOOK_VALUE,
							@BOOK_VALUE_TWD_X,
							@MARKET_VALUE,
							@UNREALIZED_GL,
							@icurid,							
							@BLST_AVG_FX_RATE,
							@VALUATION_FX_RATE,
							@PAR_VALUE_TWD,
							@BOOK_VALUE_TWD,
							@MARKET_VALUE_TWD,
							@BM_VALUE_TWD,
							@BV_UNREALIZED_GL_TWD,
							@MV_UNREALIZED_GL_TWD,
																					
							@Portfolio,
							@Oracle_Class,
							@iFund_C,							
							@ClassItemX,
							
							@Td_price_DT,
							@Td_price,
							@TD_180AVGPRICE,
						    @TD_180AVGMARKET_VALUE,
							@TD_180AVGMARKET_VALUE_TWD,

							@ACCOUNTTYPE,
							@ICOUNTRY,
							@issue_cntry,
							@iextrid,
							@SA_BANK,
							--					  Yvonne 2016-1109 Add for 需求 1051026-40 表7&8因減損進行調整
							@isin,
							@dprcAmt,
							@dprcAmtCur
								 							
							);
    
				       end									
			 CLOSE Data_04_Cur
			 DEALLOCATE Data_04_Cur


			 If				@i_RLine  In  ('00','05')	
						   goto        Data_Rline_05
			 else		   goto		 Data_RLine_06	
			 Data_Rline_05:			  
			 
			 If				@i_RLine  In  ('00','06')	
						   goto        Data_Rline_06
			 else		   goto		 Data_RLine_08	
			 Data_Rline_06:			  
			 If				@i_RLine  In  ('00','08')	
						   goto        Data_Rline_08
			 else		   goto		 Procedure_End
			 Data_Rline_08:			  
			 Procedure_End:			  
			 set @o_TCnt					= dbo.Uf_MsReport_IfExist
																				   (@i_Dealdt,
																					@i_Dealdt_str,						
																					@Rcode,
																					@i_ifund		,--原StType
																					@i_RLine       )
		     

END		 TRY
BEGIN CATCH
			  Set @o_ErrCode       = ERROR_NUMBER()
			  Set @o_SqlErrm	     = ERROR_MESSAGE()
			SELECT
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage;

			 


END CATCH;



















































GO


