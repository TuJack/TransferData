USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_RMD_DFts_Add_All]    Script Date: 2017/2/9 上午 11:48:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-----------------------------------------------------------------------------------------------------
--系統分類　　: TGL 投資系統---RMD-國內外期貨-風控分析資料Raw Data(自代操)
--系統名稱      : Up_RMD_Dfts_D
--程式性質　　: 副程式
--程式功能　　:產生RMD_Dfts 資料 : 國內外期貨-風控分析資料Raw Data(自代操)
--使用到檔案　: dbo.Tab_RMD_Dfts
--使用到副程式: 
--程式撰寫者   : Yvonne Chen--
--撰寫日期      : 2017-0116
--修改日期      : 2017-0116
-----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go

			  Declare @i_ddate_w		   As	    Varchar(8)	                            ;              
			  Declare @i_level          As     Varchar(8)                             ;
			  Declare @i_fund_Type     As     Varchar(8)                             ;			  
			  Declare @i_ifund		       As     Varchar(20)                           ;			  
			  Declare @i_UserID            As     Varchar(20)                           ;
			  Declare @o_TCnt			   As     Int											;
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
Begin
			  set		   @i_ddate_w			= 20160429
			  
			  set		   @i_Level 			= '0'												;
			  set		   @i_Fund_Type		= '0'												;
			  set		   @i_ifund				= '1'			  			  
			  set         @i_UserId          = 'FAS'

			exec dbo.UP_RMD_Dfts_Add_All
			  @i_ddate_w		   ,              
			  @i_level			   ,
			  @i_fund_Type     ,			  
			  @i_ifund		       ,			  
			  @i_USerid          ,
			  @o_TCnt			   output,
			  @o_ErrCode       output,
			  @o_SqlErrm       output
			  
			  			 Print '@o_TCnt ' +convert(varchar(20),isnull(@o_TCnt,0))  			 
