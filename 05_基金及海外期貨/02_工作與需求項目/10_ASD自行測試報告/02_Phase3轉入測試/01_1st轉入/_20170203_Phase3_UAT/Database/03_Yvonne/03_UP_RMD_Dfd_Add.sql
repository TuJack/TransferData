USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_RMD_Dfd_Add]    Script Date: 2017/2/9 上午 11:45:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











-----------------------------------------------------------------------------------------------------
--系統分類　　: TGL 投資系統---RMD-國內外基金-風控分析資料Raw Data(自代操)
--系統名稱      : Up_RMD_Dfd_D
--程式性質　　: 副程式
--程式功能　　: 產生RMD_Dfd 資料 : 國內外基金-風控分析資料Raw Data(自代操)
--使用到檔案　: dbo.Tab_RMD_Dfd
--使用到副程式: 
--程式撰寫者   : Yvonne Chen
--撰寫日期      : 2016-1228
--修改日期      : 2016-1228
--					  2017-0118 Yvonne Update 
--					  2017-0124 Yvonne Will 說Sector 這欄填空白
--					  2017-0207 Yvonne Will 來信, 確認了 ProductGroup, ProductType, ProductDetail
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
			  

			exec dbo.UP_RMD_Dfd_Add
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
CREATE PRocedure [dbo].[UP_RMD_Dfd_Add]
--Create PRocedure [dbo].[UP_RMD_Dfd_Add]
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
			declare @ifdID   			 as    Varchar(20)								;
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
											d.ifdID,
											d.AccountType,
											--d.icountry,
											d.icurid		icurid,										    
											d.Classcod,											
											d.ddate_W		PositionDate,
											'TGL'				SourceSystem, --固定值
											d.ifdID          PositionID,											
											d.ifdID			ProductID,											
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
											'EQUITY'        ProductGroup,--Yvonne 2017-0207 Will 來信->國內外基金部位皆填EQUITY																					 
										    case 
											    when m.fdis   = '1'
												then 'T_' 
												else  substring(m.icurid,1,2)+'_'														
												end
										  +'Fund'																						 				
													  			   ProductType,
																					 --Yvonne 2017-0207 Will 來信->
																					 --國內："T_Fund"
																					 --國外：left( equityCurrency, 2 ) + "_Fund"
											m.ifdname        Product,
										  
											case 
													when isNull(M.fkind,'') in('')
													then  '目前沒有分類'														
													else  m.Fkind + '-' +
														    dbo.Uf_cm_symbol(  d.ddate_w,
																							'FN37',
																							m.fkind,
																							'SNAME'		   			  
																						)
													end										    																				
																	 ProductDetail,--Yvonne 2017-0207 Will 來信->fkind

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
											Null                    Sector,        --Will 說:填空白
											'NR'                    IssuerRating, --Will 說:填入固定值NR
--Yvonne 2016-0627 Update for will 
--											   調整AccountingClass 欄位值規則如下，增加區分全球與國華資產，且考量Accounting = COST之案例											
--												全球資產會計目的 in ( CASH, AFS, FVPL )：FV
--												國華資產會計目的 in ( CASH, AFS, FVPL )：FV2
--												全球資產會計目的 in ( HTM, NACTM, COST )：AV
--												國華資產會計目的 in ( HTM, NACTM, COST )：AV2
											case 
												when d.AccountType in ('CASH','AFS','FVPL','FVTPL')
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
											--m.Benchmark     
											Null
																	 Benchmark, --待基本資料新增											
											
											d.q_qty
											            		  	 numberOfShares,
											Null                    beta,--Will 說:暫填空白
											Null                    dividendYield,--Will 說:暫填空白
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
											P.pnav
																	 equityPrice,
											Null                    settlementDate,--Will 說:	settlementDate暫填空白
--					  2016-0729 will 2016-0728 來信說->3.	調整settlementPrice欄位值規則如下 因加權成本與「實際」加權成本有小數點位差，故調整規格為填入該檔庫存之總成本														
										    d.mcost											
																	  settlementPrice,--Will 說:   同報表TG9919的加權成本欄位											

--3.	equityCurrency若為台幣，請填NTD
											case 
											when d.icurid = 'TWD'
											then  'NTD'
											else   m.icurid 
											end
											                         equityCurrency,
											Null                    ignoreFXRisk,--Will 說:暫填空白
											isNull(t.TYSellq,0)	 YTDSoldNumOfShares,
											isNull(d1.TYSellmprft,0) YTDRealizedPL,
