USE [isdbTGL]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Q_Get_FdSaleCost]    Script Date: 2017/1/20 下午 03:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_Q_Get_FdSaleCost]  --查詢基金的賣出成本
   (@ddate varchar(8), @ifund varchar(12), @ifdid varchar(15), @icurid varchar(3), @MyQty decimal(20,4), @AccountType varchar(10), @iagtid varchar(5)) 
   --所需參數:日期,Portfolio代號,基金代號,幣別,MyQty交易單位數,會計科目,基金公司代碼  


--ChgQty Chgcash配息應調整的成本(減少)
RETURNS @RTNtable TABLE (
    errdesc varchar(40),        --錯誤敍述, 空白表示無錯誤
    mscost decimal(20,4),
	mscostTWD decimal(20,4), 
	mscostCur decimal(20,4) )
AS 
 
BEGIN       
     --回傳Table的變數
     declare @Rerrdesc varchar(40)
     declare @Rmscost as decimal(20,4)
     declare @RmscostTWD as decimal(20,4)
     declare @RmscostCur as decimal(20,4)
     --fn_dfd
     declare @Bqty decimal(20,4)
     declare @Bmscost decimal(20,4)
     declare @BmscostTWD decimal(20,4)
     declare @BmscostCur decimal(20,4)
	 --單位成本(庫存成本/庫存股數),算到小數第四位
	 declare @AVG numeric(20,4) 
	 declare @AVGTWD numeric(20,4) 
	 declare @AVGCur numeric(20,4) 
	          
     --set default value
     set @Rerrdesc=''
     set @Rmscost=0.0
	 set @RmscostTWD=0.0
	 set @RmscostCur =0.0
     --計算前一日庫存檔之資料
     set @Bqty=0.0
     set @Bmscost=0.0
	 set @BmscostTWD=0.0
	 set @BmscostCur=0.0

	--需加上當天再投資的單位數 
	Select @Bqty = a.q_qty + isnull(b.tb_qty,0) 
	     , @Bmscost = a.mdcost1 
	     , @BmscostTWD = a.mdcost1TWD 
	     , @BmscostCur = a.mdcost1Cur
	from fn_dfd a 
	--遇除息，需扣除庫存成本
	left join fn_fd_buy b on b.ifdid = a.ifdid and b.ifund = a.ifund  AND b.dtrans_w = @ddate 
	Where a.ddate_w = dbo.F_Q_DateAfterType_w('C','0' , 9 ,-1 ,@ddate) and a.ifund =@ifund and a.ifdid = @ifdid and a.AccountType = @AccountType and a.iagtid = @iagtid

     if @Bqty=0
	        begin
	          	set @Rerrdesc='找不到前一天的股票庫存, 請重新調整資料!'
	            	goto Insert_RTNtable
	        end 

	set @AVG = round((@Bmscost) / (@Bqty), 4) 
	set @Rmscost = Round(@AVG * @MyQty, dbo.F_Q_Get_CurrDecimal(@icurid))   
	set @AVGTWD = round((@BmscostTWD)  / (@Bqty), 4) 
	set @RmscostTWD = Round(@AVGTWD * @MyQty, 2)   
	set @AVGCur = round((@BmscostCur)  / (@Bqty), 4) 
	set @RmscostCur = Round(@AVGCur * @MyQty, 2)   

Insert_RTNtable:
    insert into @RTNtable(errdesc,mscost,mscostTWD,mscostCur ) values(@Rerrdesc,@Rmscost, @RmscostTWD, @RmscostCur )
    RETURN
END

