USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_RMD_Dstk_Add]    Script Date: 2017/2/9 上午 11:49:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















-----------------------------------------------------------------------------------------------------
--系統分類　　: TGL 投資系統---RMD-國內外股票-風控分析資料Raw Data(自代操)
--系統名稱      : Up_RMD_Dstk_D
--程式性質　　: 副程式
--程式功能　　: 產生RMD_Dstk 資料 : 國內外股票-風控分析資料Raw Data(自代操)
--使用到檔案　: dbo.Tab_RMD_DStk
--使用到副程式: 
--程式撰寫者   : Yvonne Chen
--撰寫日期      : 2016-0616
--修改日期      : 2016-0617
--					  信評: fn_invest_credit a where ddate_w >= 20160101 where classcod = 'ISSUER'
--					  發行公司: issuer a where ddate_w >= 20160101 where classcod = 'ISSUER'
--					  2016-0729 will 2016-0728 來信說->3.	調整settlementPrice欄位值規則如下 因加權成本與「實際」加權成本有小數點位差，故調整規格為填入該檔庫存之總成本
--					  2016-0805 will 2016-0804 來信說->1.	調整equityPrice 資料長度如下經查創投或未上市櫃股票系統留存價格精確至小數點後6位，故調整小數點長度 (12, 5) --> (15, 8)
--					  2016-0819 will 2016-0819 來信說->1.	調整productID欄位值規則日後撈國外股票部位時，由原先的Bloomberg Ticker改撈ISIN
--																		2.	因配合0811頒布之「有價證券損失控管辦法」新增欄位41.settlementPrice2(含息總成本)
--																			依0816之會議記錄(詳附件1)，IMD將申請開發會計分類下之逐檔股票含息成本，待此項開發完成後，再請您協助撈取含息成本資訊填入此欄。
--					  2016-0826 will 2016-0826 來信說->新增BBGTicker : 彭博代碼;國內：ProductID + " TT Equity";國外：Bloomberg Ticker
--					  2016-0905 will 2016-0902 來信說->--1.	如電話所提，防止部位沒ISIN資料，會導致productID為空值及equityName和positionName串不到，故調整欄位邏輯如下( 並調整名詞holding name -> 內部代碼，以利後續溝通 )：
																		--2.	代操帳戶下的股票部位都是抓結算幣別，希望能改抓原幣別?
																		--舉例說明，ifund = 1FUBP時，
																		--positionID = ARM LN這檔股票原幣別應該是倫敦便士(GBp or GBX)，
																		--positionID = ABBN VX這檔股票原幣別應該是瑞士法郎(GHF)，目前抓到的都是EUR。
																		--因為從Oracle風險RC下載的文字檔有原幣的資訊，所以才問問。
																		--3.	ProductType有誤
																		--舉例說明，PositionID = 000061 CH時，原Oracle Class = CN_Stock，因此ProductType應該等於CN_Stock，但目前資料是T_STOCK。
																		--4.	為與海外股票取得一致，調整國內股票Bloomberg Ticker邏輯。
																		--5.	TG的國外股票部位，equityPrice都為0 ? 是否也是因為bloomberg資料未到位的關係 ? 
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
--					  2016-1116 Yvonne update for 需求1051027-63  含息損益國內自操已計算
----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go

			  Declare @i_ddate_w		   As	    Varchar(8)	                            ;              
			  Declare @i_ifund		       As     Varchar(20)                           ;			  
			  Declare @o_TCnt			   As     Int											;
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
			  Declare @i_UserId          As     Varchar(20)                           ;--使用者
Begin
			  set		   @i_ddate_w			= 20160729			  			  
			  set		   @i_UserId               = 'FAS'										;
			  set		   @i_iFund                 = 'ZFSRD'									;
			  

			exec dbo.UP_RMD_Dstk_Add
			  @i_ddate_w		   ,              
			  @i_ifund		       ,--原StType			  
			  @i_UserId          ,--使用者
			   @o_TCnt			   OUTPUT,
			  @o_ErrCode       OUTPUT,
			  @o_SqlErrm       OUTPUT

			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  

