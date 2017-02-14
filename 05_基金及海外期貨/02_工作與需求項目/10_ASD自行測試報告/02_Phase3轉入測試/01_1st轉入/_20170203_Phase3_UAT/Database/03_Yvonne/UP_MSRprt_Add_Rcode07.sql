USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_MSRprt_Add_Rcode07]    Script Date: 2017/2/9 上午 11:34:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













-----------------------------------------------------------------------------------------------------
--系統分類　　: 月(年)報
--系統名稱      : UP_MSRprt_Add_Rcode07
--程式性質　　: 副程式
--程式功能　　: 產生Rcode 07 資料
--使用到檔案　: dbo.Tab_PRt_MSReport
--使用到副程式: 
--程式撰寫者   : Yvonne Chen--
--撰寫日期      : 2015-1230
--修改日期      : 2016-0104
/*
MSReport07	01	基金	
MSReport07	02	RP	
MSReport07	03	國內債券	
MSReport07	04	股票	
MSReport07	05	還本	
MSReport07	06	定存	
MSReport07	07	結構式商品	
*/
--					  Yvonne 2016-0328 For Sarah 	 ClassITemX show fn_Stk_data 's FType information
--					  Yvonne 2016-0407 For Sarah     20160401 eMail 調整表7 
--												1.	把Trade Date 和 Settle Date的欄位刪除
--												2.	把Issue Date欄位到 Maturity Date欄位前面
--												3.	股票類的Issue Date抓取規則為，抓TG0101 基本資料欄位的上市上櫃日欄位，如無上市上櫃日欄位，改抓發行日欄位
--				      Yvonne 2016-0407 傳入使用者(實際user, 非Tgl_Admin)
--				      Yvonne 2016-0425  For Sarah 新增需求 增加 Comoney 半年均價 & 均價市值
--					  Yvonne 2016-0602 Add 僅抓國內交易(TWD)
--					  Yvonne 2017-0105 Add 國內基金
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
			  set		   @i_Dealdt_Str		= 20140731
			  set		   @i_Basedt			= 20140829
			  set		   @i_CurRatedt		= 20140829
			  set		   @i_ifund				= '1AKH'
			  set		   @i_RLine				= '00'

			exec dbo.UP_MSRprt_Add_Rcode07
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
/*
								SELECT Rcode,
			                RLine,
							RLineSno,			
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
							icurid							,
							Trade_Date             ,
							Settle_Date            ,
							Maturity_Date          ,
							issue_date             ,
							PAR_VALUE              ,
							ORIGINAL_COST          ,
							BOOK_VALUE             ,
							MARKET_VALUE           ,
							UNREALIZED_GL          ,
							ClassItemX             ,
							
							Oracle_Class		   ,
							Td_price_DT			   ,
							Td_price	
			      From dbo.tab_Prt_MsReport
				  Where dealdt	  = 20140829
				  and		dealdt_str= 20140731
				  and     ifund		   ='1AKH'
				  
*/
----------------------------------------------------------------------------------------------------
ALTER PRocedure [dbo].[UP_MSRprt_Add_Rcode07]
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
			 declare @FundCod			 as    Varchar(20)								;
			 declare @FUNDNAME		 as    Varchar(200)								;
			 declare @FundCod_Deal	 as    Varchar(100)								;
			 declare @icurid				 as    Varchar(3)								    ;
			 declare @Trade_Date		 as    Varchar(8)								    ;
			 declare @Settle_Date		 as    Varchar(8)								    ;
			 declare @Maturity_Date  as    Varchar(8)								    ;
			 declare @issue_date		 as    Varchar(8)								    ;
			 declare @PAR_VALUE		 as    numeric(30,8)							;
			 declare @ORIGINAL_COST
												 as    numeric(30,8)							;
			 declare @BOOK_VALUE  as    numeric(30,8)							;
			 declare @MARKET_VALUE
											     as    numeric(30,8)							;
			 declare @UNREALIZED_GL
												 as    numeric(30,8)							;
			 declare @ClassItemX		 as    Varchar(100)								;
			 

			 declare @Oracle_Class	 as    Varchar(100)								;
			 declare @portfolio			 as    Varchar(100)								;
			 declare @Td_price_DT    as    Varchar(8)								    ;
			 declare @Td_price          as    numeric(12,6)							;
			 declare @TD_180AVGPRICE          
												 as    numeric(12,6)							;
			 declare @TD_180AVGMARKET_VALUE          
												 as    numeric(30,8)							;
			 declare @TD_180AVGMARKET_VALUE_TWD          
												 as    numeric(22,0)							;

			 declare @Couponrate		 as     numeric(12,6)                          ;
			 declare @u_Date        	 as     datetime									;
			 declare @userid         	 as     varchar(20)								;			 
			 
