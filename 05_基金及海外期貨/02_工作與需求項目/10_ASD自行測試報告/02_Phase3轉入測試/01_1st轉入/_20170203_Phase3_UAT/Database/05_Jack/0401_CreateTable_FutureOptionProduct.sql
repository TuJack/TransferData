USE [Bloomberg]
GO

/****** Object:  Table [dbo].[FutureOptionProduct]    Script Date: 2017/2/13 上午 11:35:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FutureOptionProduct](
	[ProductID] [varchar](20) NOT NULL,
	[ProductType] [varchar](10) NOT NULL,
	[ContractType] [varchar](10) NOT NULL,
	[CName] [varchar](50) NULL,
	[TypeName] [varchar](50) NULL,
	[FuhwaCode] [varchar](10) NULL,
	[Country] [varchar](10) NULL,
	[ExchCode] [varchar](10) NULL,
	[ExchName] [varchar](50) NULL,
	[UnderlySpotTicker] [varchar](20) NULL,
	[Curncy] [varchar](10) NULL,
	[ContSize] [decimal](18, 4) NULL,
	[ContValue] [decimal](18, 4) NULL,
	[LastPriceDate] [datetime] NULL,
	[LastPrice] [decimal](18, 4) NULL,
	[QuoteSpec] [varchar](10) NULL,
	[QuoteUnits] [varchar](50) NULL,
	[vpoint] [decimal](18, 4) NULL,
	[TickSize] [decimal](18, 4) NULL,
	[TickValue] [decimal](18, 4) NULL,
	[TradingUnits] [nvarchar](100) NULL,
	[LastUpdate] [datetime] NULL,
	[Flags] [varchar](1) NULL,
	[SettlePriceBy] [varchar](10) NULL,
	[ID_MIC_PRIM_EXCH] [varchar](5) NULL,
	[FUT_INIT_SPEC_ML] [decimal](18, 4) NULL,
	[FUT_SEC_SPEC_ML] [decimal](18, 4) NULL,
 CONSTRAINT [PK_FutureOptionProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ProductType] ASC,
	[ContractType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'ProductID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'ProductType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合約代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'ContractType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'CName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'TypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FuhwaCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'FuhwaCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'國家' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'Country'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易所代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'ExchCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易所名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'ExchName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追蹤標的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'UnderlySpotTicker'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幣別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'Curncy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後價格日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'LastPriceDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後價格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'LastPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每點價值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'vpoint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳價單位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'TickSize'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳價單位值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'TickValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FutureOptionProduct', @level2type=N'COLUMN',@level2name=N'LastUpdate'
GO


