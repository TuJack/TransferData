USE [RelayDB]
GO
/****** Object:  StoredProcedure [dbo].[ImportKSystemData]    Script Date: 2017/2/14 下午 06:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ImportKSystemData] (@Phase Varchar(2))
as
	-- Declare Parameter
	declare @SQLCnt as nVarchar(max)
	declare @SQLStr as nVarchar(max)
	declare @pSrcTable as nVarchar(max)
	declare @pDestDB as nVarchar(max)
	declare @pDestTable as nVarchar(max)
	declare @pImportCnt as nVarchar(max)
	declare @pTableCntBefore as nVarchar(max)
	declare @pTableCntAfter as nVarchar(max)
	declare @ErrorNumber as numeric(18,4)

	declare CurSrcData CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY
	for 
		select SrcTable, DestDB, DestTable
		 from  RelayDB.dbo.ImpMap
		 where IsImport = 'N'
		   and Phase = @Phase
Begin
	open CurSrcData
		fetch next From CurSrcData into  @pSrcTable, @pDestDB, @pDestTable

		While @@fetch_status <> -1
		Begin	
			-- 匯入資料並檢查是否有 Error
			BEGIN TRY  
				set @pImportCnt = 0
				set @pTableCntBefore = 0
				set @pTableCntAfter = 0
				set @ErrorNumber = 0
				-- 未匯入前計數
				set @SQLCnt = N'select @outCnt = count(*) from ' + @pDestDB + '.dbo.' + @pDestTable
				exec sp_executesql @SQLCnt, N'@outCnt int OUTPUT', @outCnt=@pTableCntBefore OUTPUT;

				set @SQLStr = N'insert into ' +  + @pDestDB + '.dbo.' + @pDestTable + ' select * from RelayDB.dbo.' + @pSrcTable
				exec sp_executesql @SQLStr
				set @pImportCnt = @@RowCount

				-- 匯入後計數
				set @SQLCnt = N'select @outCnt = count(*) from ' + @pDestDB + '.dbo.' + @pDestTable
				exec sp_executesql @SQLCnt, N'@outCnt int OUTPUT', @outCnt=@pTableCntAfter OUTPUT;
					
				update RelayDB.dbo.ImpMap
					set TableCntBefore = @pTableCntBefore,
						ImportCnt = @pImportCnt,
						TableCntAfter = @pTableCntAfter,
						UpdateTime = GETDATE(),
						isImport = 'Y'
					where SrcTable = @pSrcTable

			End Try
			BEGIN CATCH  
				PRINT N'Error : '  +  @pSrcTable + '| 錯誤序號: ' + convert(varchar,ERROR_NUMBER())  +  '|  錯誤訊息:  ' + ERROR_MESSAGE()
				select  @ErrorNumber = ERROR_NUMBER() 
				--資料異常
				if @ErrorNumber = 2627
					Begin
						set @SQLCnt = N'select @outCnt = count(*) from ' + @pDestDB + '.dbo.' + @pDestTable
						exec sp_executesql @SQLCnt, N'@outCnt int OUTPUT', @outCnt=@pTableCntAfter OUTPUT;
						update RelayDB.dbo.ImpMap
						   set TableCntBefore = @pTableCntBefore,
							   ImportCnt = @pImportCnt,
							   TableCntAfter = @pTableCntAfter,
							   UpdateTime = GETDATE(),
							   Remark = 'Data Error',
							   isImport = 'P'
						 where SrcTable = @pSrcTable
					 End
			END Catch
			fetch next From CurSrcData into  @pSrcTable, @pDestDB, @pDestTable

		end
	CLOSE CurSrcData
	DEALLOCATE CurSrcData


end