--           宣告			  
             Declare    Data_04_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport07'			   Rcode        ,
			      '04'                            RLine         ,                  
                 '國內股票'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  d.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
										  --m.nCstk    iFund_C                     ,--Profolio中文名稱    --(cm_Fund_Data.NC) <--這欄還沒有抓正確來源
--Yvonne 2016-0318 Add 
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
																			
										  m.Classcod                                             ,                      --(fn_dstk.Calsscod)
										  d.AccountType                                        ,--會計分類(ClassITem) --(fn_dstk.AccountType)                  
										  d.istkID                     Security_Name       ,--股票代碼            --(fn_dstk.istkID) 
										  m.nCstk                      Security_Description   ,--證券中文名稱        --(fn_stk_Data.nCstk)
--先改成不要抓TRADE 檔
--										  0                               Trade_Date             ,--交易日              --(fn_stk_trand.ddate_W 最近一筆) 
--										  0                                Settle_Date            ,--交割日              --(fn_stk_trand.dstao_w 最近一筆) 
										  t.ddate_w                    Trade_Date            ,--交易日              --(fn_stk_trand.ddate_W 最近一筆) 
										  t.dsato_w                    Settle_Date            ,--交割日              --(fn_stk_trand.dstao_w 最近一筆) 
										  m.dExpire_w                  Maturity_Date      ,--到期日              --股票沒有 
--					  Yvonne 2016-0407 For Sarah     20160401 eMail 調整表7 股票類的Issue Date抓取規則為，抓TG0101 基本資料欄位的上市上櫃日欄位，如無上市上櫃日欄位，改抓發行日欄位
										  isNull(m.d_agree_w,
										           m.dissue_w)      issue_date              ,--發行日              --                               --P欄: issue date            發行日
--										  m.dissue_w                   issue_date           ,--發行日              --                               --P欄: issue date            發行日
										  d.qshare                     PAR_VALUE            ,--                    --(fn_dstk.qshare)               --I欄: PAR VALUE             面額(單位數、股數)
										  d.mcost                      ORIGINAL_COST    ,--                    --(fn_dstk.mcost)                --J欄: ORIGINAL COST         債券：購買日之面額*交割價格/100 ; 股票：交割金額
										  d.mcost                      BOOK_VALUE         ,--                    --(fn_dstk.mcost)                --K欄: BOOK VALUE            報表日之攤銷後成本
										  d.mntamt                     MARKET_VALUE    ,--市值                --(fn_dstk.mamt,外幣為mntamt)    --L欄: MARKET VALUE          債券:報表日的面額*報表日的公平價格/100 ; 股票:報表日股數*報表日收盤價
										  "UNREALIZED_GL" =
