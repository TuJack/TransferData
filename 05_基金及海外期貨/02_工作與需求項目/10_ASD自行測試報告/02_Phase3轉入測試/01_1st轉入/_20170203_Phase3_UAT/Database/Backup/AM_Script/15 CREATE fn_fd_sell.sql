USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_sell]    Script Date: 2017/2/6 下午 04:15:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_sell](
	[itdNo] [varchar](26) NOT NULL,
	[ivID] [varchar](24) NULL,
	[ifund] [varchar](10) NOT NULL,
	[ifdID] [varchar](15) NOT NULL,
	[dtrans_w] [varchar](8) NOT NULL,
	[dacc_w] [varchar](8) NOT NULL,
	[dpay_w] [varchar](8) NOT NULL,
	[fstype] [varchar](1) NOT NULL,
	[ts_amt] [numeric](18, 6) NULL,
	[ts_qty] [numeric](15, 4) NULL,
	[pnav] [numeric](10, 4) NULL,
	[ts_hfee] [numeric](18, 6) NULL,
	[ts_tfee] [numeric](18, 6) NULL,
	[ts_msum] [numeric](18, 6) NULL,
	[icurid] [varchar](3) NULL,
	[dtrans_buy_w] [varchar](8) NULL,
	[dpnavs_w] [varchar](8) NULL,
	[batchid_ddate] [varchar](9) NULL,
	[batchid_pdate] [varchar](9) NULL,
	[AccountType] [varchar](10) NULL,
	[iagtid] [varchar](10) NULL,
	[ibank] [varchar](5) NULL,
	[CashAccount] [varchar](50) NULL,
	[mscost] [decimal](20, 4) NULL,
	[msdiv] [decimal](20, 4) NULL,
	[mscostTWD] [decimal](20, 4) NULL,
	[msdivTWD] [decimal](20, 4) NULL,
	[mscostCur] [decimal](20, 4) NULL,
	[msdivCur] [decimal](20, 4) NULL,
	[ddateTWDCurPrice] [decimal](20, 6) NULL,
	[dpayTWDCurPrice] [decimal](20, 6) NULL,
	[i_user_update] [varchar](20) NOT NULL,
	[time_update] [datetime] NOT NULL,
	[systime] [datetime] NOT NULL,
	[memo] [text] NOT NULL,
	[sub_itdno] [varchar](26) NULL,
	[ETSDecseq] [int] NULL,
	[settle_seqno] [varchar](13) NULL,
 CONSTRAINT [fn_fd_pk] PRIMARY KEY NONCLUSTERED 
(
	[itdNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_dtrans_w]  DEFAULT ('') FOR [dtrans_w]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_dacc_w]  DEFAULT ('') FOR [dacc_w]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_dpay_w]  DEFAULT ('') FOR [dpay_w]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_fstype]  DEFAULT ('1') FOR [fstype]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_dtrans_buy_w]  DEFAULT ('') FOR [dtrans_buy_w]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_dpnavs_w]  DEFAULT ('') FOR [dpnavs_w]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_mscostTWD]  DEFAULT ((0)) FOR [mscostTWD]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_mscostCur]  DEFAULT ((0)) FOR [mscostCur]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_ddateTWDCurPrice]  DEFAULT ((1)) FOR [ddateTWDCurPrice]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_dpayTWDCurPrice]  DEFAULT ((1)) FOR [dpayTWDCurPrice]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_i_user_update]  DEFAULT ('SYS') FOR [i_user_update]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_time_update]  DEFAULT (getdate()) FOR [time_update]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_systime]  DEFAULT (getdate()) FOR [systime]
GO

ALTER TABLE [dbo].[fn_fd_sell] ADD  CONSTRAINT [DF_fn_fd_sell_memo]  DEFAULT ('') FOR [memo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會計分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'AccountType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通路(預設基金公司)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'iagtid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'賣出成本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'mscost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'賣出成本台幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'mscostTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'賣出成本台幣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'mscostCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易日台幣匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'ddateTWDCurPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交割日台幣匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_sell', @level2type=N'COLUMN',@level2name=N'dpayTWDCurPrice'
GO


