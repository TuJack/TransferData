USE [isdbTGL]
GO

/****** Object:  Table [dbo].[TAB_RMD_DFTS]    Script Date: 2017/2/9 上午 11:44:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TAB_RMD_DFTS](
	[ddate_w] [varchar](8) NOT NULL,
	[itdNO] [varchar](26) NOT NULL,
	[ifund] [varchar](20) NOT NULL,
	[iftsID] [varchar](15) NOT NULL,
	[AccountType] [varchar](10) NOT NULL,
	[Classcod] [varchar](10) NOT NULL CONSTRAINT [DF_TAB_RMD_DFTS_Class__04C657A2]  DEFAULT (''),
	[USERID] [varchar](20) NOT NULL CONSTRAINT [DF_TAB_RMD_DFTS_USERI__05BA7BDB]  DEFAULT ('SYS'),
	[U_DATE] [datetime] NOT NULL CONSTRAINT [DF_TAB_RMD_DFTS_U_DAT__06AEA014]  DEFAULT (getdate()),
	[sheetType] [varchar](50) NULL,
	[Trader] [varchar](50) NOT NULL,
	[Underlying] [varchar](50) NOT NULL,
	[Ticker] [varchar](50) NULL,
	[BBG] [varchar](50) NULL,
	[ContractMonth] [varchar](50) NULL,
	[Cost] [numeric](20, 8) NULL,
	[BS] [varchar](50) NULL,
	[CostDate] [varchar](8) NULL,
	[Currency] [varchar](3) NULL,
	[Mkt] [numeric](20, 4) NULL,
	[Lot] [numeric](20, 4) NULL,
	[ContractValue] [numeric](20, 8) NULL,
	[TotalCost] [numeric](20, 4) NULL,
	[Qty] [numeric](20, 4) NULL,
	[MTM] [numeric](20, 4) NULL,
	[MTM_TWD] [numeric](20, 4) NULL,
	[PnL] [numeric](20, 4) NULL,
	[FX] [numeric](20, 6) NULL,
	[PnL_TWD] [numeric](20, 4) NULL,
 CONSTRAINT [PK_TAB_RMD_DFTS] PRIMARY KEY CLUSTERED 
(
	[ddate_w] ASC,
	[itdNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分為四個sheet，sheet名稱分別為Indicies、Bonds、Forex、Commodities' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'sheetType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Trader'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'現貨標的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Underlying'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'彭博代碼1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Ticker'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'彭博代碼1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'BBG'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合約月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'ContractMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成交均價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Cost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BUY=B,SELL=S' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'BS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成本日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'CostDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幣別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Currency'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'市價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Mkt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'口數(若BS為B此欄為正值，若BS欄為S此欄為負值)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Lot'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合約價值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'ContractValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成本. 等於 Cost*Lot*ContractValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等於 Lot*ContractValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Qty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'市值 (等於 Mkt*Qty)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'MTM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'市值(台幣)(等於 MTM*FX)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'MTM_TWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未實現損益(原幣)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'PnL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'FX'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未實現損益(台幣)(等於 PnL*FX)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'PnL_TWD'
GO