--					  Yvonne 2016-1028 Sarah 來電說不要下行判斷, 怎麼樣都要算
										  isnull(d.mntamt,0)- isnull(mcost ,0)
										 -- case 
											--when IsNull(d.mcost,0)*IsNull(d.mntamt,0) =0 
											--then  0 					
											--else  d.mntamt-mcost 
											--end
																										,				  
																										--M欄: UNREALIZED GAIN/LOSS  未實現損益
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
																										  ,                      --Portfolio
																												   --基本上是 幣別_KHL/TGL-AccountType
																												   --幣別:    NTD->T , Else  icurID 
																												   --資產別:  KH-> KHL ; TG-> TGL
																												   --ex:      T_KHL-TRANDING    (FVTPL)
																												   

  
										  --''                                 ClassItemX             ,                      --這欄好像不需要了 
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
										  'T_' +
										  case 
											when M.ftype in('4','ETF')
											then  'ETF'
										    when  M.ftype  in ('9','REITS')
											then	'REIT'
											else  'STOCK'
											end															,
										  d.dprice_w                   Td_price_DT				,
										  d.price                         Td_price					,
--				      Yvonne 2016-0425  For Sarah 新增需求 增加 Comoney 半年均價 & 均價市值										    
										  --cMoney.dbo.GetMA(d.istkid,d.ddate_W,180,M.ftype)
--					  Yvonne 2016-0519  韋婷改抓改成抓fas的股價table『fn_Stk_price』。&改放在isdbTGL
									      --cMoney.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 是指6個月
										  isdbTgl.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 是指6個月
																			 TD_180AVGPRICE     


						--以下欄位應該不需要了吧~~~~~ 
						--Yvonne-2015-0123 增加3欄資訊BlstRate & BlstCurrate & BlstUnitValue for 周詩凱的A1 報表
						--                  C1                         BlstRate               ,--庫存平均利率
						--                  C2                         BlstCurrate            ,
						--                  C3                         BlstUnitValue          ,
						--Yvonne-2015-0309 for 周詩凱測試 測試1_20150225.doc , 增加 承作利率 for RP &定存 
						--                  C4                         Coupon_Rate

								  From    
											 dbo.fn_dstk					    D,           --庫存
											 dbo.fn_stk_data				M, 		  --基本資料
--											 /*
--Yvonne 20160205 改寫, coz trade 檔案並不一定有資料
											 (
											 SELECT zm.ifund,zm.istkID,zm.icurid,zm.accountType , t2.ddate_w , t2.dsato_w
																			FROM dbo.fn_dstk zm
											 left join ( Select    t1.ifund, t1.IstkID,t1.AccountType,t1.icurid,				
																									Max(t1.ddate_W) ddate_w, Max(t1.dsato_w) dsato_w
																						From  dbo.fn_stk_trade t1
																						where ddate_w          <= @i_Dealdt																						
																						Group By t1.ifund, t1.IstkID,t1.AccountType, t1.icurid
																														) t2 on zm.ifund=t2.ifund and zm.istkid = t2.istkid and zm.icurid= t2.icurid and zm.accounttype = t2.accounttype
											 where zm.ddate_W  =@i_Dealdt 
											 
											 And    ( (@i_ifund				  = '00')
												or
													    (@i_ifund				  <>  '00'
														 And 
														 zm.ifund                 =  @i_ifund) 	
											           )

											 ) T
--											 */
											 /*
											 (Select   t1.ifund, t1.IstkID,t1.AccountType,Max(ddate_w) ddate_W, Max(dsato_W) dsato_w
											  From  dbo.fn_stk_trade t1
											  where ddate_w             <= @i_Dealdt
											  Group By t1.ifund,t1.istkID,t1.AccountType) 
											   T
											   */
								Where    D.ddate_w             =  @i_Dealdt