End		  ;	
*/
----------------------------------------------------------------------------------------------------
ALTER PRocedure [dbo].[UP_RMD_Dstk_Add]
			( @i_ddate_w		   As	    Varchar(8)	                            ,              			  
			  @i_ifund		       As     Varchar(20)                           ,--原StType			  
			  @i_UserId          As     Varchar(20)                           ,--使用者
			  @o_TCnt            As      int					OUTPUT				,
			  @o_ErrCode       As      int					OUTPUT				,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As
--           宣告
			declare @v_ddate_w_str as    Varchar(8)								    ;

			declare @ddate_w			as    Varchar(8)									;
			declare @iFund              as    Varchar(20)								;			 
			declare @classcod			 as    Varchar(20)								;			 
			declare @istkid   			 as    Varchar(20)								;
			declare @AccountType    as    Varchar(30)								;
			declare @icountry           as    Varchar(3)								    ;
			declare @icurid               as    Varchar(3)								    ;
            declare @u_Date        	 as     datetime									;
			declare @userid         	 as     varchar(20)								;
			 			
			declare	@PositionDate	as	varchar(8)	;
			declare	@SourceSystem	as	varchar(50)	;
			declare	@PositionID	as	varchar(50)	;
			declare	@ProductID	as	varchar(50)	;
			declare	@Company	as	varchar(50)	;
			declare	@Department	as	varchar(50)	;
			declare	@Division	as	varchar(50)	;
			declare	@Desk	as	varchar(50)	;
			declare	@Trader	as	varchar(50)	;
			declare	@Account	as	varchar(50)	;
			declare	@Market	as	varchar(24)	;
			declare	@ProductGroup	as	varchar(24)	;
			declare	@ProductType	as	varchar(24)	;
			declare	@Product	as	varchar(24)	;
			declare	@ProductDetail	as	varchar(24)	;
			declare	@Portfolio	as	varchar(24)	;
			declare	@Strategy	as	varchar(24)	;
			declare	@StrategyDetail	as	varchar(24)	;
			declare	@Continent	as	varchar(24)	;
			declare	@Region	as	varchar(24)	;
			declare	@IssuerClass	as	varchar(24)	;
			declare	@Sector as	varchar(24)	;
			declare	@IssuerRating	as	varchar(24)	;
			declare	@AccountingClass	as	varchar(24)	;
			declare	@Accounting	as	varchar(24)	;
			declare	@Benchmark	as	varchar(24)	;
			declare	@positionName	as	varchar(100)	;
			declare	@equityName	as	varchar(24)	;
			declare	@numberOfShares	as	decimal(20,4)	;
			declare	@beta	as	decimal(9,6)	;
			declare	@dividendYield	as	decimal(7,5)	;
--					  2016-0805 will 2016-0804 來信說->1.	調整equityPrice 資料長度如下經查創投或未上市櫃股票系統留存價格精確至小數點後6位，故調整小數點長度 (12, 5) --> (15, 8)
			declare	@equityPrice	as	decimal(15,8)	;
--			declare	@equityPrice	as	decimal(12,5)	;
			declare	@settlementDate	as	varchar(8)	;

--					  2016-0729 will 2016-0728 來信說->3.	調整settlementPrice欄位值規則如下 因加權成本與「實際」加權成本有小數點位差，故調整規格為填入該檔庫存之總成本			
			declare	@settlementPrice	as	decimal(30,8)	;
			--declare	@settlementPrice	as	decimal(12,6)	;
			declare	@equityCurrency	as	varchar(3)	;
			declare	@ignoreFXRisk	as	varchar(1)	;
			declare	@YTDSoldNumOfShares	as	decimal(20,4)		;
			declare	@YTDRealizedPL	as	decimal(25,5)		;
			declare	@IPODate	as	varchar(8)	;			 	
			declare	@settlementPrice2	as	decimal(30,8)	;
--					  2016-0826 will 2016-0826 來信說->新增BBGTicker : 彭博代碼;國內：ProductID + " TT Equity";國外：Bloomberg Ticker
			declare  @BBGTicker as Varchar(100);
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
			declare  @settlementCurrency as varchar(3);
			 
--           宣告			  
             Declare    Data_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
				  Z.*
			  From
							    (Select 
											d.ddate_w,
											d.ifund,
											d.istkID,
											d.AccountType,
											d.icountry,
											d.icurid		icurid,										    
											d.Classcod,											
											d.ddate_W		PositionDate,
											'TGL'				SourceSystem, --固定值
											d.istkid          PositionID,

											case 
												when m.ftype = '14' --icountry = 'TW'
												then  d.istkid
												when m.fdis   = '1'
												then  d.istkid
												when m.fdis   = '2'
--					  2016-0819 will 2016-0819 來信說->1.	調整productID欄位值規則日後撈國外股票部位時，由原先的Bloomberg Ticker改撈ISIN
--												then  m.isin
--					  2016-0905 will 2016-0902 來信說->--1.	如電話所提，防止部位沒ISIN資料，會導致productID為空值及equityName和positionName串不到，故調整欄位邏輯如下( 並調整名詞holding name -> 內部代碼，以利後續溝通 )：
												then d.istkID
												--then m.blgNo
												else  d.istkid
												end				
																ProductID,											
											case 
												when d.ifund  like   '1%' or  d.ifund  like 'K%'
												then  'KHL'
												else  'TGlobe'
												end	
													    		Company,
											'IMD'				Department,--固定值
											Null               Division,--暫填空白
											Null               Desk,--暫填空白
											Null               Trader,--暫填空白
											Null               Account,--暫填空白
											Null               Market,--暫填空白
											'EQUITY'        ProductGroup,--國內外股票部位皆填EQUITY，往後其他種類資產會另提規格
											
--					  2016-0905 will 2016-0902 來信說->
																		--3.	ProductType有誤
																		--舉例說明，PositionID = 000061 CH時，原Oracle Class = CN_Stock，因此ProductType應該等於CN_Stock，但目前資料是T_STOCK。
											 
										    case 
											    when m.fdis   = '1'
												then 'T_' +
														case 
														when M.ftype in('4','ETF')
														then  'ETF'
														when  M.ftype  in ('9','REITS')
														then	'REIT'
														else  'STOCK'
														end
												else  --substring(m.istkid,LEN(m.ISTKID)-2,4) +'_'+
													    upper(substring(m.icurid,1,2))+'_'+
														case 
														when M.ftype in('4','ETF')
														then  'ETF'
														when  M.ftype  in ('9','REITS')
														then	'REIT'
														else  'STOCK'
														end
												end

											 --'T_' +
										  --  case 
												--when M.ftype in('4','ETF')
												--then  'ETF'
												--when  M.ftype  in ('9','REITS')
												--then	'REIT'
												--else  'STOCK'
												--end				
																ProductType,
											m.nCstk        Product,
--		
										  case 												
												when m.fdis   = '1'
												then  dbo.Uf_cm_symbol
																	  (
																	  @i_ddate_w,
																	  'FN01',
																	  M.ftype,
																	  'SId-SNAME'
																	   )
												when m.fdis   = '2'
												then  ''
												else  ''
												end				
											
											--Null               
																	 ProductDetail,--暫填空白

											case 
												when d.ifund  like   '1%' or  d.ifund  like 'K%'
												then  case 
														when		m.fdis = '1'
														Then     'Local2'
														Else		'Foreign2'
														End     
												else  
														case 
														when		m.fdis = '1'
														Then     'Local'
														Else		'Foreign'
														End     
												end	
																Portfolio ,
											
											Case 
												when cm.fund_type  = '1'
												then  'Self-management'   
												When cm.fund_type  = '2'
												then  'Discretionary'
												Else  '無設定'
												End
																Strategy,
											
--Yvonne 2016-0627 Update for will 
-->1.	調整StrategyDetail編碼規則如下								
								--iFund + Accounting + ProductGroup + equityCurrency ex:	1AK_AFS_EQUITY_TWD
								/*
											Case 
												when m.fdis = '1'
												then 'T'
												else 'U'
												end												
											+'_STOCK_'
											+ D.IFUND
											+'_'
											+ CASE
													when d.accounttype = 'AFS'
													then  'AFS'
													else  'TRADING'
													end									--Will 說:-->> Oracle系統下載的VaR 股票文字檔有此欄(以下參考 K系統 )
																							--User提供的Excel 裡本欄註解如下 
                                                                                            --T-:國內 U-:國外
                                                                                            --KHL: 區隔資產
                                                                                            --TRADING: 交易目的
                                                                                            --AFS: 備供出售
                                                                                            --這裡的部位只有交易目的和備供出售
                                                                                            --Ex: T_STOCK_S_AFS
															         StrategyDetail,    
								*/
										    Null                    Continent,--Will 說:暫填空白
											Null                    Region,	--Will 說:暫填空白
											Null                    IssuerClass,--Will 說:暫填空白
											case 
														when		m.fdis = '1'
														Then     mp.GICS_SECTOR_NAME
														Else		m.GICS_SECTOR_NAME
														End     
											                         Sector,        --此資料來源為海外股票需求項目No.82
											'NR'                    IssuerRating, --Will 說:填入固定值NR
--Yvonne 2016-0627 Update for will 
--											   調整AccountingClass 欄位值規則如下，增加區分全球與國華資產，且考量Accounting = COST之案例											
--												全球資產會計目的 in ( CASH, AFS, FVPL )：FV
--												國華資產會計目的 in ( CASH, AFS, FVPL )：FV2
--												全球資產會計目的 in ( HTM, NACTM, COST )：AV
--												國華資產會計目的 in ( HTM, NACTM, COST )：AV2
											case 
												when d.AccountType in ('CASH','AFS','FVAL','FVTPL')
												then  
														case 
														when d.ifund  like   '1%' or  d.ifund  like 'K%'
														then  'FV2'  
												        else   'FV'   
														end
												when d.AccountType in ('HTM','NACTM','COST')
												then  case 
														when d.ifund  like   '1%' or  d.ifund  like 'K%'
														then  'AV2'  
												        else   'AV'
														end
												Else  'User 目前尚未指定'
												End
																	 AccountingClass,
											--d.AccountType    
											case 
												when d.AccountType = ('FVTPL')
												then  'FVPL'   												
												Else  d.AccountType    
												End
											                         Accounting,--Will 說:國內股票Accounting欄位值 FVTPL應該成FVPL
											m.Benchmark     Benchmark, --待基本資料新增											
											--positionName,
											--equityName,

											--case
											--when isnull(d.qShare,0) = 0
											--then  0
											--when d.qShare =''
											--then  0
											--else  d.qshare
											--end
											d.qshare
											            		  	 numberOfShares,
											Null                    beta,--Will 說:暫填空白
											Null                    dividendYield,--Will 說:暫填空白
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
--											d.price               
											P.price 
																	 equityPrice,
											Null                    settlementDate,--Will 說:	settlementDate暫填空白
--					  2016-0729 will 2016-0728 來信說->3.	調整settlementPrice欄位值規則如下 因加權成本與「實際」加權成本有小數點位差，故調整規格為填入該檔庫存之總成本														
										    d.mcost
											--Case
											--  when d.Qshare = 0                    
											--  then  0
											--  else   round(d.mcost/d.qshare,2)
											--  end
																	  settlementPrice,--Will 說:   同報表TG9919的加權成本欄位											

--Yvonne 2016-0627 Update for will 
--3.	equityCurrency若為台幣，請填NTD
											case 
											when d.icurid = 'TWD'
											then  'NTD'
--											else   d.icurid 
--					  2016-0905 will 2016-0902 來信說->--2.	代操帳戶下的股票部位都是抓結算幣別，希望能改抓原幣別?
--					  2016-0922 will 2016-0922 來信說-> 另如剛電話中所討論，TGL系統中 GB"P" or GB"p" 皆指大英鎊，唯因RMD目前的風險值系統(RM)只認得GB"P"，協請將欲填入「風控分析資料」內的equityCurrency欄位資料轉大寫 ! 

											else   upper(m.icurid)
											end
--											d.icurid
											                         equityCurrency,
											Null                    ignoreFXRisk,--Will 說:暫填空白
											isNull(t.TYSellqStks,0)	 YTDSoldNumOfShares,
											isNull(d1.TYSellmprft,0) YTDRealizedPL,
--Yvonne 參考表7作法 2016-0407 For Sarah     20160401 eMail 調整表7 股票類的Issue Date抓取規則為，抓TG0101 基本資料欄位的上市上櫃日欄位，如無上市上櫃日欄位，改抓發行日欄位
										    isNull(m.d_agree_w,
										            m.dissue_w)      
											IPODate				,
											d.mdcost1				settlementPrice2,
--					  2016-0826 will 2016-0826 來信說->新增BBGTicker : 彭博代碼;國內：ProductID + " TT Equity";國外：Bloomberg Ticker
											case 																						
											when m.fdis   = '2'
											then  m.blgNo							
											else   d.istkid				
											end				
											  						BBGTicker ,
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
											case 
											when d.icurid = 'TWD'
											then  'NTD'
											else   d.icurid
											end	
										                 settlementCurrency 
								  From    
											 dbo.fn_dstk					    D           --庫存
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
											 left join		isdbtgl.dbo.fn_stk_price P on p.istkID = d.istkID and p.ddate_W = d.ddate_w
											 left join 
											 ( Select    t1.ifund, t1.IstkID,t1.AccountType,t1.icurid, Sum(isnull(qstks,0)) TYSellqStks
											 	From      dbo.fn_stk_trade t1
												where    ddate_w          <= @i_ddate_w
												and        substring(ddate_w ,1,4)   =  substring(@i_ddate_w,1,4)
												--and        ddate_w          >= '20160101'--@v_ddate_w_str
												and        t1.ftrade            = 'S'
												Group By t1.ifund, t1.IstkID,t1.AccountType, t1.icurid
											 ) T           on T.ifund = D.ifund and T.istkID = D.istkid and T.AccountType = D.Accounttype and T.icurid = D.iCurid
											 left join 
											 ( Select    t1.ifund, t1.IstkID,t1.AccountType,t1.icurid, Sum(isnull(mprft,0)) TYSellmprft
											    From     dbo.fn_dstk t1
												where   ddate_w          <= @i_ddate_w
												--and      ddate_w          >= '20160101'--@v_ddate_w_str															
												and        substring(ddate_w ,1,4)   =  substring(@i_ddate_w,1,4)
												Group By t1.ifund, t1.IstkID,t1.AccountType, t1.icurid
											 ) D1           on D1.ifund = D.ifund and D1.istkID = D.istkid and D1.AccountType = D.Accounttype and D1.icurid = D.iCurid,
											 dbo.fn_stk_data				M   		  --基本資料											 											 
--Yvonne 2016-0725 韋婷mapping檔欄位改成只有一個ddate_W日期 
											 left join (SELECT istkid
																	  ,GICS_SECTOR_NAME
																   	  ,GICS_INDUSTRY_GROUP_NAME
																	  ,max(ddate_w) ddate_w
														   FROM    isdbTGL.dbo.fn_stk_data_mapping
														   where   ddate_w <= @i_ddate_W
														   group by istkid,GICS_SECTOR_NAME,GICS_INDUSTRY_GROUP_NAME ) mp on mp.istkid = m.istkid ,
											 dbo.cm_fund_data				cm
								Where    D.ddate_w             =  @i_ddate_w
								  And      D.ifund                 =  @i_ifund
								  And      m.istkID              =   D.istkID
								  And      isNull(m.duse_w,0)           <=  @i_ddate_w 
								  And      isNull(m.dexpire_w,99999999)       >=  @i_ddate_w
--Yvonne 2016-0725 韋婷mapping檔欄位改成只有一個ddate_W日期
						--		  And      isNull(mp.duse_w,0)                       <=  @i_ddate_w 
						--		  And      isNull(mp.dexpire_w,99999999)       >=  @i_ddate_w
								  And      cm.ifund				=   D.ifund
								  And      cm.level			    IN  ('1', '2')
								  And		 IsNull(cm.dbuild_w,0)				<= @i_ddate_w
								  And		 IsNull(cm.dFund_w,99999999)     >    @i_ddate_w								  								  
								  )														Z		  
--Yvonne 2016-0627 Update for will 
--2.	排除numberOfShares = 0之資料
		   where 	isnull(numberOfShares,0) <> 0		
           Order By
                 ifund,Classcod,Portfolio
		  ;		  

BEGIN		Try
--	Step00		 初始化
			 set			@o_Sqlerrm															= ' '
			 set			@o_ErrCode															= 0
			 set			@o_TCnt																= 0
			 set		    @u_Date																= SYSDATETIME()			  
			 set		    @Userid																	=  isnull(@i_UserId,User)				 			 
			 set			@ddate_w																= @i_ddate_w
			 set			@v_ddate_w_Str													= CONVERT(VARCHAR,floor((@ddate_w/10000)*10000+0101))

			 --select @v_ddate_w_str
			 --select @i_ddate_w

			 exec		    dbo.Up_RMD_Dstk_D @i_ddate_w,@i_ifund,@o_Errcode,@o_Sqlerrm ;
--	Step0.1 讀取& Insert 資料
			 Open Data_Cur
			 while (@@error = 0)			 
				begin
				
					fetch next from Data_Cur into 
							@ddate_w,
							@ifund,
							@istkID,
							@AccountType,
							@icountry,
							@icurid,
							@Classcod,
							--@USERID,
							--@U_DATE,
							@PositionDate,
							@SourceSystem,
							@PositionID,
							@ProductID,
							@Company,
							@Department,
							@Division,
							@Desk,
							@Trader,
							@Account,
							@Market,
							@ProductGroup,
							@ProductType,
							@Product,
							@ProductDetail,
							@Portfolio,
							@Strategy,
							--@StrategyDetail,
							@Continent,
							@Region,
							@IssuerClass,
							@Sector,
							@IssuerRating,
							@AccountingClass,
							@Accounting,
							@Benchmark,							
							@numberOfShares,
							@beta,
							@dividendYield,
							@equityPrice,
							@settlementDate,
							@settlementPrice,
							@equityCurrency,
							@ignoreFXRisk,
							@YTDSoldNumOfShares,
							@YTDRealizedPL,
							@IPODate,
							@settlementPrice2,
							@BBGTicker,
							@settlementCurrency
								
					if (@@fetch_status <> 0)
						break														
							Begin														
--Yvonne 2016-0627 Update for will 
-->1.	調整StrategyDetail編碼規則如下								
								--iFund + Accounting + ProductGroup + equityCurrency ex:	1AK_AFS_EQUITY_TWD
								Set   @StrategyDetail = @iFund +'_' +  @Accounting +'_' + @ProductGroup +'_' +  @equityCurrency

								Set	@positionName = @PositionDate +'_' + @Department +'_' + @StrategyDetail+'_' +@ProductID
								

								Set   @equityName =
								Case
									When  @portfolio like ('local%')
									Then   case      								
													when IsNull(@IPODate,0) <> 0 and
															datediff  (day,
																		convert(datetime, @IPoDate, 112),
																		convert(datetime, @PositionDate, 112)
																		) >=365
													Then   'CLNT.SYSJ.'+ @ProductId
													else    'CLNT.TGlobe.'+ @ProductId 
													end	 
--equityName	股票名稱	varchar	24	Yes	"國內且(PositionDate-IPODate)>=1year：CLNT.SYSJ. + ProductID
--國內且(PositionDate-IPODate)<1year：CLNT.TGlobe. + ProductID
								  --Else	 'CLNT.TGlobe.'+ @ProductId
--					  2016-0905 will 2016-0902 來信說->								
--國外：CLNT.TGlobe. + replace( ProductID ,"" "" ,""_"" )"	"CLNT.SYSJ.2882 CLNT.TGlobe.ARM_LN"
									Else	 'CLNT.TGlobe.'+ Replace(@ProductId,' ','_')									
									End																								
							   Set   @Sector =
								Case
									When  isnull(@Sector,'XX') = 'XX'
									Then   ''
									Else	 @Sector
									End						

--Yvonne 2016-0819 等含息成本進來下行就要拿掉!!!
--					  2016-1116 Yvonne update for 需求1051027-63  含息損益國內自操已計算
--					  2016-1118 Yvonne update for 需求1051027-63  含息損益國外自操已計算
--					  2017-0207 Yvonne 接下來代操也有資料了, 所以settlementPrice2 欄不用設條件~~~~
								--Set  @settlementPrice2 =
								-- Case 
								--	When  --@equityCurrency in( 'TWD','NTD') and
								--			  substring(@iFund ,2,1) not in ('D','F')	--第二碼為DF 為代操
								--	Then   @settlementPrice2
								--	Else	  Null
								--	End

--							    Set  @settlementPrice2 = NULL

--Yvonne 2016-0826 will 2016-0826 來信說->新增BBGTicker : 彭博代碼;國內：ProductID + " TT Equity";國外：Bloomberg Ticker

--					  2016-0905 will 2016-0902 來信說->--4.	為與海外股票取得一致，調整國內股票Bloomberg Ticker邏輯。
																		--國內：ProductID + " TT"
																		--國外：Bloomberg Ticker
								Set   @BBGticker =
								Case
									When @portfolio like ('local%')
									--Then  @BBGTicker+' TT Equity'
									Then  @BBGTicker+' TT'
									Else	 @BBGTicker
									End			

							End	

							
							--If  isnull(@numberOfShares,0) <> 0  then
							
							insert into dbo.TAB_RMD_Dstk
						   (
						    ddate_w,
							ifund,
							istkID,
							AccountType,
							icountry,
							Classcod,
							USERID,
							U_DATE,
							PositionDate,
							SourceSystem,
							PositionID,
							ProductID,
							Company,
							Department,
							Division,
							Desk,
							Trader,
							Account,
							Market,
							ProductGroup,
							ProductType,
							Product,
							ProductDetail,
							Portfolio,
							Strategy,
							StrategyDetail,
							Continent,
							Region,
							IssuerClass,
							Sector,
							IssuerRating,
							AccountingClass,
							Accounting,
							Benchmark,
							positionName,
							equityName,
							numberOfShares,
							beta,
							dividendYield,
							equityPrice,
							settlementDate,
							settlementPrice,
							equityCurrency,
							ignoreFXRisk,
							YTDSoldNumOfShares,
							YTDRealizedPL,
							IPODate,
							settlementPrice2,
							BBGTicker,
							settlementCurrency
							)
							Values
							(
							@ddate_w,
							@ifund,
							@istkID,
							@AccountType,
							@icountry,
							@Classcod,
							@USERID,
							@U_DATE,
							@PositionDate,
							@SourceSystem,
							@PositionID,
							@ProductID,
							@Company,
							@Department,
							@Division,
							@Desk,
							@Trader,
							@Account,
							@Market,
							@ProductGroup,
							@ProductType,
							@Product,
							@ProductDetail,
							@Portfolio,
							@Strategy,
							@StrategyDetail,
							@Continent,
							@Region,
							@IssuerClass,
							@Sector,
							@IssuerRating,
							@AccountingClass,
							@Accounting,
							@Benchmark,
							@positionName,
							@equityName,
							@numberOfShares,
							@beta,
							@dividendYield,
							@equityPrice,
							@settlementDate,
							@settlementPrice,
							@equityCurrency,
							@ignoreFXRisk,
							@YTDSoldNumOfShares,
							@YTDRealizedPL,
							@IPODate,			
							@settlementPrice2,
							@BBGTicker,
							@settlementCurrency
							);
							
				       end									
			 CLOSE Data_Cur
			 DEALLOCATE Data_Cur

			 Procedure_End:			  
			 set @o_TCnt					= dbo.Uf_RMD_Dstk_IfExist
																				   (@i_ddate_w	,																																					
																					@i_ifund		)
		     

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


