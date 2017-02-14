USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_rebate]    Script Date: 2017/2/6 �U�� 02:36:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_rebate](
	[itdNO] [varchar](26) NOT NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[ifund] [varchar](12) NOT NULL,
	[iagtID] [varchar](10) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_iagtID]  DEFAULT (''),
	[fdtype] [varchar](10) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_fdtype]  DEFAULT (''),
	[act_accint] [decimal](20, 4) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_act_accint]  DEFAULT ((0)),
	[icurid_receive] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_icurid_receive]  DEFAULT (''),
	[act_accint_receive] [decimal](20, 4) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_act_accint_receive]  DEFAULT ((0)),
	[mfee] [decimal](10, 2) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_mfee]  DEFAULT ((0)),
	[dstart_w] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_diagtdate_w]  DEFAULT (''),
	[dend_w] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_rebate_dend_w]  DEFAULT (''),
	[batchid_pdate] [varchar](9) NULL,
	[AccountType] [varchar](10) NULL CONSTRAINT [DF_fn_fd_diagtsale_AccountType]  DEFAULT (''),
	[ibank] [varchar](5) NULL CONSTRAINT [DF_fn_fd_diagtsale_ibank]  DEFAULT (''),
	[CashAccount] [varchar](50) NULL CONSTRAINT [DF_fn_fd_diagtsale_CashAccount]  DEFAULT (''),
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_fn_fd_diagtsale_memo]  DEFAULT (''),
	[sub_itdNO] [varchar](26) NOT NULL,
 CONSTRAINT [PK_fn_fd_diagtsale] PRIMARY KEY CLUSTERED 
(
	[itdNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������s��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'itdNO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'ddate_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'portfolio�N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'ifund'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������q' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'iagtID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'fdtype'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ڻ��rebate�Q��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'act_accint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ڻ�����O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'icurid_receive'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ڻ�����B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'act_accint_receive'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�׶O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'mfee'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�R�P�Q����Ǥ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'dstart_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�R�P�Q����Ǥ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'dend_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�|�p����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'AccountType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ȧ�N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'ibank'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�b��N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'CashAccount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��s��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'i_user_update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��s�ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'time_update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�إ߮ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'systime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'memo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�l��������s��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_rebate', @level2type=N'COLUMN',@level2name=N'sub_itdNO'
GO