--Yvonne 2016-0602 Add 僅抓國內交易(TWD)
								  And    d.icurid                 ='TWD'
								  And    ( (@i_ifund				  = '00')
												or
											  (@i_ifund				  <>  '00'
											  And 
											    D.ifund                 =  @i_ifund) 	
											)
								  And      @i_RLine              in('00','04')		  
								  And      m.istkID              =   D.istkID
								  And      m.duse_w           <=  @i_Dealdt 
								  And      m.dexpire_w       >=  @i_Dealdt
								  And      T.iFund                =   D.ifund
								  And      T.istkID               =   D.istkID
								  And      T.icurid                =   D.icurid
								  And      T.accountType		=   D.accountType
								  
								  )														Z
		  Where(IsNull(PAR_VALUE,0)                    <> 0
                 or
                 IsNull(BOOK_VALUE,0)                   <> 0 )
                 or
                (Security_Name in ('1407s','1407t','1602','1706e','2398s','5605'))
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
		  ;		  

		  Declare    Data_01_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport07'			   Rcode        ,
			      '01'                            RLine         ,                  
                 '國內基金'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  d.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
										  --m.nCstk    iFund_C                     ,--Profolio中文名稱    --(cm_Fund_Data.NC) <--這欄還沒有抓正確來源
--Yvonne 2016-0318 Add 
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
																			
										  m.Classcod                                             ,                      --(fn_dstk.Calsscod)
										  d.AccountType                                        ,--會計分類(ClassITem) --(fn_dstk.AccountType)                  
										  d.ifdID                     Security_Name       ,--股票代碼            --(fn_dstk.ifdID) 
										  m.ifdName                      Security_Description   ,--證券中文名稱        --(fn_fd_data.nCstk)
--先改成不要抓TRADE 檔
--										  0                               Trade_Date             ,--交易日              --(fn_stk_trand.ddate_W 最近一筆) 
--										  0                                Settle_Date            ,--交割日              --(fn_stk_trand.dstao_w 最近一筆) 
										  ''                                Trade_Date            ,--交易日              --(fn_stk_trand.ddate_W 最近一筆) 
										  ''                                Settle_Date            ,--交割日              --(fn_stk_trand.dstao_w 最近一筆) 
										  m.dExpire_w                  Maturity_Date      ,--到期日              --股票沒有 
										  m.dissue_w                issue_date              ,--發行日              --                               --P欄: issue date            發行日
										  d.q_qty                      PAR_VALUE            ,--                    --(fn_dstk.qshare)               --I欄: PAR VALUE             面額(單位數、股數)
										  d.mcost                      ORIGINAL_COST    ,--                    --(fn_dstk.mcost)                --J欄: ORIGINAL COST         債券：購買日之面額*交割價格/100 ; 股票：交割金額
										  d.mcost                      BOOK_VALUE         ,--                    --(fn_dstk.mcost)                --K欄: BOOK VALUE            報表日之攤銷後成本
										  d.mamtTWD               MARKET_VALUE    ,--市值                --(fn_dstk.mamt,外幣為mntamt)    --L欄: MARKET VALUE          債券:報表日的面額*報表日的公平價格/100 ; 股票:報表日股數*報表日收盤價
										  "UNREALIZED_GL" =
--					  Yvonne 2016-1028 Sarah 來電說不要下行判斷, 怎麼樣都要算
										  isnull(d.mamtTWD,0)- isnull(mcost ,0)
										 -- case 
											--when IsNull(d.mcost,0)*IsNull(d.mntamt,0) =0 
											--then  0 					
											--else  d.mntamt-mcost 
											--end
																										,				  
																										--M欄: UNREALIZED GAIN/LOSS  未實現損益
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
																										  ,                      --Portfolio
																												   --基本上是 幣別_KHL/TGL-AccountType
																												   --幣別:    NTD->T , Else  icurID 
																												   --資產別:  KH-> KHL ; TG-> TGL
																												   --ex:      T_KHL-TRANDING    (FVTPL)
																												   

  
										  --''                                 ClassItemX             ,                      --這欄好像不需要了 