--Yvonne 參考表7作法 2016-0407 For Sarah     20160401 eMail 調整表7 股票類的Issue Date抓取規則為，抓TG0101 基本資料欄位的上市上櫃日欄位，如無上市上櫃日欄位，改抓發行日欄位
										    isNull(m.dissue_w,
										            ' ')      
											IPODate				,
											d.mdcost1				settlementPrice2,
--					  2016-0826 will 2016-0826 來信說->新增BBGTicker : 彭博代碼;國內：ProductID + " TT Equity";國外：Bloomberg Ticker
											d.ifdID    				BBGTicker ,
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
											case 
											when d.icurid = 'TWD'
											then  'NTD'
											else   d.icurid
											end	
										                 settlementCurrency 
								  From    
											 dbo.fn_dfd					    D           --庫存
--					  2016-0909 will 2016-0908 來信說->--將equityPrice填入原幣價格，另新增欄位43.settlementCurrency
											 left join		isdbtgl.dbo.fn_fd_pnav P on p.ifdID = d.ifdID and p.ddate_W = d.ddate_w
											 left join 
											 ( Select    t1.ifund, t1.ifdID,t1.AccountType,t1.icurid, Sum(isnull(ts_qty,0)) TYSellq
											 	From      dbo.fn_fd_sell t1
												where    dtrans_W          <= @i_ddate_w
												and        substring(dtrans_w ,1,4)   =  substring(@i_ddate_w,1,4)												
												
												Group By t1.ifund, t1.ifdID,t1.AccountType, t1.icurid
											 ) T           on T.ifund = D.ifund and T.ifdID = D.ifdID and T.AccountType = D.Accounttype and T.icurid = D.iCurid
											 left join 
											 ( Select    t1.ifund, t1.ifdID,t1.AccountType,t1.icurid, Sum(isnull(mprft,0)) TYSellmprft
											    From     dbo.fn_dfd t1
												where   ddate_w          <= @i_ddate_w												
												and        substring(ddate_w ,1,4)   =  substring(@i_ddate_w,1,4)
												Group By t1.ifund, t1.ifdID,t1.AccountType, t1.icurid
											 ) D1           on D1.ifund = D.ifund and D1.ifdID = D.ifdID and D1.AccountType = D.Accounttype and D1.icurid = D.iCurid
											 left join dbo.fn_fd_data				M   		
															  on      m.ifdID =   D.ifdID And    isNull(m.duse_w,0) <=  @i_ddate_w  And      isNull(m.dexpire_w,99999999)       >=  @i_ddate_w
											 left join (SELECT istkID
																	  ,GICS_SECTOR_NAME
																   	  ,GICS_INDUSTRY_GROUP_NAME
																	  ,max(ddate_w) ddate_w
														   FROM    isdbTGL.dbo.fn_stk_data_mapping
														   where   ddate_w <= @i_ddate_W
														   group by istkID,GICS_SECTOR_NAME,GICS_INDUSTRY_GROUP_NAME ) mp on mp.istkID = m.ifdID ,
											 dbo.cm_fund_data				cm
								Where    D.ddate_w             =  @i_ddate_w
								  And      D.ifund                 =  @i_ifund
								  
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

			 exec		    dbo.Up_RMD_Dfd_D @i_ddate_w,@i_ifund,@o_Errcode,@o_Sqlerrm ;
--	Step0.1 讀取& Insert 資料
			 Open Data_Cur
			 while (@@error = 0)			 
				begin
				
					fetch next from Data_Cur into 
							@ddate_w,
							@ifund,
							@ifdID,
							@AccountType,
							--@icountry,
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
							    Set  @settlementPrice2 = NULL



							End	

							
							--If  isnull(@numberOfShares,0) <> 0  then
							
							insert into dbo.TAB_RMD_Dfd
						   (
						    ddate_w,
							ifund,
							ifdID,
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
							@ifdID,
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
							isNull(@ProductType,''),
							isNull(@Product,''),
							@ProductDetail,
							@Portfolio,
							@Strategy,
							isNull(@StrategyDetail,''),
							@Continent,
							@Region,
							@IssuerClass,
							@Sector,
							@IssuerRating,
							@AccountingClass,
							@Accounting,
							@Benchmark,
							isNull(@positionName,''),
							@equityName,
							@numberOfShares,
							@beta,
							@dividendYield,
							@equityPrice,
							@settlementDate,
							@settlementPrice,
							isNull(@equityCurrency,''),
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
			 set @o_TCnt					= dbo.Uf_RMD_Dfd_IfExist
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


