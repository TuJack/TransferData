USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_RMD_Dstk_Add]    Script Date: 2017/2/9 �W�� 11:49:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















-----------------------------------------------------------------------------------------------------
--�t�Τ����@�@: TGL ���t��---RMD-�ꤺ�~�Ѳ�-�������R���Raw Data(�ۥN��)
--�t�ΦW��      : Up_RMD_Dstk_D
--�{���ʽ�@�@: �Ƶ{��
--�{���\��@�@: ����RMD_Dstk ��� : �ꤺ�~�Ѳ�-�������R���Raw Data(�ۥN��)
--�ϥΨ��ɮס@: dbo.Tab_RMD_DStk
--�ϥΨ�Ƶ{��: 
--�{�����g��   : Yvonne Chen
--���g���      : 2016-0616
--�ק���      : 2016-0617
--					  �H��: fn_invest_credit a where ddate_w >= 20160101 where classcod = 'ISSUER'
--					  �o�椽�q: issuer a where ddate_w >= 20160101 where classcod = 'ISSUER'
--					  2016-0729 will 2016-0728 �ӫH��->3.	�վ�settlementPrice���ȳW�h�p�U �]�[�v�����P�u��ڡv�[�v�������p���I��t�A�G�վ�W�欰��J���ɮw�s���`����
--					  2016-0805 will 2016-0804 �ӫH��->1.	�վ�equityPrice ��ƪ��צp�U�g�d�Ч�Υ��W���d�Ѳ��t�ίd�s�����T�ܤp���I��6��A�G�վ�p���I���� (12, 5) --> (15, 8)
--					  2016-0819 will 2016-0819 �ӫH��->1.	�վ�productID���ȳW�h��ἴ��~�Ѳ�����ɡA�ѭ����Bloomberg Ticker�ＴISIN
--																		2.	�]�t�X0811�{�����u�����Ҩ�l�����޿�k�v�s�W���41.settlementPrice2(�t���`����)
--																			��0816���|ĳ�O��(�Ԫ���1)�AIMD�N�ӽж}�o�|�p�����U���v�ɪѲ��t�������A�ݦ����}�o������A�A�бz��U�����t��������T��J����C
--					  2016-0826 will 2016-0826 �ӫH��->�s�WBBGTicker : �^�եN�X;�ꤺ�GProductID + " TT Equity";��~�GBloomberg Ticker
--					  2016-0905 will 2016-0902 �ӫH��->--1.	�p�q�ܩҴ��A�����SISIN��ơA�|�ɭPproductID���ŭȤ�equityName�MpositionName�ꤣ��A�G�վ�����޿�p�U( �ýվ�W��holding name -> �����N�X�A�H�Q���򷾳q )�G
																		--2.	�N�ޱb��U���Ѳ����쳣�O�쵲����O�A�Ʊ�������O?
																		--�|�һ����Aifund = 1FUBP�ɡA
																		--positionID = ARM LN�o�ɪѲ�����O���ӬO�۴��K�h(GBp or GBX)�A
																		--positionID = ABBN VX�o�ɪѲ�����O���ӬO��h�k��(GHF)�A�ثe��쪺���OEUR�C
																		--�]���qOracle���IRC�U������r�ɦ��������T�A�ҥH�~�ݰݡC
																		--3.	ProductType���~
																		--�|�һ����APositionID = 000061 CH�ɡA��Oracle Class = CN_Stock�A�]��ProductType���ӵ���CN_Stock�A���ثe��ƬOT_STOCK�C
																		--4.	���P���~�Ѳ����o�@�P�A�վ�ꤺ�Ѳ�Bloomberg Ticker�޿�C
																		--5.	TG����~�Ѳ�����AequityPrice����0 ? �O�_�]�O�]��bloomberg��ƥ���쪺���Y ? 
--					  2016-0909 will 2016-0908 �ӫH��->--�NequityPrice��J�������A�t�s�W���43.settlementCurrency
--					  2016-1116 Yvonne update for �ݨD1051027-63  �t���l�q�ꤺ�۾ޤw�p��
----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go

			  Declare @i_ddate_w		   As	    Varchar(8)	                            ;              
			  Declare @i_ifund		       As     Varchar(20)                           ;			  
			  Declare @o_TCnt			   As     Int											;
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
			  Declare @i_UserId          As     Varchar(20)                           ;--�ϥΪ�
