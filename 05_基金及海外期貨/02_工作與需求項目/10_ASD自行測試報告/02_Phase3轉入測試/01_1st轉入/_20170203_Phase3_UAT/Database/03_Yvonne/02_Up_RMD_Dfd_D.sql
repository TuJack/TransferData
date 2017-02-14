USE [isdbTGL]
GO

/****** Object:  StoredProcedure [dbo].[Up_RMD_Dfd_D]    Script Date: 2017/2/9 �W�� 11:46:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-----------------------------------------------------------------------------------------------------
--�t�Τ����@�@: TGL ���t��---RMD-�ꤺ�~���-�������R���Raw Data(�ۥN��)
--�t�ΦW��      : Up_RMD_Dfd_D
--�{���ʽ�@�@: �Ƶ{��
--�{���\��@�@: �R��
--�ϥΨ��ɮס@: dbo.Tab_RMD_Dfd
--�ϥΨ�Ƶ{��: 
--�{�����g��   : Yvonne Chen--
--���g���      : 2016-1228
--�ק���      : 2016-1228
----------------------------------------------------------------------------------------------------
/*
Use	     isdbTGL
Go

			  Declare @i_ddate_W		   As	    Varchar(8)	                            ;              
			  Declare @i_ifund		       As     Varchar(20)                           ;			  
			  Declare @o_ErrCode       As     Int	   										;
			  Declare @o_SqlErrm       As		Varchar(100)							;
Begin
			  set		   @i_ddate_W		= 20140829			  			  
			  set		   @i_ifund				= '1AKH'			  

			exec dbo.Up_RMD_Dfd_D
			  @i_ddate_W		   ,              			  
			  @i_ifund		       ,--��StType			  
			  @o_ErrCode       ,
			  @o_SqlErrm       

			 Select  @o_Errcode +'-'+@o_Sqlerrm  ErrText

End		  ;	
*/
CREATE Procedure [dbo].[Up_RMD_Dfd_D]
			( @i_ddate_W		   As	    Varchar(8)	                               ,              
			  @i_ifund		       As     Varchar(20)                              ,
			  @o_ErrCode       As      int					OUTPUT									,
			  @o_SqlErrm       As		Varchar(100) OUTPUT
			 )
As
Begin  Try
		  Delete				    
          From                  dbo.Tab_RMD_Dfd 
          Where                 ddate_W                = @i_ddate_W          
		   And                 ((IsNull(@i_ifund,' ')   in( ' ','00'))
                                or
                                (IsNull(@i_ifund,' ')   not in (' ','00')
                                And
                                ifund					  =  @i_ifund))          			 
			  
END	   Try
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