End		  ;	
*/
----------------------------------------------------------------------------------------------------
CREATE PRocedure [dbo].[UP_RMD_DFts_Add_All]
			( @i_ddate_w		   As	    Varchar(8)	                            ,              			  
			  @i_Level            As     Varchar(8)                              ,--可不輸
			  @i_Fund_Type    As     Varchar(8)                              ,--可不輸			  
			  @i_ifund		       As     Varchar(20)                            ,--			  
			  @i_UserID          As     Varchar(20)                            ,--傳入產生使用者
			  @o_TCnt            As      int					OUTPUT									,
			  @o_ErrCode       As      int					OUTPUT									,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As			  
BEGIN    Try
			 
				  declare @iFund              as    Varchar(20)								;
				  declare @TCnt               as    Varchar(20)								;

				   Set			@o_Sqlerrm	 = ' '
				   Set			@o_ErrCode	 = 0
				   Set			@o_TCnt        = 0
				   Set			@TCnt            = 0
--select  distinct isnull(a.orifund,a.ifund) ifund
--from   [isdbTGL].[dbo].[Vcm_ifund] a,
--		    [isdbTGL].[dbo].fn_Dfts d 
--where a.ad_date = @i_ddate_w
--and     a.level = 2
--and     a.ad_Date = d.ddate_w
--and     a.ifund = d.ifund	  

                   --           宣告			  
             Declare    Data_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For			 
			 SELECT		ifund 							    			
			 From 		    isdbtgl.dbo.Vcm_ifund		 cm
		   --From				isdbtgl.dbo.cm_fund_data
			where			cm.ad_Date = @i_ddate_W
			And               level IN('1', '2')   
			--i_Level 和 i_Fund_Type 目前還都用不到, （for 以後備用寫的)
			--Level        ------------------------------------------------------------
			And			   ((IsNull(@i_Level,'0') = '0')
                                 or
                                (IsNull(@i_Level,'0') <> '0'
                                 And
                                 IsNull(Level,'0')      = @i_Level))
			--Fund_Type ------------------------------------------------------------
			And             ((IsNull(@i_Fund_Type,'0') = '0')
                                 or
                                (IsNull(@i_Fund_Type,'0') <> '0'
                                 And
                                 IsNull(Fund_Type,'0')      = @i_Fund_Type))
			--iFund -------------------------------------------------------------------
								
			And			   (
--Yvonne 2016-0706
								--Level2 層, 只跑沒有 orifund 的, 意即非拆出來的ifund( ex: 1akh, zatg, 代操帳戶,....)
								(IsNull(@i_iFund,'0') = '01Z'
								 --And
								 --IsNull(orifund,'XX')  = 'XX'									-- Yvonne 2017-0116 Add 期貨沒有 1AKH ,ZATG 這層
								 And
                                 IsNull(Substring(iFund,1,1),'0')      in( '1','K','Z')
								 And
								 iFund NOT IN ( '1','Z')
								)
								or
								--Level1 底下的Level 2 全部都Run
								(IsNull(@i_iFund,'0') = '1Z'
								 And
                                 IsNull(Substring(iFund,1,1),'0')      in( '1','K','Z')
								 And
								 iFund NOT IN ( '1','Z')
								)	
								or
								(IsNull(@i_iFund,'0') = '1'
								 And
                                 IsNull(Substring(iFund,1,1),'0')      in( @i_ifund,'K')
								 And
								 iFund <> '1'
								)	
                                 or
                                (IsNull(@i_iFund,'0') = 'Z'
                                 And
                                 IsNull(Substring(iFund,1,1),'0')      = @i_ifund
								 And 
								 iFund <>'Z'
								 )
								 or
								 --Level2 指定Level 2 的iFund
                                (IsNull(@i_iFund,'0') not in  ('1','Z','1Z')
                                 And
                                 iFund      = @i_ifund
								 )
								)
			And				 IsNull(dbuild_w,0) <= @i_ddate_w
			And				 IsNull(dFund_w,99999999)     >@i_ddate_w
			And                ifund in (select ifund from dbo.fn_dfts where ddate_w = @i_ddate_w)						--只抓有產生庫存檔的
			order by		 substring(ifund,1,1), 
								 CASE ifund WHEN '1' THEN 1 When 'Z' Then 1 Else 2 End, isNull(fund_Type,'X') ,
								 ifund  ;  
			--  SELECT		ifund 							    
			--From				dbo.cm_fund_data  cm
			--where			level IN('1', '2')   
			----i_Level 和 i_Fund_Type 目前還都用不到, （for 以後備用寫的)
			----Level        ------------------------------------------------------------
			--And			   ((IsNull(@i_Level,'0') = '0')
   --                              or
   --                             (IsNull(@i_Level,'0') <> '0'
   --                              And
   --                              IsNull(Level,'0')      = @i_Level))
			----Fund_Type ------------------------------------------------------------
			--And             ((IsNull(@i_Fund_Type,'0') = '0')
   --                              or
   --                             (IsNull(@i_Fund_Type,'0') <> '0'
   --                              And
   --                              IsNull(Fund_Type,'0')      = @i_Fund_Type))
			----iFund -------------------------------------------------------------------
			--					--Level1 底下的Level 2 全部都Run
			--And			   ((IsNull(@i_iFund,'0') = '1Z'
			--					 And
   --                              IsNull(Substring(iFund,1,1),'0')      in( '1','K','Z')
			--					 And
			--					 iFund NOT IN ( '1','Z')
			--					)	
			--					or
			--					(IsNull(@i_iFund,'0') = '1'
			--					 And
   --                              IsNull(Substring(iFund,1,1),'0')      in( @i_ifund,'K')
			--					 And
			--					 iFund <> '1'
			--					)	
   --                              or
   --                             (IsNull(@i_iFund,'0') = 'Z'
   --                              And
   --                              IsNull(Substring(iFund,1,1),'0')      = @i_ifund
			--					 And 
			--					 iFund <>'Z'
			--					 )
			--					 or
			--					 --Level2 指定Level 2 的iFund
   --                             (IsNull(@i_iFund,'0') not in  ('1','Z','1Z')
   --                              And
   --                              iFund      = @i_ifund
			--					 )
			--					)
			--And				 IsNull(dbuild_w,0) <= @i_ddate_w
			--And				 IsNull(dFund_w,99999999)     >@i_ddate_w
			--order by		 substring(ifund,1,1), 
			--					 CASE ifund WHEN '1' THEN 1 When 'Z' Then 1 Else 2 End, isNull(fund_Type,'X') ,
			--					 ifund  ;  


--	Step0.0		 初始化			 
			 
--	Step1	 	 讀取 iFund & Run
			 Open Data_Cur
			 while (@@error = 0)			                
				begin
					--print @RLineSno
					fetch next from Data_Cur into 
							@ifund																				
					if (@@fetch_status <> 0)
						break
						set		  @TCnt					=	0			  
						exec dbo.UP_RMD_Dfts_Add
									  @i_ddate_w		   ,									  									  									  
									  @ifund		           ,									  
									  @i_UserID          ,
									  @TCnt			      output,
									  @o_ErrCode       output,
									  @o_SqlErrm       output	

						set	@o_TCnt	=	@o_TCnt+ @TCnt
		       end									
			 CLOSE Data_Cur
			 DEALLOCATE Data_Cur		
		
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


