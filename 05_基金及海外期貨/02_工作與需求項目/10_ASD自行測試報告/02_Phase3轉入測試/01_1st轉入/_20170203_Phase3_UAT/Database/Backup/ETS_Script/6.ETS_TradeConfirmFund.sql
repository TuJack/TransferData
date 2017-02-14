USE [ETS_P]
GO



/****** Object:  Table [dbo].[TradeConfirmFund]    Script Date: 2017/2/2 下午 02:02:04 ******/
DROP TABLE [dbo].[TradeConfirmFund]
GO

/****** Object:  Table [dbo].[TradeConfirmFund]    Script Date: 2017/2/2 下午 02:02:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TradeConfirmFund](
	[Seq] [int] IDENTITY(1,1) NOT NULL,
	[DecSeq] [int] NULL,
	[Commission] [decimal](18, 6) NULL,
	[PostalFee] [decimal](18, 6) NULL,
	[RemitDate] [date] NULL,
	[EffectiveDate] [date] NULL,
	[SettleDate] [date] NULL,
	[SettleAmount] [decimal](18, 4) NULL,
	[SettleUnits] [decimal](18, 4) NULL,
	[PNAVDate] [date] NULL,
	[PNAV] [decimal](18, 6) NULL,
	[Fax] [varchar](500) NULL,
	[ContactName] [varchar](500) NULL,
	[Tel] [varchar](500) NULL,
	[EMail] [varchar](100) NULL,
	[Memo] [varchar](2000) NULL,
	[PrintUse] [bit] NULL,
	[OtherDoc] [bit] NULL,
	[FromImagt] [varchar](5) NULL,
	[FromIagtId] [varchar](5) NULL,
	[FromAct] [varchar](20) NULL,
	[FromNAct] [varchar](100) NULL,
	[PayImagt] [varchar](10) NULL,
	[PayIagt] [varchar](4) NULL,
	[PayBranchName] [varchar](100) NULL,
	[PayActNo] [varchar](20) NULL,
	[PayActName] [varchar](100) NULL,
	[Message] [varchar](500) NULL,
	[IsExported] [bit] NULL,
	[RUser] [varchar](50) NULL,
	[RDT] [datetime] NULL,
	[MUser] [varchar](50) NULL,
	[MDT] [datetime] NULL,
	[TransAmount] [decimal](18, 4) NULL,
	[Interest] [decimal](18, 4) NULL,
	[Fee] [decimal](18, 4) NULL,
	[Cost] [decimal](18, 4) NULL,
	[Capital] [decimal](18, 4) NULL,
	[RepayPrinciple] [decimal](18, 4) NULL,
	[settle_seqno] [varchar](12) NULL,
 CONSTRAINT [PK_TradeConfirmFund_new1] PRIMARY KEY CLUSTERED 
(
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'領息(PE Fund使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TradeConfirmFund', @level2type=N'COLUMN',@level2name=N'Interest'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'費用(PE Fund使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TradeConfirmFund', @level2type=N'COLUMN',@level2name=N'Fee'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成本(PE Fund使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TradeConfirmFund', @level2type=N'COLUMN',@level2name=N'Cost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Redrawable Capital(PE Fund使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TradeConfirmFund', @level2type=N'COLUMN',@level2name=N'Capital'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'還本(PE Fund使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TradeConfirmFund', @level2type=N'COLUMN',@level2name=N'RepayPrinciple'
GO


