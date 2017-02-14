USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[UP_RMD_Dfd_Add_All_SE]    Script Date: 2017/2/9 上午 11:46:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-----------------------------------------------------------------------------------------------------
--系統分類　　: TGL 投資系統---RMD-國內外基金-風控分析資料Raw Data(自代操)
--系統名稱      : Up_RMD_Dfd_D
--程式性質　　: 副程式
--程式功能　　:產生RMD_Dfd 資料 : 國內外基金-風控分析資料Raw Data(自代操)整批區間產生
--使用到檔案　: dbo.Tab_RMD_Dfd
--使用到副程式: 
--程式撰寫者   : Yvonne Chen--
--撰寫日期      : 2016-0616
--修改日期      : 2016-0616
-----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go

			  Declare @i_ddate_w		   As	    Varchar(8)	                            ;              
			  Declare @i_ddate_w_s    As	    Varchar(8)	                            ;              
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

			exec dbo.UP_RMD_Dfd_Add_All_se
			  @i_ddate_w		   ,              
			  @i_ddate_w_s     ,
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
CREATE PRocedure [dbo].[UP_RMD_Dfd_Add_All_SE]
			( @i_ddate_w       As	    Varchar(8)	                            ,              			  
			  @i_ddate_w_S   As	    Varchar(8)	                            ,              			  
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
				  declare @ddate_w          as    Varchar(8)                               ;

				   Set			@o_Sqlerrm	 = ' '
				   Set			@o_ErrCode	 = 0
				   Set			@o_TCnt        = 0
				   Set			@TCnt            = 0
--select  distinct isnull(a.orifund,a.ifund) ifund
--from   [isdbTGL].[dbo].[Vcm_ifund] a,
--		    [isdbTGL].[dbo].fn_dstk d 
--where a.ad_date = @i_ddate_w
--and     a.level = 2
--and     a.ad_Date = d.ddate_w
--and     a.ifund = d.ifund	  

                   --           宣告			  
             Declare    Data_Cur CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
			 For			 
			 SELECT		distinct ddate_W
			 From 		    isdbtgl.dbo.fn_dstk		 cm		   
			where			ddate_w between @i_ddate_w_s and @i_ddate_w
			order by		 1 ;  			
--	Step0.0		 初始化			 
			 
--	Step1	 	 讀取 iFund & Run
			 Open Data_Cur
			 while (@@error = 0)			                
				begin
					--print @RLineSno
					fetch next from Data_Cur into 
							@ddate_w																				
					if (@@fetch_status <> 0)
						break
						set		  @TCnt					=	0			  

						exec dbo.UP_RMD_Dfd_Add_All
									  @ddate_w		   ,              
									  @i_level			   ,
									  @i_fund_Type     ,			  
									  @i_ifund		       ,			  
									  @i_USerid          ,
									  @o_TCnt			   output,
									  @o_ErrCode       output,
									  @o_SqlErrm       output

						--exec dbo.UP_RMD_Dfd_Add
						--			  @i_ddate_w		   ,									  									  									  
						--			  @ifund		           ,									  
						--			  @i_UserID          ,
						--			  @TCnt			      output,
						--			  @o_ErrCode       output,
						--			  @o_SqlErrm       output	

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