Begin
			  set		   @i_ddate_w			= 20160729			  			  
			  set		   @i_UserId               = 'FAS'										;
			  set		   @i_iFund                 = 'ZFSRD'									;
			  

			exec dbo.UP_RMD_Dstk_Add
			  @i_ddate_w		   ,              
			  @i_ifund		       ,--��StType			  
			  @i_UserId          ,--�ϥΪ�
			   @o_TCnt			   OUTPUT,
			  @o_ErrCode       OUTPUT,
			  @o_SqlErrm       OUTPUT

			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  

End		  ;	
*/
----------------------------------------------------------------------------------------------------
ALTER PRocedure [dbo].[UP_RMD_Dstk_Add]
			( @i_ddate_w		   As	    Varchar(8)	                            ,              			  
			  @i_ifund		       As     Varchar(20)                           ,--��StType			  
			  @i_UserId          As     Varchar(20)                           ,--�ϥΪ�
			  @o_TCnt            As      int					OUTPUT				,
			  @o_ErrCode       As      int					OUTPUT				,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As
--           �ŧi
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
--					  2016-0805 will 2016-0804 �ӫH��->1.	�վ�equityPrice ��ƪ��צp�U�g�d�Ч�Υ��W���d�Ѳ��t�ίd�s�����T�ܤp���I��6��A�G�վ�p���I���� (12, 5) --> (15, 8)
			declare	@equityPrice	as	decimal(15,8)	;
--			declare	@equityPrice	as	decimal(12,5)	;
			declare	@settlementDate	as	varchar(8)	;

--					  2016-0729 will 2016-0728 �ӫH��->3.	�վ�settlementPrice���ȳW�h�p�U �]�[�v�����P�u��ڡv�[�v�������p���I��t�A�G�վ�W�欰��J���ɮw�s���`����			
			declare	@settlementPrice	as	decimal(30,8)	;
			--declare	@settlementPrice	as	decimal(12,6)	;
			declare	@equityCurrency	as	varchar(3)	;
			declare	@ignoreFXRisk	as	varchar(1)	;
			declare	@YTDSoldNumOfShares	as	decimal(20,4)		;
			declare	@YTDRealizedPL	as	decimal(25,5)		;
			declare	@IPODate	as	varchar(8)	;			 	
			declare	@settlementPrice2	as	decimal(30,8)	;
--					  2016-0826 will 2016-0826 �ӫH��->�s�WBBGTicker : �^�եN�X;�ꤺ�GProductID + " TT Equity";��~�GBloomberg Ticker
			declare  @BBGTicker as Varchar(100);
--					  2016-0909 will 2016-0908 �ӫH��->--�NequityPrice��J�������A�t�s�W���43.settlementCurrency
			declare  @settlementCurrency as varchar(3);
			 
--           �ŧi			  
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
											'TGL'				SourceSystem, --�T�w��
											d.istkid          PositionID,

											case 
												when m.ftype = '14' --icountry = 'TW'
												then  d.istkid
												when m.fdis   = '1'
												then  d.istkid
												when m.fdis   = '2'
--					  2016-0819 will 2016-0819 �ӫH��->1.	�վ�productID���ȳW�h��ἴ��~�Ѳ�����ɡA�ѭ����Bloomberg Ticker�ＴISIN
--												then  m.isin
--					  2016-0905 will 2016-0902 �ӫH��->--1.	�p�q�ܩҴ��A�����SISIN��ơA�|�ɭPproductID���ŭȤ�equityName�MpositionName�ꤣ��A�G�վ�����޿�p�U( �ýվ�W��holding name -> �����N�X�A�H�Q���򷾳q )�G
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
											'IMD'				Department,--�T�w��
											Null               Division,--�ȶ�ť�
											Null               Desk,--�ȶ�ť�
											Null               Trader,--�ȶ�ť�
											Null               Account,--�ȶ�ť�
											Null               Market,--�ȶ�ť�
											'EQUITY'        ProductGroup,--�ꤺ�~�Ѳ�����Ҷ�EQUITY�A�����L�����겣�|�t���W��
											
--					  2016-0905 will 2016-0902 �ӫH��->
																		--3.	ProductType���~
																		--�|�һ����APositionID = 000061 CH�ɡA��Oracle Class = CN_Stock�A�]��ProductType���ӵ���CN_Stock�A���ثe��ƬOT_STOCK�C
											 
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
																	 ProductDetail,--�ȶ�ť�

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
												Else  '�L�]�w'
												End
																Strategy,
											
--Yvonne 2016-0627 Update for will 
-->1.	�վ�StrategyDetail�s�X�W�h�p�U								
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
													end									--Will ��:-->> Oracle�t�ΤU����VaR �Ѳ���r�ɦ�����(�H�U�Ѧ� K�t�� )
																							--User���Ѫ�Excel �̥�����Ѧp�U 
                                                                                            --T-:�ꤺ U-:��~
                                                                                            --KHL: �Ϲj�겣
                                                                                            --TRADING: ����ت�
                                                                                            --AFS: �ƨѥX��
                                                                                            --�o�̪�����u������ت��M�ƨѥX��
                                                                                            --Ex: T_STOCK_S_AFS
															         StrategyDetail,    
								*/
										    Null                    Continent,--Will ��:�ȶ�ť�
											Null                    Region,	--Will ��:�ȶ�ť�
											Null                    IssuerClass,--Will ��:�ȶ�ť�
											case 
														when		m.fdis = '1'
														Then     mp.GICS_SECTOR_NAME
														Else		m.GICS_SECTOR_NAME
														End     
											                         Sector,        --����ƨӷ������~�Ѳ��ݨD����No.82
											'NR'                    IssuerRating, --Will ��:��J�T�w��NR
--Yvonne 2016-0627 Update for will 
--											   �վ�AccountingClass ���ȳW�h�p�U�A�W�[�Ϥ����y�P��ظ겣�A�B�ҶqAccounting = COST���ר�											
--												���y�겣�|�p�ت� in ( CASH, AFS, FVPL )�GFV
--												��ظ겣�|�p�ت� in ( CASH, AFS, FVPL )�GFV2
--												���y�겣�|�p�ت� in ( HTM, NACTM, COST )�GAV
--												��ظ겣�|�p�ت� in ( HTM, NACTM, COST )�GAV2
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
												Else  'User �ثe�|�����w'
												End
																	 AccountingClass,
											--d.AccountType    
											case 
												when d.AccountType = ('FVTPL')
												then  'FVPL'   												
												Else  d.AccountType    
												End
											                         Accounting,--Will ��:�ꤺ�Ѳ�Accounting���� FVTPL���Ӧ�FVPL
											m.Benchmark     Benchmark, --�ݰ򥻸�Ʒs�W											
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
											Null                    beta,--Will ��:�ȶ�ť�
											Null                    dividendYield,--Will ��:�ȶ�ť�
--					  2016-0909 will 2016-0908 �ӫH��->--�NequityPrice��J�������A�t�s�W���43.settlementCurrency
--											d.price               
											P.price 
																	 equityPrice,
											Null                    settlementDate,--Will ��:	settlementDate�ȶ�ť�
--					  2016-0729 will 2016-0728 �ӫH��->3.	�վ�settlementPrice���ȳW�h�p�U �]�[�v�����P�u��ڡv�[�v�������p���I��t�A�G�վ�W�欰��J���ɮw�s���`����														
										    d.mcost
											--Case
											--  when d.Qshare = 0                    
											--  then  0
											--  else   round(d.mcost/d.qshare,2)
											--  end
																	  settlementPrice,--Will ��:   �P����TG9919���[�v�������											

--Yvonne 2016-0627 Update for will 
--3.	equityCurrency�Y���x���A�ж�NTD
											case 
											when d.icurid = 'TWD'
											then  'NTD'
--											else   d.icurid 
--					  2016-0905 will 2016-0902 �ӫH��->--2.	�N�ޱb��U���Ѳ����쳣�O�쵲����O�A�Ʊ�������O?
--					  2016-0922 will 2016-0922 �ӫH��-> �t�p��q�ܤ��ҰQ�סATGL�t�Τ� GB"P" or GB"p" �ҫ��j�^��A�ߦ]RMD�ثe�����I�Ȩt��(RM)�u�{�oGB"P"�A��бN����J�u�������R��ơv����equityCurrency�������j�g ! 

											else   upper(m.icurid)
											end
--											d.icurid
											                         equityCurrency,
											Null                    ignoreFXRisk,--Will ��:�ȶ�ť�
											isNull(t.TYSellqStks,0)	 YTDSoldNumOfShares,
											isNull(d1.TYSellmprft,0) YTDRealizedPL,
--Yvonne �ѦҪ�7�@�k 2016-0407 For Sarah     20160401 eMail �վ��7 �Ѳ�����Issue Date����W�h���A��TG0101 �򥻸����쪺�W���W�d�����A�p�L�W���W�d�����A���o������
										    isNull(m.d_agree_w,
										            m.dissue_w)      
											IPODate				,
											d.mdcost1				settlementPrice2,
--					  2016-0826 will 2016-0826 �ӫH��->�s�WBBGTicker : �^�եN�X;�ꤺ�GProductID + " TT Equity";��~�GBloomberg Ticker
											case 																						
											when m.fdis   = '2'
											then  m.blgNo							
											else   d.istkid				
											end				
											  						BBGTicker ,
--					  2016-0909 will 2016-0908 �ӫH��->--�NequityPrice��J�������A�t�s�W���43.settlementCurrency
											case 
											when d.icurid = 'TWD'
											then  'NTD'
											else   d.icurid
											end	
										                 settlementCurrency 
								  From    
											 dbo.fn_dstk					    D           --�w�s
--					  2016-0909 will 2016-0908 �ӫH��->--�NequityPrice��J�������A�t�s�W���43.settlementCurrency
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
											 dbo.fn_stk_data				M   		  --�򥻸��											 											 
--Yvonne 2016-0725 ���@mapping�����令�u���@��ddate_W��� 
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
--Yvonne 2016-0725 ���@mapping�����令�u���@��ddate_W���
						--		  And      isNull(mp.duse_w,0)                       <=  @i_ddate_w 
						--		  And      isNull(mp.dexpire_w,99999999)       >=  @i_ddate_w
								  And      cm.ifund				=   D.ifund
								  And      cm.level			    IN  ('1', '2')
								  And		 IsNull(cm.dbuild_w,0)				<= @i_ddate_w
								  And		 IsNull(cm.dFund_w,99999999)     >    @i_ddate_w								  								  
								  )														Z		  
--Yvonne 2016-0627 Update for will 
--2.	�ư�numberOfShares = 0�����
		   where 	isnull(numberOfShares,0) <> 0		
           Order By
                 ifund,Classcod,Portfolio
		  ;		  

BEGIN		Try
--	Step00		 ��l��
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
--	Step0.1 Ū��& Insert ���
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
-->1.	�վ�StrategyDetail�s�X�W�h�p�U								
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
--equityName	�Ѳ��W��	varchar	24	Yes	"�ꤺ�B(PositionDate-IPODate)>=1year�GCLNT.SYSJ. + ProductID
--�ꤺ�B(PositionDate-IPODate)<1year�GCLNT.TGlobe. + ProductID
								  --Else	 'CLNT.TGlobe.'+ @ProductId
--					  2016-0905 will 2016-0902 �ӫH��->								
--��~�GCLNT.TGlobe. + replace( ProductID ,"" "" ,""_"" )"	"CLNT.SYSJ.2882 CLNT.TGlobe.ARM_LN"
									Else	 'CLNT.TGlobe.'+ Replace(@ProductId,' ','_')									
									End																								
							   Set   @Sector =
								Case
									When  isnull(@Sector,'XX') = 'XX'
									Then   ''
									Else	 @Sector
									End						

--Yvonne 2016-0819 ���t�������i�ӤU��N�n����!!!
--					  2016-1116 Yvonne update for �ݨD1051027-63  �t���l�q�ꤺ�۾ޤw�p��
--					  2016-1118 Yvonne update for �ݨD1051027-63  �t���l�q��~�۾ޤw�p��
--					  2017-0207 Yvonne ���U�ӥN�ޤ]����ƤF, �ҥHsettlementPrice2 �椣�γ]����~~~~
								--Set  @settlementPrice2 =
								-- Case 
								--	When  --@equityCurrency in( 'TWD','NTD') and
								--			  substring(@iFund ,2,1) not in ('D','F')	--�ĤG�X��DF ���N��
								--	Then   @settlementPrice2
								--	Else	  Null
								--	End

--							    Set  @settlementPrice2 = NULL

--Yvonne 2016-0826 will 2016-0826 �ӫH��->�s�WBBGTicker : �^�եN�X;�ꤺ�GProductID + " TT Equity";��~�GBloomberg Ticker

--					  2016-0905 will 2016-0902 �ӫH��->--4.	���P���~�Ѳ����o�@�P�A�վ�ꤺ�Ѳ�Bloomberg Ticker�޿�C
																		--�ꤺ�GProductID + " TT"
																		--��~�GBloomberg Ticker
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


