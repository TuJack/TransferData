USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_RMD_DFts_Add]    Script Date: 2017/2/9 �W�� 11:48:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






-----------------------------------------------------------------------------------------------------
--�t�Τ����@�@: TGL ���t��---RMD-�ꤺ�~���f-�������R���Raw Data(�ۥN��)
--�t�ΦW��      : Up_RMD_DFts_D
--�{���ʽ�@�@: �Ƶ{��
--�{���\��@�@: ����RMD_DFts ��� : �ꤺ�~���f-�������R���Raw Data(�ۥN��)
--�ϥΨ��ɮס@: dbo.Tab_RMD_DFts
--�ϥΨ�Ƶ{��: 
--�{�����g��   : Yvonne Chen
--���g���      : 2017-0113
--�ק���      : 2017-0113
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
			  set		   @i_ddate_w			= 20160620
			  set		   @i_UserId               = 'FAS'										;
			  set		   @i_iFund                 = '1ak'									;
			  

			exec dbo.UP_RMD_DFts_Add
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
CREATE PRocedure [dbo].[UP_RMD_DFts_Add]
--Alter PRocedure [dbo].[UP_RMD_DFts_Add]
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
			declare @itdno               as    Varchar(26)                               ;
			declare @iFund              as    Varchar(20)								;			 
			declare @classcod			 as    Varchar(20)								= 'FTS';
			declare @iftsID   			 as    Varchar(20)								;
			declare @AccountType    as    Varchar(30)								;			
			declare @icurid               as    Varchar(3)								    ;
            declare @u_Date        	 as     datetime									;
			declare @userid         	 as     varchar(20)								;
			
			
			declare	@sheetType					as	varchar(50)	;
			declare	@Trader						as	varchar(50)	;
			declare	@Underlying					as	varchar(50)	;
			declare	@Ticker							as	varchar(50)	;
			declare	@BBG							as	varchar(50)	;
			declare	@ContractMonth				as	varchar(8)	;
			declare	@Cost							as	decimal(20,8)	;
			declare	@BS							    as	varchar(50)	;
			declare	@CostDate						as	varchar(8)	;
			declare	@Currency						as	varchar(3)	;
			declare	@Mkt								as	decimal(20,4)	;
			declare	@Lot								as	decimal(20,4)	;
			declare	@ContractValue				as	decimal(20,8)	;
			declare	@TotalCost					as	decimal(20,4)	;
			declare	@Qty								as	decimal(20,4)	;
			declare	@MTM							as	decimal(20,4)	;
			declare	@MTM_TWD					as	decimal(20,4)	;
			declare	@PnL								as	decimal(20,4)	;
			declare	@FX								as	decimal(20,6)	;
			declare	@PnL_TWD					as	decimal(20,4)	;
			/*
			sheetType					,
			Trader						,
			Underlying					,
			Ticker						,
			BBG							,
			ContractMonth			,
			Cost							,
			BS							,
			CostDate					,
			Currency					,
			Mkt							,
			Lot							,
			ContractValue			,
			TotalCost					,
			Qty							,
			MTM							,
			MTM_TWD					,
			PnL							,
			FX								,
			PnL_TWD					
			*/ 			
			
			 
--           �ŧi			  
             Declare    Data_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For
			  Select  
				  Z.*
			  From
							    (Select 
											d.ddate_w,
											d.itdNo,
											d.ifund,
											d.iftsID,
											d.AccountType,
											d.icurid,
											--
											case 
												when isNull(ms.Blg_style,'') =   'Index' 
												then  'Indicies'
												when isNull(ms.Blg_style,'') =   'Comdty'
												then  'Commodities'
												when isNull(ms.Blg_style,'') in( '', null)
												then  '�L�]�w'												
												else  ms.Blg_style
												end												
											--case 
											--	when isNull(ms.istyId,'') =   'Index' 
											--	then  'Indicies'
											--	when isNull(ms.istyId,'') =   'Comdty'
											--	then  'Commodities'
											--	when isNull(ms.istyId,'') in( '', null)
											--	then  'Indicies'												
											--	else  ms.istyID
											--	end												
																			sheetType	,--�ثe�u����������..�H��Y�n�������@���ӷ|�b fn_fts_style.Blg_Style �̳]
																							 --Indicies�BBonds�BForex�BCommodities
											cm.ifund					Trader		,--�b��
											d.iftsID						Underlying ,--�{�f�Ъ�
											ms.fexCode			    Ticker		,--�^�եN�X1 --�A�T�{�o�Өӷ�??
											ms.Blg_Code             BBG			,--�^�եN�X2 --�A�T�{�o�Өӷ�??
											right(m.iftsID,6) 		ContractMonth			
																						    ,--�X�����
											t.price                       Cost			,--���槡��
											d.ftrade                     BS			,--Buy/Sell Buy=B,Sell=S
											d.ddate_w                 CostDate	,--�������
											d.icurid                     Currency	,--���O
											d.Price                      Mkt			,--����
											case 
												when d.ftrade = 'B'
												then  d.qftss 
												when d.ftrade = 'S'
												then  d.qftss *(-1)																			
												else  d.qftss 
												end												
																			Lot			 ,--�f��
											ms.vpoint/ (case when ms.tick = 0 then 1 else ms.tick end)
																	         ContractValue	 
																							 ,--�X������
											--TotalCost				,
											--Qty							,
											--MTM						,
											--MTM_TWD				,
											--PnL							,
											case 
												when d.icurid  = 'TWD'
												then  1																														
												else  1                    
												end						
																			 FX			   --�ײv								
											--PnL_TWD					
											
								  From    
											 dbo.fn_dfts					    D           --�w�s
											 left join 
											 ( Select    t1.*
											 	From      dbo.fn_fts_trade t1
												where    ddate_w          <= @i_ddate_w																								
											 ) T           on T.ifund = D.ifund and T.iftsID = D.iftsID and T.AccountType = D.Accounttype and T.icurid = D.iCurid and T.itdno = D.itdno,
											 dbo.fn_fts_data				M ,  		  --�򥻸��,
											 dbo.fn_fts_style            MS,
											 dbo.cm_fund_data				cm
								Where    D.ddate_w             =  @i_ddate_w
								  And      D.ifund                 =  @i_ifund
								  And      m.iftsID              =   D.iftsID
								  And		 ms.istyID				 = m.istyID 
								  And		 IsNull(ms.duse_w,0)    				<= @i_ddate_w
								  And		 IsNull(ms.dexpire_w,99999999)  >= @i_ddate_w
								  And      cm.ifund				=   D.ifund
								  And      cm.level			    IN  ('1', '2')
								  And		 IsNull(cm.dbuild_w,0)				<= @i_ddate_w
								  And		 IsNull(cm.dFund_w,99999999)     >    @i_ddate_w								  								  
								  )														Z		  

           Order By
                 ddate_W,ifund, itdno
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

			 exec		    dbo.Up_RMD_DFts_D @i_ddate_w,@i_ifund,@o_Errcode,@o_Sqlerrm ;
--	Step0.1 Ū��& Insert ���
			 Open Data_Cur
			 while (@@error = 0)			 
				begin
				
					fetch next from Data_Cur into 
							@ddate_w,
							@itdno,
							@ifund,
							@iftsID,
							@AccountType,							
							@icurid,
							--@Classcod,
							@sheetType					,
							@Trader						,
							@Underlying					,
							@Ticker							,
							@BBG							,
							@ContractMonth				,
							@Cost							,
							@BS								,
							@CostDate						,
							@Currency						,
							@Mkt								,
							@Lot								,
							@ContractValue				,
							--@TotalCost					,
							--@Qty								,
							--@MTM							,
							--@MTM_TWD					,
							--@PnL								,
							@FX								
							--@PnL_TWD												
															
					if (@@fetch_status <> 0)
						break														
							Begin														
							

								Set   @TotalCost	    = @Cost * @Lot * @ContractValue
								Set	@Qty			    = @Lot   * @ContractValue
								Set    @MTM           = @Mkt  * @Qty
								Set    @MTM_TWD   = @MTM *@Fx
								Set    @PnL             = @MtM  -  @TotalCost
								Set    @PnL_TWD     = @PnL * @Fx

							End	
														
							insert into dbo.TAB_RMD_DFts
						   (
						    ddate_w,
							itdno,
							ifund,
							iftsID,
							AccountType,							
							Classcod,
							USERID,
							U_DATE,
							sheetType					,
							Trader						,
							Underlying					,
							Ticker						,
							BBG							,
							ContractMonth			,
							Cost							,
							BS							,
							CostDate					,
							Currency					,
							Mkt							,
							Lot							,
							ContractValue			,
							TotalCost					,
							Qty							,
							MTM							,
							MTM_TWD					,
							PnL							,
							FX								,
							PnL_TWD					
											
							)
							Values
							(
							@ddate_w,
							@itdno,
							@ifund,
							@iftsID,
							@AccountType,							
							@Classcod,
							@USERID,
							@U_DATE,
							@sheetType					,
							@Trader						,
							@Underlying					,
							@Ticker							,
							@BBG							,
							@ContractMonth				,
							@Cost							,
							@BS								,
							@CostDate						,
							@Currency						,
							@Mkt								,
							@Lot								,
							@ContractValue				,
							@TotalCost					,
							@Qty								,
							@MTM							,
							@MTM_TWD					,
							@PnL								,
							@FX								,
							@PnL_TWD					
							
							);
							
				       end									
			 CLOSE Data_Cur
			 DEALLOCATE Data_Cur

			 Procedure_End:			  
			 set @o_TCnt					= dbo.Uf_RMD_DFts_IfExist
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