--Yvonne 2016-0328 For Sarah 	 ClassITemX show fn_fd_data 's FType information
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
										  d.dPnav_w                   Td_price_DT				,
										  d.PNAV                        Td_price					,
										  isdbTgl.dbo.GetMA(d.ifdID,d.ddate_W,6,M.fkind) -- 6 是指6個月 --再確認要如何給值
																			 TD_180AVGPRICE     


						--以下欄位應該不需要了吧~~~~~ 
						--Yvonne-2015-0123 增加3欄資訊BlstRate & BlstCurrate & BlstUnitValue for 周詩凱的A1 報表
						--                  C1                         BlstRate               ,--庫存平均利率
						--                  C2                         BlstCurrate            ,
						--                  C3                         BlstUnitValue          ,
						--Yvonne-2015-0309 for 周詩凱測試 測試1_20150225.doc , 增加 承作利率 for RP &定存 
						--                  C4                         Coupon_Rate

								  From    
											 dbo.fn_dfd					D,           --庫存
											 dbo.fn_fd_data				M  		  --基本資料
								Where    D.ddate_w             =  @i_Dealdt
--Yvonne 2016-0602 Add 僅抓國內交易(TWD)
								  And    d.icurid                 ='TWD'
								  And    ( (@i_ifund				  = '00')
												or
											  (@i_ifund				  <>  '00'
											  And 
											    D.ifund                 =  @i_ifund) 	
											)
								  And      @i_RLine              in('00','01')		  
								  And      m.ifdID              =   D.ifdID
								  And      m.duse_w           <=  @i_Dealdt 
								  And      m.dexpire_w       >=  @i_Dealdt
								  
								  )														Z
		  Where(IsNull(PAR_VALUE,0)                    <> 0
                 or
                 IsNull(BOOK_VALUE,0)                   <> 0 )
                
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
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
			 set			@icurid																	='TWD'

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

			 set			@Rcode																    = 'MSReport07'
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
						    @ReMark					,				 							
							@iFund                      ,
							@iFund_C                  ,
							@Classcod                 ,
							@AccountType           ,--會計分類
							@FundCod			       ,--股票代碼
							@FundName			   ,--中文名稱
							@Trade_Date            ,--交易日
							@Settle_Date            ,--交割日
							@Maturity_Date         ,--到期日
							@issue_date              ,--發行日
							@PAR_VALUE             ,--面額	(fn_dstk.qshare)             面額(單位數、股數)
							@ORIGINAL_COST     ,
							@BOOK_VALUE          ,--攤銷後成本(fn_dstk.mcost)            報表日之攤銷後成本
							@MARKET_VALUE      ,--市值         (fn_dstk.mamt,外幣為mntamt)
							@UNREALIZED_GL	   ,
							@Portfolio		           ,
							@ClassItemX             ,
							@FundCod_Deal         ,
							@Oracle_Class			,
							@Td_price_DT			,
							@Td_price					,
							@Td_180AVGPRICE
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @TD_180AVGMARKET_VALUE =Null
							Set			@TD_180AVGMARKET_VALUE_TWD=Null
							If				 isnull(@Td_180AVGPRICE,0) <> 0 
							Begin
								Set	 @TD_180AVGMARKET_VALUE = isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0)
								Set	@TD_180AVGMARKET_VALUE_TWD = Round(isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0),0)							

							End	
													
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
							iFund_C,
							Classcod,
							AccountType,
							FundCod,
							FUNDNAME,
							FundCod_Deal,
							icurid,
							Trade_Date,
							Settle_Date,
							Maturity_Date,
							issue_date,
							PAR_VALUE,
							ORIGINAL_COST,
							BOOK_VALUE,
							MARKET_VALUE,
							UNREALIZED_GL,
							Portfolio,
							ClassItemX,							
							STTYPEXCHIN,
							Oracle_Class,
							Td_price_DT,
							Td_price,
							TD_180AVGPRICE,
						    TD_180AVGMARKET_VALUE,
							TD_180AVGMARKET_VALUE_TWD
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
							@iFund_C,
							@Classcod,
							@AccountType,
							@FundCod,
							@FUNDNAME,
							@FundCod_Deal,
							@icurid,
							@Trade_Date,
							@Settle_Date,
							@Maturity_Date,
							@issue_date,
							@PAR_VALUE,
							@ORIGINAL_COST,
							@BOOK_VALUE,
							@MARKET_VALUE,
							@UNREALIZED_GL,
							@Portfolio,
							@ClassItemX,
							@iFund_C,
							@Oracle_Class,
							@Td_price_DT,
							@Td_price				,
							@TD_180AVGPRICE,
							@TD_180AVGMARKET_VALUE,
							@TD_180AVGMARKET_VALUE_TWD
								 							
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

			 set			@Rcode																    = 'MSReport07'
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
						    @ReMark					,				 							
							@iFund                      ,
							@iFund_C                  ,
							@Classcod                 ,
							@AccountType           ,--會計分類
							@FundCod			       ,--股票代碼
							@FundName			   ,--中文名稱
							@Trade_Date            ,--交易日
							@Settle_Date            ,--交割日
							@Maturity_Date         ,--到期日
							@issue_date              ,--發行日
							@PAR_VALUE             ,--面額	(fn_dstk.qshare)             面額(單位數、股數)
							@ORIGINAL_COST     ,
							@BOOK_VALUE          ,--攤銷後成本(fn_dstk.mcost)            報表日之攤銷後成本
							@MARKET_VALUE      ,--市值         (fn_dstk.mamt,外幣為mntamt)
							@UNREALIZED_GL	   ,
							@Portfolio		           ,
							@ClassItemX             ,
							@FundCod_Deal         ,
							@Oracle_Class			,
							@Td_price_DT			,
							@Td_price					,
							@Td_180AVGPRICE
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
							Set           @TD_180AVGMARKET_VALUE =Null
							Set			@TD_180AVGMARKET_VALUE_TWD=Null
							If				 isnull(@Td_180AVGPRICE,0) <> 0 
							Begin
								Set	 @TD_180AVGMARKET_VALUE = isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0)
								Set	@TD_180AVGMARKET_VALUE_TWD = Round(isnull(@PAR_VALUE,0)*isnull(@Td_180AVGPRICE,0),0)							

							End	
													
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
							iFund_C,
							Classcod,
							AccountType,
							FundCod,
							FUNDNAME,
							FundCod_Deal,
							icurid,
							Trade_Date,
							Settle_Date,
							Maturity_Date,
							issue_date,
							PAR_VALUE,
							ORIGINAL_COST,
							BOOK_VALUE,
							MARKET_VALUE,
							UNREALIZED_GL,
							Portfolio,
							ClassItemX,							
							STTYPEXCHIN,
							Oracle_Class,
							Td_price_DT,
							Td_price,
							TD_180AVGPRICE,
						    TD_180AVGMARKET_VALUE,
							TD_180AVGMARKET_VALUE_TWD
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
							@iFund_C,
							@Classcod,
							@AccountType,
							@FundCod,
							@FUNDNAME,
							@FundCod_Deal,
							@icurid,
							@Trade_Date,
							@Settle_Date,
							@Maturity_Date,
							@issue_date,
							@PAR_VALUE,
							@ORIGINAL_COST,
							@BOOK_VALUE,
							@MARKET_VALUE,
							@UNREALIZED_GL,
							@Portfolio,
							@ClassItemX,
							@iFund_C,
							@Oracle_Class,
							@Td_price_DT,
							@Td_price				,
							@TD_180AVGPRICE,
							@TD_180AVGMARKET_VALUE,
							@TD_180AVGMARKET_VALUE_TWD
								 							
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
			 else		   goto		 Data_RLine_07	
			 Data_Rline_06:			  
			 If				@i_RLine  In  ('00','07')	
						   goto        Data_Rline_07
			 else		   goto		 Procedure_End
			 Data_Rline_07:			  
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


