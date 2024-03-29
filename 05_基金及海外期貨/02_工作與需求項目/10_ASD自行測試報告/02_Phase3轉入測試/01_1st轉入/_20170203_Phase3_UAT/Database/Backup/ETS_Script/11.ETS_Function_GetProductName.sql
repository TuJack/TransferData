USE [ETS_P]
GO
/****** Object:  UserDefinedFunction [dbo].[GetProductName]    Script Date: 2017/2/2 上午 11:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kido Lin
-- Create date: 2007-10-11
-- Description:	取得商品名稱
-- =============================================
ALTER FUNCTION [dbo].[GetProductName]
(
	@Product As Varchar(10),
	@ProductID As Varchar(100),
	@DecDT As Datetime 
)
RETURNS Varchar(200)
AS
BEGIN
	Declare @Year as Int
	Declare @ProductName As Varchar(200)
	Declare @FOType as Char(1)
	Declare @intIndex as int
	Declare @ProductID1 As Varchar(100)
	Declare @ProductID2 As Varchar(100)

	Set @ProductName = ''

	IF @Product = 'Stk'
		Begin
			--Select @ProductName = StockName From StkStockData Where Stock = @ProductID
			Select @ProductName = isnull(a.StockName,a.stock) 
			From StkStockData a 
			Where a.Stock = @ProductID
		End	
	Else IF @Product = 'GlStk'
		Begin
			--Select @ProductName = StockName From GlStkStockData Where Stock = @ProductID
			--Select @ProductName = Isin From GlStkStockData Where Stock = @ProductID
			Select @ProductName = (case when isnull(StockEName,'') <> '' then StockEName else isnull(StockName,'') end) From GlStkStockData Where Stock = @ProductID
		End	
	Else IF @Product = 'FTS' Or @Product = 'OPT'
		Begin
			Select @ProductName = ShortName, @FOType = FOType From FOData Where FOID = @ProductID And FOType = @Product

		End	
	Else IF @Product = 'FoF'
		Begin
			If CharIndex('/', @ProductID) > 0 
			Begin
				Set @ProductID1 = SubString(@ProductID, 1, CharIndex('/', @ProductID) - 1)
				Set @ProductID2 = SubString(@ProductID, CharIndex('/', @ProductID) + 1, Len(@ProductID))
				Select @ProductName = ChtName From FoFFundData Where BTicker = @ProductID1
				Select @ProductName = @ProductName + ' / ' + ChtName From FoFFundData Where BTicker = @ProductID2
			End		
			Else
				Select @ProductName = ChtName From FoFFundData Where BTicker  = @ProductID 

		End	
	Else IF @Product = 'Bond'
		Begin
			Select @ProductName = BondName +'('+ BondType+')' From BondData Where BondId = @ProductID And SubType ='Bond'
		End	
	Else IF @Product = 'GlBond'
		Begin
			Select @ProductName = BondName +'('+ BondType+')' From BondData Where BondId = @ProductID And SubType ='GlBond'
		End	
    If IsNull(@ProductName, '') = '' 
        Set @ProductName = @ProductID
	RETURN RTrim(@ProductName)


END















