USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_MSRprt_Add_Rcode09_1]    Script Date: 2017/2/9 �W�� 11:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








-----------------------------------------------------------------------------------------------------
--�t�Τ����@�@: ��(�~)��
--�t�ΦW��      : UP_MSRprt_Add_Rcode09_1
--�{���ʽ�@�@: �Ƶ{��
--�{���\��@�@: ����Rcode 09 ���
--�ϥΨ��ɮס@: dbo.Tab_PRt_MSReport
--�ϥΨ�Ƶ{��: 
--�{�����g��   : Yvonne Chen
--���g���      : 2016-0105
--�ק���      : 2016-0106  
--					  2016-0320 Yvonne �̾�Alice �H��--> Purchase_Date ���w��X�겣�������ʶR��, ��l�겣�O�����i�ť�. 
/*
--MSReport09 	01 	���               	  	                             	
--MSReport09 	03 	�Ѳ�               	  �Ѳ�(�tETF/REIT/�L����/�Ч�)
--MSReport09 	04 	�Ũ�(�t���c���ӫ~) �Ũ�(�t���c���ӫ~)           	
*/
--					  Yvonne 2016-0328 For Sarah 	 ClassITemX show fn_Stk_data 's FType information
--					  Yvonne 2016-0329 For Sarah 	 �̾�Sarah �H�� ��9�W�ɥ���Ainclude �R��B�ӾP�M�W��
--				      Yvonne 2016-0407 �ǤJ�ϥΪ�(���user, �DTgl_Admin)
--					  Yvonne 2016-0414 Add for Sarah  �R��u����X�����B�A�R�i���ť� ; ��L�Ҭ��ť�
--					  Yvonne 2016-0414 Add for Sarah  ���
--					  Yvonne 2016-0415 Add for Sarah  �{���Ѯ�
--					  Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
--					  Yvonne 2016-0606 Add �ѧQ PayDate  �ק�ӷ�
--					  Yvonne 2016-0606 Add SETTLE Date  
--					  Yvonne 2016-0726 Add �{���ѧQ�n�W�[ AccountType ����
--					  Yvonne 2016-0906 �q�ܷ��q, �ק�Asset_Class �PIAD_���x�@�P
--					  Yvonne 2016-0906 Add for Sarah ���Ū���覡�ק�!!!!
--					  Yvonne 2016-1114 Update for �ݨD 1051207-30 �n�H�����Ū�� �W���d���!!!
--					  Yvonne 2017-0105 Add ��~���
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
			  set		   @i_Dealdt_Str		= 20151231
			  set		   @i_Basedt			= 20161231
			  set		   @i_CurRatedt		= 20161231
			  set		   @i_ifund				= '1AK'
			  set		   @i_RLine				= '01'

			exec dbo.UP_MSRprt_Add_Rcode09_1
			  @i_Dealdt		   ,
              @i_Dealdt_str	   ,
			  @i_Basedt          ,--�i����= @Trandt �e���u�@��
			  @i_CurRatedt     ,--�i����= i_Trandt �e���u�@��
			  @i_ifund		       ,--��StType
			  @i_RLine            ,--���w���@�ؤU�� (�i��Null or '00', ������)
			  @i_UserId		   ,
			   @o_TCnt			   output ,
			  @o_ErrCode       output ,
			  @o_SqlErrm       output 

			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  

End		  ;
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
where   rcode='MSReport09_1'

*/
/*
--  �����͵���
SELECT DISTINCT A.ISTKID, A.ddate_w ,a.accounttype --a.dsato_w --.*
FROM	DBO.FN_STK_TRADE A
WHERE	A.ifund = '1AK'
AND     A.DDATE_W BETWEEN 20160101 AND 20160131
AND     A.ftrade = 'S'
*/
ALTER Procedure [dbo].[UP_MSRprt_Add_Rcode09_1]
			( @i_Dealdt		   As	    Varchar(8)	                            ,
              @i_Dealdt_str	   As     Varchar(8)	                            ,
			  @i_Basedt          As     Varchar(8)                                ,--�i����= @Trandt �e���u�@��
			  @i_CurRatedt     As     Varchar(8)                                ,--�i����= i_Trandt �e���u�@��
			  @i_ifund		       As     Varchar(20)                              ,--��StType
			  @i_RLine            As     Varchar(20)                              ,--���w���@�ؤU�� (�i��Null or '00', ������)
			  @i_UserId          As     Varchar(20)                              ,--�ϥΪ�
			  @o_TCnt            As      int					OUTPUT									,			  
			  @o_ErrCode       As      int					OUTPUT									,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As
--           �ŧi
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

			 declare @Maturity_Date  as    Varchar(8)								    ;
			 declare @Purchase_Date
												 as    Varchar(8)								    ;
			 declare @Sale_Date		 as    Varchar(8)								    ;
			 declare @issue_date		 as    Varchar(8)								    ;

			 declare @PAR_VALUE		 as    numeric(30,8)							;
			 declare @ORIGINAL_COST
												 as    numeric(30,8)							;
			 declare @BOOK_VALUE  as    numeric(30,8)							;
			 declare @BOOK_VALUE_AT_SALE
												 as    numeric(30,8)							;
			 declare @TOTAL_AMOUNT
												 as    numeric(30,8)							;
			 declare @MARKET_VALUE
											     as    numeric(30,8)							;
			 declare @REALIZED_GL	 as    numeric(30,8)							;
			 declare @UNREALIZED_GL
												 as    numeric(30,8)							;
			 declare @zothchgBuy		 as    numeric(30,8)							;						 			 
			 declare @Quantity_Units as    numeric(30,8)							;
			 
			 declare @PortFolio		     as    Varchar(100)								;
			 declare @Oracle_Class	 as    Varchar(100)								;
			 declare @Asset_Class	 as    Varchar(100)								;

			 declare @Td_price_DT    as    Varchar(8)								    ;
			 declare @Td_price          as    numeric(12,6)							;
			 declare @Couponrate		 as     numeric(12,6)                          ;
			 declare @u_Date        	 as     datetime									;
			 declare @userid         	 as     varchar(20)								;


			 
--           �ŧi			  
             Declare    Data_03_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport09_1'		   Rcode        ,
			      '03'                            RLine         ,
                  --ROW_NUMBER() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --DENSE_RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID				 
                 '�ꤺ�Ѳ�'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  t.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
							--			  m.nCstk                    iFund_C                     ,--Profolio����W��    --(cm_Fund_Data.NC) <--�o���٨S���쥿�T�ӷ�
--Yvonne 2016-0318 Add 
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
										  m.Classcod                                          ,                      --(fn_dstk.Calsscod)
										  t.AccountType                                        ,--�|�p����(ClassITem) --(fn_dstk.AccountType)                  
--Yvonne 2016-0328 Add for Sarah	Transaction_Type
										  t.Transaction_Type  ,
										  m.istkID                     Security_Name          ,--�Ѳ��N�X            --(fn_dstk.istkID) 
										  m.nCstk                      Security_Description   ,--�Ҩ餤��W��        --(fn_stk_Data.nCstk)
										  t.Quantity_Units         ,    
--2016-0320 Yvonne �̾�Alice �H��--> Purchase_Date ���w��X�겣�������ʶR��, ��l�겣�O�����i�ť�. 
										  '' 	Purchase_Date     ,
--										  t.Purchase_Date         ,
--Yvonne 2016-0328 Add for Sarah   
										  t.trade_Date              ,
--Yvonne 2016-0606 Add for Sarah ����אּSettle Date
										  t.Sale_Date                Settle_Date              ,
--Yvonne 2016-0328 Add for Sarah	Pay_Date
										  t.Pay_Date                 ,										  
--Yvonne 2016-0414 Add for Sarah  �R��u����X�����B�A�R�i���ť� ; ��L�Ҭ��ť�
										  "BOOK_VALUE_AT_SALE" =										  
										  case 
											when t.Transaction_Type ='S'
											then  t.BOOK_VALUE_AT_SALE 					
											else  Null										
											end															,						     

--										  t.BOOK_VALUE_AT_SALE,
										  t.TOTAL_AMOUNT		 ,
--Yvonne 2016-0414 Add for Sarah  �R��u����X�����B�A�R�i���ť� ; ��L�Ҭ��ť�
										  "REALIZED_GL" =
										  case 
										    when t.Transaction_Type ='S' 
											then
													case
													when IsNull(BOOK_VALUE_AT_SALE,0)*IsNull(TOTAL_AMOUNT,0) =0 
													then  0 					
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

																												   --�򥻤W�O ���O_KHL/TGL-AccountType
																												   --���O:    NTD->T , Else  icurID 
																												   --�겣�O:  KH-> KHL ; TG-> TGL
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
										  --''                                 ClassItemX             ,                      --�o��n�����ݭn�F 
										  t.istkID+ '-' +t.accountType
																			 FundCod_Deal           ,                      --����s��(�Ѳ��S���o��)                       
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
											--Yvonne 2016-0906 �q�ܷ��q, �ק�Asset_Class �PIAD_���x�@�P										
										case 											
											when  M.ftype  in ('15')
											then	'FIXED INCOME'
											else  'EQUITY'
											end
																						    Asset_Class
--											'EQUITY'                                    Asset_Class,
																								 

								  From    dbo.fn_stk_data				M,			  --�򥻸��
											 (	
--Yvonne 2016-0329 �ӷ���������ɪ���X�F, Add �R�i, ����,�{�W
--From (1) fn_stk_trade
--Yvonne 2016-0318 ��X�������w�s�ɪ����											 
--Yvonne 2016-0321 �Ȯw�s�ɨS������, �ҥH���left join
											 
											 Select   t1.ifund, t1.IstkID,t1.AccountType,t1.Ftrade Transaction_Type,t1.ddate_W Trade_Date, t1.dsato_w Sale_Date, t1.dpay_w Pay_Date,t1.icurid, sum(t1.qstks) Quantity_Units, --sum(isnull(td.mscost,0)) BOOK_VALUE_AT_SALE,
														isnull(td.mscost,0) BOOK_VALUE_AT_SALE,
														sum(t1.msum) TOTAL_AMOUNT
											  From  dbo.fn_stk_trade  t1
											  left join   dbo.fn_dstk td on     td.ddate_w            = t1.ddate_w
																			    and    td.ifund                 = t1.ifund
											                                    and    td.istkID               = t1.istkid
											                                    and    td.AccountType     = t1.AccountType
											                                    and    td.icurid                = t1.icurid		
											  where t1.ddate_w          <= @i_Dealdt
											  And    t1.ddate_w           >   @i_Dealdt_Str
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
											  And    t1.icurid                 ='TWD'

--Yvonne 2016-0329 For Sarah  
											  --And    t1.Ftrade				=  'S'
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IstkID,t1.AccountType,t1.Ftrade,t1.ddate_W, t1.dsato_w,t1.dPay_w,isnull(td.mscost,0),T1.ICURID
											 /*									
											  Select   t1.ifund, t1.IstkID,t1.AccountType,t1.ddate_W Purchase_Date, t1.dsato_w Sale_Date, t1.icurid, sum(t1.qstks) Quantity_Units, sum(t1.mscost) BOOK_VALUE_AT_SALE, sum(t1.msum) TOTAL_AMOUNT
											  From  dbo.fn_stk_trade t1
											  where ddate_w          <= @i_Dealdt
											  And    ddate_w           >   @i_Dealdt_Str
											  And    Ftrade				=  'S'
											  
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															ifund                 =  @i_ifund) 	
														 )											  											 
											  Group By t1.ifund, t1.IstkID,t1.AccountType,t1.ddate_W, t1.dsato_w, t1.icurid
											  */
--From (2) fn_stk_set �ӾP
											Union all
											Select   t1.ifund, t1.IstkID,t1.AccountType,'�ӾP' Transaction_Type,t1.ddate_W Trade_Date, t1.dsato_w Sale_Date, t1.dpay_w Pay_Date,t1.icurid, 
													    sum(t1.qstks) Quantity_Units, 
														0 BOOK_VALUE_AT_SALE,
														sum(t1.msum) TOTAL_AMOUNT
											  From  dbo.fn_stk_set  t1											  
											  where t1.ddate_w          <= @i_Dealdt
											  And    t1.ddate_w           >   @i_Dealdt_Str
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
											  And    t1.icurid                 ='TWD'
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IstkID,t1.AccountType,t1.ddate_W, t1.dsato_w,t1.dPay_w,T1.ICURID
--From (3) fn_stk_right �{�W
											Union all
											Select   t1.ifund, t1.IstkID,t1.AccountType,'�{�W' Transaction_Type,t1.ddate_W Trade_Date, t1.dsato_w Sale_Date, t1.dpay_w Pay_Date,t1.icurid, 
													    sum(t1.qstks) Quantity_Units, 
														0 BOOK_VALUE_AT_SALE,
														sum(t1.msum) TOTAL_AMOUNT
											  From  dbo.fn_stk_right  t1											  
											  where t1.ddate_w          <= @i_Dealdt
											  And    t1.ddate_w           >   @i_Dealdt_Str
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
											  And    t1.icurid                 ='TWD'
											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IstkID,t1.AccountType,t1.ddate_W, t1.dsato_w,t1.dPay_w,T1.ICURID
--From (4) fn_stk_reduce ���
										     Union all
											select a.ifund,a.istkID,a.accountType,'���' Transaction_Type, a.ddate_W Trade_Date, 
--Yvonne 2016-0606 Sarah �ѧQ's Settle Date �P Pay Date
														 gc.ddate_W Sale_Date,
													     --g.ddate_W Sale_Date,
														 gc.ddate_W Pay_Date,c.icurid icurid,
														 a.qstks                   Quantity_Units, --as '�����Ѽ�',  
														 0 BOOK_VALUE_AT_SALE,				 
														 --(case isnull(g.ddate_W, '') when '' then a.msum else g.mcash end) as Total_Amount
														 (case isnull(gc.ddate_W, '') when '' then a.mcash else gc.mcash end) as Total_Amount
												from isdbtgl.dbo.fn_stk_reduce a 
																				inner join	cm_fund_data b on a.ifund = b.ifund 
																				inner join	fn_stk_data c on a.istkID = c.istkID and a.ddate_w between c.duse_w and c.dexpire_w 
																				left join fn_dstk e on a.ifund = e.ifund and a.istkID = e.istkID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w) and a.icountry = e.icountry and a.AccountType = e.AccountType 
																				--					  Yvonne 2016-0726 Add �{���ѧQ�n�W�[ AccountType ����--Yvonne 2016-0906 fget = '1' ���{���ѧQ���
																				left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.AccountType =a.AccountType and gc.ddate_w >=a.ddate_w and gc.fget = '2' and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																				
												where 1 = 1 
												and		b.level = 2 												
												and		a.ddate_w          <= @i_Dealdt
											    and       a.ddate_w           >   @i_Dealdt_Str
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD) 
  											  And         isnull(a.icurid,'TWD')                 ='TWD'
											     And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															 a.ifund                 =  @i_ifund) 	
														   )											  											 						
--											Select   t1.ifund, t1.IstkID,t1.AccountType,'���' Transaction_Type,t1.ddate_W Trade_Date, t1.dsato_w Sale_Date, t1.dpay_w Pay_Date,'TWD' as icurid, 
--													    sum(t1.qstks) Quantity_Units, 
--														0 BOOK_VALUE_AT_SALE,
--														sum(t1.mcash) TOTAL_AMOUNT
--											  From  dbo.fn_stk_reduce t1											  
--											  where t1.ddate_w          <= @i_Dealdt
--											  And    t1.ddate_w           >   @i_Dealdt_Str
----Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD) but ���ɨS�����O��
--											  --And    t1.icurid                 ='TWD'
--											  And    ( (@i_ifund				  = '00')
--															or
--														  (@i_ifund				  <>  '00'
--														    And 
--															t1.ifund               =  @i_ifund) 	
--														 )											  											 												
--											  Group By t1.ifund, t1.IstkID,t1.AccountType,t1.ddate_W, t1.dsato_w,t1.dPay_w--,T1.ICURID
											  
--From (5)	fn_stk_cash �{���ѧQ & fn_stk_getch(�o��)
											 Union all
											select a.ifund,a.istkID,a.accountType,'�{���ѧQ' Transaction_Type, a.ddate_W Trade_Date, 
--Yvonne 2016-0606 Sarah �ѧQ's Settle Date �P Pay Date
														 gc.ddate_W Sale_Date,
													     --g.ddate_W Sale_Date,
														 gc.ddate_W Pay_Date,c.icurid icurid,
														 isnull(e.qshare , 0) Quantity_Units, --as '�����Ѽ�',  
														 0 BOOK_VALUE_AT_SALE,				 
														 --(case isnull(g.ddate_W, '') when '' then a.msum else g.mcash end) as Total_Amount
														 (case isnull(gc.ddate_W, '') when '' then a.msum else gc.mcash end) as Total_Amount
												from fn_stk_cash a 
																				inner join	cm_fund_data b on a.ifund = b.ifund 
																				inner join	fn_stk_data c on a.istkID = c.istkID and a.ddate_w between c.duse_w and c.dexpire_w 
																				left join fn_dstk e on a.ifund = e.ifund and a.istkID = e.istkID and e.ddate_w = dbo.F_Q_DateAfterType_w('A' , 0 , 0 , -1 , a.ddate_w) and a.icountry = e.icountry and a.AccountType = e.AccountType 
																				--					  Yvonne 2016-0726 Add �{���ѧQ�n�W�[ AccountType ����--Yvonne 2016-0906 fget = '1' ���{���ѧQ���
																				left join fn_Stk_getch gc on gc.istkid = a.istkid and gc.ifund =a.ifund and gc.AccountType =a.AccountType and gc.ddate_w >=a.ddate_w and gc.fget = '1' and gc.ddate_w <=dateadd(M ,6,a.ddate_w)
																				left join fn_stk_cash f on a.cur_itdNO = f.itdNO 
																				left join fn_stk_getch g on a.itdno = g.itdno
												where 1 = 1 
												and		b.level = 2 
												and		(isnull(a.perint, 0) <> 0 or isnull(a.cur_itdno, '') <> '') 
												and		a.ddate_w          <= @i_Dealdt
											    and        a.ddate_w           >   @i_Dealdt_Str
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD) 
  											  And    a.icurid                 ='TWD'
											     And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															 a.ifund                 =  @i_ifund) 	
														   )											  											 												
											  )											T
								Where    @i_RLine              in('00','03')								  
								  And      m.istkID              =   T.istkID								  
--Yvonne 2016-1114 Update for �ݨD 1051114-XX �n�H�����Ū�� �W���d���!!!
								  And      m.duse_w           <=  T.Trade_Date--@i_Dealdt 
								  And      m.dexpire_w       >=  T.Trade_Date--@i_Dealdt
								  
								  )														Z
		  Where(Quantity_Units               <> 0 )                 
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
		  ;		  

		  Declare    Data_01_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport09_1'		   Rcode        ,
			      '01'                            RLine         ,
                  --ROW_NUMBER() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID
				  --DENSE_RANK() OVER(ORDER BY rcode,rline,rlname) AS ROWID				 
                 '�ꤺ���'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  t.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
							--			  m.nCstk                    iFund_C                     ,--Profolio����W��    --(cm_Fund_Data.NC) <--�o���٨S���쥿�T�ӷ�
--Yvonne 2016-0318 Add 
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
										  m.Classcod                                          ,                      --(fn_dstk.Calsscod)
										  t.AccountType                                        ,--�|�p����(ClassITem) --(fn_dstk.AccountType)                  
--Yvonne 2016-0328 Add for Sarah	Transaction_Type
										  t.Transaction_Type  ,
										  m.ifdID                     Security_Name          ,--�Ѳ��N�X            --(fn_dstk.ifdID) 
										  m.ifdname                 Security_Description   ,--�Ҩ餤��W��        --(fn_stk_Data.nCstk)
										  t.Quantity_Units         ,    
--2016-0320 Yvonne �̾�Alice �H��--> Purchase_Date ���w��X�겣�������ʶR��, ��l�겣�O�����i�ť�. 
										  '' 	Purchase_Date     ,
--										  t.Purchase_Date         ,
--Yvonne 2016-0328 Add for Sarah   
										  t.trade_Date              ,
--Yvonne 2016-0606 Add for Sarah ����אּSettle Date
										  t.Sale_Date                Settle_Date              ,
--Yvonne 2016-0328 Add for Sarah	Pay_Date
										  t.Pay_Date                 ,										  
--Yvonne 2016-0414 Add for Sarah  �R��u����X�����B�A�R�i���ť� ; ��L�Ҭ��ť�
										  "BOOK_VALUE_AT_SALE" =										  
										  case 
											when t.Transaction_Type ='S'
											then  t.BOOK_VALUE_AT_SALE 					
											else  Null										
											end															,						     

--										  t.BOOK_VALUE_AT_SALE,
										  t.TOTAL_AMOUNT		 ,
--Yvonne 2016-0414 Add for Sarah  �R��u����X�����B�A�R�i���ť� ; ��L�Ҭ��ť�
										  "REALIZED_GL" =
										  case 
										    when t.Transaction_Type ='S' 
											then
													case
													when IsNull(BOOK_VALUE_AT_SALE,0)*IsNull(TOTAL_AMOUNT,0) =0 
													then  0 					
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

																												   --�򥻤W�O ���O_KHL/TGL-AccountType
																												   --���O:    NTD->T , Else  icurID 
																												   --�겣�O:  KH-> KHL ; TG-> TGL
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
										  --''                                 ClassItemX             ,                      --�o��n�����ݭn�F 
										  t.ifdID+ '-' +t.accountType
																			 FundCod_Deal           ,                      --����s��(�Ѳ��S���o��)                       
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
											--Yvonne 2017-0105 �H�U�n�A��Sarah �T�{
										case 											
											when  M.fkind  in ('15')
											then	'FIXED INCOME'
											else  'EQUITY'
											end
																						    Asset_Class
																								 

								  From    dbo.fn_fd_data				M,			  --�򥻸��
											 (	

--From (1.1) fn_fd_sell											 
											 Select   t1.ifund, t1.ifdID,t1.AccountType, 'B' Transaction_Type,t1.dtrans_W Trade_Date, t1.dPay_w Sale_Date, t1.dpay_w Pay_Date,t1.icurid, sum(t1.tb_qty) Quantity_Units,
														0                         BOOK_VALUE_AT_SALE,
														sum(t1.tb_msum) TOTAL_AMOUNT
											  From  dbo.fn_fd_buy  t1
											  left join   dbo.fn_dfd  td on     td.ddate_w            = t1.dTrans_w
																			    and    td.ifund                 = t1.ifund
											                                    and    td.ifdID               = t1.ifdid
											                                    and    td.AccountType     = t1.AccountType
											                                    and    td.icurid                = t1.icurid		
											  where t1.dtrans_w          <= @i_Dealdt
											  And    t1.dtrans_w           >   @i_Dealdt_Str
											  And    t1.icurid                 ='TWD'

											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IfdID,t1.AccountType,t1.dtrans_w, t1.dpay_w,t1.dPay_w,isnull(td.mscost,0),T1.ICURID											 
											 Union all
--From (1.2) fn_fd_sell											 
											 Select   t1.ifund, t1.ifdID,t1.AccountType, 'S' Transaction_Type,t1.dtrans_W Trade_Date, t1.dPay_w Sale_Date, t1.dpay_w Pay_Date,t1.icurid, sum(t1.ts_qty) Quantity_Units, --sum(isnull(td.mscost,0)) BOOK_VALUE_AT_SALE,
														isnull(td.mscost,0) BOOK_VALUE_AT_SALE,
														sum(t1.ts_msum) TOTAL_AMOUNT
											  From  dbo.fn_fd_sell  t1
											  left join   dbo.fn_dfd  td on     td.ddate_w            = t1.dTrans_w
																			    and    td.ifund                 = t1.ifund
											                                    and    td.ifdID               = t1.ifdid
											                                    and    td.AccountType     = t1.AccountType
											                                    and    td.icurid                = t1.icurid		
											  where t1.dtrans_w          <= @i_Dealdt
											  And    t1.dtrans_w           >   @i_Dealdt_Str
											  And    t1.icurid                 ='TWD'

											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IfdID,t1.AccountType,t1.dtrans_w, t1.dpay_w,t1.dPay_w,isnull(td.mscost,0),T1.ICURID											 
											
--From (2)	fn_fd_getch(����t��)
											 Union all
											Select   t1.ifund, t1.ifdID,t1.AccountType, '����t��' Transaction_Type,t1.ddate_w Trade_Date, t1.Iaccdate_w Sale_Date, t1.Iaccdate_w Pay_Date,t1.icurid, 0 Quantity_Units,
														0                         BOOK_VALUE_AT_SALE,
														sum(t1.msum) TOTAL_AMOUNT
											  From  dbo.fn_fd_getch  t1
											  
											  where t1.ddate_w          <= @i_Dealdt
											  And    t1.ddate_w           >   @i_Dealdt_Str
											  And    t1.icurid                 ='TWD'

											  And    ( (@i_ifund				  = '00')
															or
														  (@i_ifund				  <>  '00'
														    And 
															t1.ifund                 =  @i_ifund) 	
														 )											  											 												
											  Group By t1.ifund, t1.IfdID,t1.ddate_W,t1.AccountType,t1.Iaccdate_w,T1.ICURID
											  )											T
								Where    @i_RLine              in('00','01')								  
								  And      m.ifdID              =   T.ifdID								  
--Yvonne 2016-1114 Update for �ݨD 1051114-XX �n�H�����Ū�� �W���d���!!!
								  And      m.duse_w           <=  T.Trade_Date--@i_Dealdt 
								  And      m.dexpire_w       >=  T.Trade_Date--@i_Dealdt
								  
								  )														Z
		  Where(Quantity_Units               <> 0 )                 
           Order By
                 ifund,Classcod,Oracle_Class, Portfolio,ClassItemX, Security_Name
		  ;	

			  
BEGIN	Try
--	Step0.0		 ��l��
			 set			@o_Sqlerrm															= ' '
			 set			@o_ErrCode															= 0
			 set			@o_TCnt																= 0
			 set		    @u_Date																= SYSDATETIME()			  
			 set		    @Userid																	=  isnull(@i_UserId,User)				 			 
			 set			@Dealdt																	= @i_Dealdt
			 set			@Dealdt_Str															= isnull(@i_Dealdt_Str,floor((@Dealdt/100)*100+01))
			 set			@icurid																	= 'TWD'

                    /*If      Syn_QQS�`�Τ@������_Khl2.F_Is_WorkDay(v_Dealdt_Str) = 1
                    Then    v_WorkDt_Str                            := v_Dealdt_Str                ;
                    Else    v_WorkDt_Str                            := Syn_StcDate_Work_Khl1.uf_add_workday(v_Dealdt_Str,-1)
                                                                                                   ;--(�t)�_�l�骺�Ĥ@�Ӥu�@��
                    End     If                                                                     ;
                    If      Syn_QQS�`�Τ@������_Khl2.F_Is_WorkDay(v_Dealdt) = 1
                    Then    v_WorkDt_End                            := v_Dealdt                    ;
                    Else    v_WorkDt_End                            := Syn_StcDate_Work_Khl1.uf_add_workday(v_Dealdt,-1)
                                                                                                   ;--(�t)�_�l�骺�Ĥ@�Ӥu�@��
                    End     If                                                                     ;
                    */
			 
			 If				@i_RLine  In  ('00','01')	
						   goto        Data_Rline_01
			 else		   goto		 Data_RLine_02			 
			 Data_Rline_01:			  
			 --	Step1.1 �R��
			 set			@Rcode																    = 'MSReport09_1'
			 set			@Rline																	= '01'
			 set			@zothchgBuy															= 0
			 set			@RLineSno															    = 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
			 
			--	Step1.2 Ū��& Insert ���
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
							@Transaction_Type		 , --Yvonne 2016-0329 for Sarah Add
							@FundCod                  ,
							@FUNDNAME				 ,							
							@Quantity_Units         ,    
							@Purchase_Date         ,   
							@Trade_Date              ,
							@Settle_Date              ,--Yvonne 2016-0606 for Sarah Add ���쥻�Oshow Sale Date
							--@Sale_Date                ,
							@Pay_Date				 ,
							@BOOK_VALUE_AT_SALE,
							@TOTAL_AMOUNT		 ,
							@REALIZED_GL			 ,							
							@Portfolio                   ,
							@ClassItemX              ,
							@FundCod_Deal          ,
							@Oracle_Class			 ,
							@Asset_Class
																				
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
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
                            Purchase_Date,
							Trade_Date,
                            --Sale_Date,
							Settle_Date,--Yvonne 2016-0606 for Sarah Add ���쥻�Oshow Sale Date
							Pay_Date,
                            BOOK_VALUE_AT_SALE,
                            TOTAL_AMOUNT,
                            REALIZED_GL,
                            --zothchgBuy,
							STTYPEXCHIN,
							ClassItemX,
							Portfolio	,
							Oracle_Class,
							Asset_Class			  
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
                            @Purchase_Date,
							@Trade_Date,
                            --@Sale_Date,
							--Yvonne 2016-0606 for Sarah Add ���쥻�Oshow Sale Date
							@Settle_Date,
							@Pay_Date,
                            @BOOK_VALUE_AT_SALE,
                            @TOTAL_AMOUNT,
                            @REALIZED_GL,
                            --@zothchgBuy,
							@iFund_C,
							@ClassItemX,
							@Portfolio,
							@Oracle_Class,
							@Asset_Class	
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
--	Step3.1 �R��
			 set			@Rcode																    = 'MSReport09_1'
			 set			@Rline																	= '03'
			 set			@zothchgBuy															= 0
			 set			@RLineSno															    = 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
			 
--	Step3.2 Ū��& Insert ���
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
							@Transaction_Type		 , --Yvonne 2016-0329 for Sarah Add
							@FundCod                  ,
							@FUNDNAME				 ,							
							@Quantity_Units         ,    
							@Purchase_Date         ,   
							@Trade_Date              ,
							@Settle_Date              ,--Yvonne 2016-0606 for Sarah Add ���쥻�Oshow Sale Date
							--@Sale_Date                ,
							@Pay_Date				 ,
							@BOOK_VALUE_AT_SALE,
							@TOTAL_AMOUNT		 ,
							@REALIZED_GL			 ,							
							@Portfolio                   ,
							@ClassItemX              ,
							@FundCod_Deal          ,
							@Oracle_Class			 ,
							@Asset_Class
																				
					if (@@fetch_status <> 0)
						break
							Set			@RLineSno  = @RLineSno + 1
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
                            Purchase_Date,
							Trade_Date,
                            --Sale_Date,
							Settle_Date,--Yvonne 2016-0606 for Sarah Add ���쥻�Oshow Sale Date
							Pay_Date,
                            BOOK_VALUE_AT_SALE,
                            TOTAL_AMOUNT,
                            REALIZED_GL,
                            --zothchgBuy,
							STTYPEXCHIN,
							ClassItemX,
							Portfolio	,
							Oracle_Class,
							Asset_Class			  
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
                            @Purchase_Date,
							@Trade_Date,
                            --@Sale_Date,
							--Yvonne 2016-0606 for Sarah Add ���쥻�Oshow Sale Date
							@Settle_Date,
							@Pay_Date,
                            @BOOK_VALUE_AT_SALE,
                            @TOTAL_AMOUNT,
                            @REALIZED_GL,
                            --@zothchgBuy,
							@iFund_C,
							@ClassItemX,
							@Portfolio,
							@Oracle_Class,
							@Asset_Class	
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
																					@i_ifund		,--��StType
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


