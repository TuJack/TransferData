USE [isdbTGL]
GO

/****** Object:  Table [dbo].[Tmpfn_dfd99]    Script Date: 2017/2/6 下午 02:02:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tmpfn_dfd99](
	[ifund] [varchar](10) NOT NULL,
	[ifdID] [varchar](15) NOT NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[q_qty] [decimal](15, 4) NULL,
	[mcost] [decimal](18, 6) NULL,
	[mamt] [decimal](18, 6) NULL,
	[mscost] [decimal](18, 6) NULL,
	[mprft] [decimal](18, 6) NULL,
	[urprft] [decimal](18, 6) NULL,
	[icurid] [varchar](4) NULL,
	[dpnav_w] [varchar](8) NULL,
	[pnav] [numeric](10, 4) NULL,
	[AccountType] [varchar](10) NOT NULL,
	[Iagtid] [varchar](10) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_Iagtid]  DEFAULT (''),
	[mcostTWD] [decimal](18, 6) NULL,
	[mcostCur] [decimal](18, 6) NULL,
	[mamtTWD] [decimal](18, 6) NULL,
	[mamtCur] [decimal](18, 6) NULL,
	[mscostTWD] [decimal](18, 6) NULL,
	[mscostCur] [decimal](18, 6) NULL,
	[mprftTWD] [decimal](18, 6) NULL,
	[mprftCur] [decimal](18, 6) NULL,
	[mprftCurTwD] [decimal](18, 6) NULL,
	[mdcost1] [decimal](18, 6) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_mdcost1]  DEFAULT ((0)),
	[mdcost2] [decimal](18, 6) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_mdcost2]  DEFAULT ((0)),
	[mdcost3] [decimal](18, 6) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_mdcost3]  DEFAULT ((0)),
	[mdcost1TWD] [decimal](18, 6) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_mdcost11TWD]  DEFAULT ((0)),
	[mdcost2TWD] [decimal](18, 6) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_mdcost2TWD]  DEFAULT ((0)),
	[mdcost3TWD] [decimal](18, 6) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_mdcost3TWD]  DEFAULT ((0)),
	[TWDcurprice] [decimal](20, 6) NULL CONSTRAINT [DF_Tmpfn_dfd99_TWDcurprice]  DEFAULT ((1)),
	[classcod] [varchar](10) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_classcod]  DEFAULT ('FOF'),
	[i_user_update] [varchar](4) NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_i_user_update]  DEFAULT ('SYS'),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_Tmpfn_dfd99_memo]  DEFAULT (''),
 CONSTRAINT [PK_Tmpfn_dfd99] PRIMARY KEY CLUSTERED 
(
	[ifund] ASC,
	[ifdID] ASC,
	[ddate_w] ASC,
	[AccountType] ASC,
	[Iagtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基金/代操 代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'ifund'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投資基金統編' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'ifdID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'ddate_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存單位數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'q_qty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存交易成本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mcost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存市價交易幣總額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mamt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本日贖回交易成本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mscost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本日已實現損益' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mprft'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存未實現損益' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'urprft'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幣別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'icurid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'評價淨值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'pnav'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會計分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'AccountType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基金公司代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'Iagtid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存成本台幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mcostTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存成本原幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mcostCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存市價台幣總額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mamtTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存市價原幣總額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mamtCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本日贖回交易成本台幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mscostTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本日贖回交易成本原幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mscostCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本日已實現損益台幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mprftTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本日已實現損益原幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mprftCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'台幣匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'TWDcurprice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投資渠道代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'classcod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'i_user_update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'systime'
GO


