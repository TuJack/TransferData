USE [isdbTGL]
GO

/****** Object:  Table [dbo].[TAB_RMD_DFTS]    Script Date: 2017/2/9 �W�� 11:44:55 ******/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����|��sheet�Asheet�W�٤��O��Indicies�BBonds�BForex�BCommodities' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'sheetType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�b��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Trader'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�{�f�Ъ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Underlying'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�^�եN�X1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Ticker'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�^�եN�X1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'BBG'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'ContractMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���槡��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Cost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BUY=B,SELL=S' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'BS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'CostDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Currency'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Mkt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�f��(�YBS��B���欰���ȡA�YBS�欰S���欰�t��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Lot'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'ContractValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����. ���� Cost*Lot*ContractValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���� Lot*ContractValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'Qty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���� (���� Mkt*Qty)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'MTM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����(�x��)(���� MTM*FX)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'MTM_TWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����{�l�q(���)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'PnL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ײv' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'FX'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����{�l�q(�x��)(���� PnL*FX)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFTS', @level2type=N'COLUMN',@level2name=N'PnL_TWD'
GO


