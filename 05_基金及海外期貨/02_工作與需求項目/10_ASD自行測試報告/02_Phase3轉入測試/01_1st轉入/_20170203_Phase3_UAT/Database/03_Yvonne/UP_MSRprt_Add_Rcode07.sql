USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_MSRprt_Add_Rcode07]    Script Date: 2017/2/9 �W�� 11:34:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













-----------------------------------------------------------------------------------------------------
--�t�Τ����@�@: ��(�~)��
--�t�ΦW��      : UP_MSRprt_Add_Rcode07
--�{���ʽ�@�@: �Ƶ{��
--�{���\��@�@: ����Rcode 07 ���
--�ϥΨ��ɮס@: dbo.Tab_PRt_MSReport
--�ϥΨ�Ƶ{��: 
--�{�����g��   : Yvonne Chen--
--���g���      : 2015-1230
--�ק���      : 2016-0104
/*
MSReport07	01	���	
MSReport07	02	RP	
MSReport07	03	�ꤺ�Ũ�	
MSReport07	04	�Ѳ�	
MSReport07	05	�٥�	
MSReport07	06	�w�s	
MSReport07	07	���c���ӫ~	
*/
--					  Yvonne 2016-0328 For Sarah 	 ClassITemX show fn_Stk_data 's FType information
--					  Yvonne 2016-0407 For Sarah     20160401 eMail �վ��7 
--												1.	��Trade Date �M Settle Date�����R��
--												2.	��Issue Date���� Maturity Date���e��
--												3.	�Ѳ�����Issue Date����W�h���A��TG0101 �򥻸����쪺�W���W�d�����A�p�L�W���W�d�����A���o������
--				      Yvonne 2016-0407 �ǤJ�ϥΪ�(���user, �DTgl_Admin)
--				      Yvonne 2016-0425  For Sarah �s�W�ݨD �W�[ Comoney �b�~���� & ��������
--					  Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
--					  Yvonne 2017-0105 Add �ꤺ���
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
			  @i_Basedt          ,--�i����= @Trandt �e���u�@��
			  @i_CurRatedt     ,--�i����= i_Trandt �e���u�@��
			  @i_ifund		       ,--��StType
			  @i_RLine            ,--���w���@�ؤU�� (�i��Null or '00', ������)
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
			  @i_Basedt          As     Varchar(8)                             ,--�i����= @Trandt �e���u�@��
			  @i_CurRatedt     As     Varchar(8)                             ,--�i����= i_Trandt �e���u�@��
			  @i_ifund		       As     Varchar(20)                           ,--��StType
			  @i_RLine            As     Varchar(20)                           ,--���w���@�ؤU�� (�i��Null or '00', ������)
			  @i_UserId          As     Varchar(20)                           ,--�ϥΪ�
			  @o_TCnt            As      int					OUTPUT				,
			  @o_ErrCode       As      int					OUTPUT				,
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
			 
--           �ŧi			  
             Declare    Data_04_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
			      'MSReport07'			   Rcode        ,
			      '04'                            RLine         ,                  
                 '�ꤺ�Ѳ�'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  d.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
										  --m.nCstk    iFund_C                     ,--Profolio����W��    --(cm_Fund_Data.NC) <--�o���٨S���쥿�T�ӷ�
--Yvonne 2016-0318 Add 
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
																			
										  m.Classcod                                             ,                      --(fn_dstk.Calsscod)
										  d.AccountType                                        ,--�|�p����(ClassITem) --(fn_dstk.AccountType)                  
										  d.istkID                     Security_Name       ,--�Ѳ��N�X            --(fn_dstk.istkID) 
										  m.nCstk                      Security_Description   ,--�Ҩ餤��W��        --(fn_stk_Data.nCstk)
--���令���n��TRADE ��
--										  0                               Trade_Date             ,--�����              --(fn_stk_trand.ddate_W �̪�@��) 
--										  0                                Settle_Date            ,--��Τ�              --(fn_stk_trand.dstao_w �̪�@��) 
										  t.ddate_w                    Trade_Date            ,--�����              --(fn_stk_trand.ddate_W �̪�@��) 
										  t.dsato_w                    Settle_Date            ,--��Τ�              --(fn_stk_trand.dstao_w �̪�@��) 
										  m.dExpire_w                  Maturity_Date      ,--�����              --�Ѳ��S�� 
--					  Yvonne 2016-0407 For Sarah     20160401 eMail �վ��7 �Ѳ�����Issue Date����W�h���A��TG0101 �򥻸����쪺�W���W�d�����A�p�L�W���W�d�����A���o������
										  isNull(m.d_agree_w,
										           m.dissue_w)      issue_date              ,--�o���              --                               --P��: issue date            �o���
--										  m.dissue_w                   issue_date           ,--�o���              --                               --P��: issue date            �o���
										  d.qshare                     PAR_VALUE            ,--                    --(fn_dstk.qshare)               --I��: PAR VALUE             ���B(���ơB�Ѽ�)
										  d.mcost                      ORIGINAL_COST    ,--                    --(fn_dstk.mcost)                --J��: ORIGINAL COST         �Ũ�G�ʶR�餧���B*��λ���/100 ; �Ѳ��G��Ϊ��B
										  d.mcost                      BOOK_VALUE         ,--                    --(fn_dstk.mcost)                --K��: BOOK VALUE            ����餧�u�P�ᦨ��
										  d.mntamt                     MARKET_VALUE    ,--����                --(fn_dstk.mamt,�~����mntamt)    --L��: MARKET VALUE          �Ũ�:����骺���B*����骺��������/100 ; �Ѳ�:�����Ѽ�*����馬�L��
										  "UNREALIZED_GL" =
--					  Yvonne 2016-1028 Sarah �ӹq�����n�U��P�_, ���˳��n��
										  isnull(d.mntamt,0)- isnull(mcost ,0)
										 -- case 
											--when IsNull(d.mcost,0)*IsNull(d.mntamt,0) =0 
											--then  0 					
											--else  d.mntamt-mcost 
											--end
																										,				  
																										--M��: UNREALIZED GAIN/LOSS  ����{�l�q
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
																												   --�򥻤W�O ���O_KHL/TGL-AccountType
																												   --���O:    NTD->T , Else  icurID 
																												   --�겣�O:  KH-> KHL ; TG-> TGL
																												   --ex:      T_KHL-TRANDING    (FVTPL)
																												   

  
										  --''                                 ClassItemX             ,                      --�o��n�����ݭn�F 
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
																			 FundCod_Deal           ,                      --����s��(�Ѳ��S���o��)                       
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
--				      Yvonne 2016-0425  For Sarah �s�W�ݨD �W�[ Comoney �b�~���� & ��������										    
										  --cMoney.dbo.GetMA(d.istkid,d.ddate_W,180,M.ftype)
--					  Yvonne 2016-0519  ���@���令��fas���ѻ�table�yfn_Stk_price�z�C&���bisdbTGL
									      --cMoney.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 �O��6�Ӥ�
										  isdbTgl.dbo.GetMA(d.istkid,d.ddate_W,6,M.ftype) -- 6 �O��6�Ӥ�
																			 TD_180AVGPRICE     


						--�H�U������Ӥ��ݭn�F�a~~~~~ 
						--Yvonne-2015-0123 �W�[3���TBlstRate & BlstCurrate & BlstUnitValue for �P�ֳͪ�A1 ����
						--                  C1                         BlstRate               ,--�w�s�����Q�v
						--                  C2                         BlstCurrate            ,
						--                  C3                         BlstUnitValue          ,
						--Yvonne-2015-0309 for �P�ֳʹ��� ����1_20150225.doc , �W�[ �ӧ@�Q�v for RP &�w�s 
						--                  C4                         Coupon_Rate

								  From    
											 dbo.fn_dstk					    D,           --�w�s
											 dbo.fn_stk_data				M, 		  --�򥻸��
--											 /*
--Yvonne 20160205 ��g, coz trade �ɮרä��@�w�����
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
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
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
                 '�ꤺ���'                      ReMark        ,				 
				  Z.*
			  From
									   (Select 
										  d.iFund                                             ,--Profolio(StType)    --(cm_fund_Data.iFund)
										  --m.nCstk    iFund_C                     ,--Profolio����W��    --(cm_Fund_Data.NC) <--�o���٨S���쥿�T�ӷ�
--Yvonne 2016-0318 Add 
										  "iFund_C"=                
										  dbo.Uf_cm_fund_data(@i_Dealdt,@i_ifund,'ifund-nC'),
																			
										  m.Classcod                                             ,                      --(fn_dstk.Calsscod)
										  d.AccountType                                        ,--�|�p����(ClassITem) --(fn_dstk.AccountType)                  
										  d.ifdID                     Security_Name       ,--�Ѳ��N�X            --(fn_dstk.ifdID) 
										  m.ifdName                      Security_Description   ,--�Ҩ餤��W��        --(fn_fd_data.nCstk)
--���令���n��TRADE ��
--										  0                               Trade_Date             ,--�����              --(fn_stk_trand.ddate_W �̪�@��) 
--										  0                                Settle_Date            ,--��Τ�              --(fn_stk_trand.dstao_w �̪�@��) 
										  ''                                Trade_Date            ,--�����              --(fn_stk_trand.ddate_W �̪�@��) 
										  ''                                Settle_Date            ,--��Τ�              --(fn_stk_trand.dstao_w �̪�@��) 
										  m.dExpire_w                  Maturity_Date      ,--�����              --�Ѳ��S�� 
										  m.dissue_w                issue_date              ,--�o���              --                               --P��: issue date            �o���
										  d.q_qty                      PAR_VALUE            ,--                    --(fn_dstk.qshare)               --I��: PAR VALUE             ���B(���ơB�Ѽ�)
										  d.mcost                      ORIGINAL_COST    ,--                    --(fn_dstk.mcost)                --J��: ORIGINAL COST         �Ũ�G�ʶR�餧���B*��λ���/100 ; �Ѳ��G��Ϊ��B
										  d.mcost                      BOOK_VALUE         ,--                    --(fn_dstk.mcost)                --K��: BOOK VALUE            ����餧�u�P�ᦨ��
										  d.mamtTWD               MARKET_VALUE    ,--����                --(fn_dstk.mamt,�~����mntamt)    --L��: MARKET VALUE          �Ũ�:����骺���B*����骺��������/100 ; �Ѳ�:�����Ѽ�*����馬�L��
										  "UNREALIZED_GL" =
--					  Yvonne 2016-1028 Sarah �ӹq�����n�U��P�_, ���˳��n��
										  isnull(d.mamtTWD,0)- isnull(mcost ,0)
										 -- case 
											--when IsNull(d.mcost,0)*IsNull(d.mntamt,0) =0 
											--then  0 					
											--else  d.mntamt-mcost 
											--end
																										,				  
																										--M��: UNREALIZED GAIN/LOSS  ����{�l�q
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
																												   --�򥻤W�O ���O_KHL/TGL-AccountType
																												   --���O:    NTD->T , Else  icurID 
																												   --�겣�O:  KH-> KHL ; TG-> TGL
																												   --ex:      T_KHL-TRANDING    (FVTPL)
																												   

  
										  --''                                 ClassItemX             ,                      --�o��n�����ݭn�F 
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
										  d.dPnav_w                   Td_price_DT				,
										  d.PNAV                        Td_price					,
										  isdbTgl.dbo.GetMA(d.ifdID,d.ddate_W,6,M.fkind) -- 6 �O��6�Ӥ� --�A�T�{�n�p�󵹭�
																			 TD_180AVGPRICE     


						--�H�U������Ӥ��ݭn�F�a~~~~~ 
						--Yvonne-2015-0123 �W�[3���TBlstRate & BlstCurrate & BlstUnitValue for �P�ֳͪ�A1 ����
						--                  C1                         BlstRate               ,--�w�s�����Q�v
						--                  C2                         BlstCurrate            ,
						--                  C3                         BlstUnitValue          ,
						--Yvonne-2015-0309 for �P�ֳʹ��� ����1_20150225.doc , �W�[ �ӧ@�Q�v for RP &�w�s 
						--                  C4                         Coupon_Rate

								  From    
											 dbo.fn_dfd					D,           --�w�s
											 dbo.fn_fd_data				M  		  --�򥻸��
								Where    D.ddate_w             =  @i_Dealdt
--Yvonne 2016-0602 Add �ȧ�ꤺ���(TWD)
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
--	Step00		 ��l��
			 set			@o_Sqlerrm															= ' '
			 set			@o_ErrCode															= 0
			 set			@o_TCnt																= 0
			 set		    @u_Date																= SYSDATETIME()			  
			 set		    @Userid																	=  isnull(@i_UserId,User)				 			 
			 set			@Dealdt																	= @i_Dealdt
			 set			@Dealdt_Str															= isnull(@i_Dealdt_Str,floor((@Dealdt/100)*100+01))
			 set			@icurid																	='TWD'

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

			 set			@Rcode																    = 'MSReport07'
			 set			@Rline																	= '01'
			 set			@Rlinesno																= 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
--	Step1.2 Ū��& Insert ���
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
							@AccountType           ,--�|�p����
							@FundCod			       ,--�Ѳ��N�X
							@FundName			   ,--����W��
							@Trade_Date            ,--�����
							@Settle_Date            ,--��Τ�
							@Maturity_Date         ,--�����
							@issue_date              ,--�o���
							@PAR_VALUE             ,--���B	(fn_dstk.qshare)             ���B(���ơB�Ѽ�)
							@ORIGINAL_COST     ,
							@BOOK_VALUE          ,--�u�P�ᦨ��(fn_dstk.mcost)            ����餧�u�P�ᦨ��
							@MARKET_VALUE      ,--����         (fn_dstk.mamt,�~����mntamt)
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

--	Step4.1 �R��

			 set			@Rcode																    = 'MSReport07'
			 set			@Rline																	= '04'
			 set			@Rlinesno																= 0
			 exec		    dbo.Up_MSReport_D @i_Dealdt,@i_Dealdt_Str,@i_Basedt,@i_CurRatedt,@i_ifund,@Rcode,@Rline,@o_Errcode,@o_Sqlerrm ;
--	Step4.2 Ū��& Insert ���
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
							@AccountType           ,--�|�p����
							@FundCod			       ,--�Ѳ��N�X
							@FundName			   ,--����W��
							@Trade_Date            ,--�����
							@Settle_Date            ,--��Τ�
							@Maturity_Date         ,--�����
							@issue_date              ,--�o���
							@PAR_VALUE             ,--���B	(fn_dstk.qshare)             ���B(���ơB�Ѽ�)
							@ORIGINAL_COST     ,
							@BOOK_VALUE          ,--�u�P�ᦨ��(fn_dstk.mcost)            ����餧�u�P�ᦨ��
							@MARKET_VALUE      ,--����         (fn_dstk.mamt,�~����mntamt)
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
																					@i_ifund		,--��StType
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


