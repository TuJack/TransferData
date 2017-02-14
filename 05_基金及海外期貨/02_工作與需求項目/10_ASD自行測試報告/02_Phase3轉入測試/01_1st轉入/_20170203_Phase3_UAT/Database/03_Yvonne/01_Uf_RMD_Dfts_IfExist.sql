USE [isdbTGL]
GO

/****** Object:  UserDefinedFunction [dbo].[Uf_RMD_Dfts_IfExist]    Script Date: 2017/2/9 上午 11:51:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-----------------------------------------------------------------------------------------------------
--系統分類　　: TGL 投資系統---RMD-國內外期貨-風控分析資料Raw Data(自代操)
--系統名稱      : Up_RMD_Dfts_D
--程式性質　　: 副程式
--程式功能　　: 是否已存在Data
--使用到檔案　: dbo.Tab_RMD_Dfts
--使用到副程式: 
--程式撰寫者   : Yvonne Chen
--撰寫日期      : 2017-0113
--修改日期      : 2017-0113
----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go
			  Declare @i_ddate_w		   As	    Varchar(8)	                            ;              
			  Declare @i_ifund		       As     Varchar(20)                           ;			  
			  Declare @o_TCnt			   As     Int											;
			  
Begin
			  set		   @i_ddate_w			= 20140829			  
			  set		   @i_ifund				= '1AKH'			  

			set @o_Tcnt =
			dbo.Uf_RMD_Dfts_IfExist
			  (
			  @i_ddate_w		   ,              			  
			  @i_ifund		       			  
			   )

			 Select @o_TCnt TCnt

End		  ;	
*/
CREATE FUNCTION [dbo].[Uf_RMD_Dfts_IfExist]
         (@ddate_w		As Varchar(8)		
		, @ifund       As Varchar(30)		
		 )
Returns   int
As          
		  
Begin
		  Declare	@cnt	As	Numeric(30,0) 
		  Set		@cnt										=0
		  
		  DECLARE	Data_Cur	 CURSOR LOCAL
          For
          Select                Count(*) cnt
          From                  dbo.Tab_RMD_Dfts				a
          Where                 a.ddate_w                = @ddate_w          
		   And                 ((IsNull(@ifund,' ')   in( ' ','00'))
                                or
                                (IsNull(@ifund,' ')   not in (' ','00')
                                And
                                ifund          =  @ifund))

		    Open Data_Cur
			Fetch next From Data_Cur into @Cnt			
			Close Data_Cur
			Deallocate Data_Cur
			RETURN (@Cnt)

          

End                                                                                                 ;





GO


