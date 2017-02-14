USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_buy]    Script Date: 2017/2/6 下午 04:13:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_buy](
	[itdNo] [varchar](26) NOT NULL,
	[ivID] [varchar](24) NULL,
	[ifund] [varchar](10) NOT NULL,
	[ifdID] [varchar](15) NOT NULL,
	[dtrans_w] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_buy_dtrans]  DEFAULT (''),
	[dacc_w] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_buy_dacc]  DEFAULT (''),
	[tb_amt] [numeric](18, 6) NULL,
	[tb_qty] [numeric](15, 4) NULL,
	[pnav] [numeric](10, 4) NULL,
	[tb_hfee] [numeric](18, 6) NULL,
	[tb_tfee] [numeric](18, 6) NULL,
	[tb_msum] [numeric](18, 6) NULL,
	[icurid] [varchar](3) NULL CONSTRAINT [DF_fn_fd_buy_icurid]  DEFAULT ('NTD'),
	[dpay_w] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_buy_dpay]  DEFAULT (''),
	[kind] [varchar](2) NOT NULL CONSTRAINT [DF_fn_fd_buy_kind]  DEFAULT ('1'),
	[dpnavb_w] [varchar](8) NULL CONSTRAINT [DF_fn_fd_buy_dpnavb_w]  DEFAULT (''),
	[batchid_ddate] [varchar](9) NULL,
	[batchid_pdate] [varchar](9) NULL,
	[AccountType] [varchar](10) NULL,
	[iagtid] [varchar](10) NULL,
	[ibank] [varchar](5) NULL,
	[CashAccount] [varchar](50) NULL,
	[msumTWD] [decimal](20, 4) NULL,
	[msumCur] [decimal](20, 4) NULL,
	[ddateTWDCurPrice] [decimal](20, 6) NULL CONSTRAINT [DF_fn_fd_buy_ddateTWDCurPrice]  DEFAULT ((1)),
	[dpayTWDCurPrice] [decimal](20, 6) NULL CONSTRAINT [DF_fn_fd_buy_dpayTWDCurPrice]  DEFAULT ((1)),
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_fn_fd_buy_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_buy_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_buy_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL,
	[sub_itdno] [varchar](26) NULL,
	[ETSDecseq] [int] NULL,
	[settle_seqno] [varchar](12) NULL,
	[fstype] [varchar](1) NULL,
 CONSTRAINT [PK_fn_fd_buy] PRIMARY KEY CLUSTERED 
(
	[itdNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會計分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_buy', @level2type=N'COLUMN',@level2name=N'AccountType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通路(預設基金公司)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_buy', @level2type=N'COLUMN',@level2name=N'iagtid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交割日台幣匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_buy', @level2type=N'COLUMN',@level2name=N'dpayTWDCurPrice'
GO


