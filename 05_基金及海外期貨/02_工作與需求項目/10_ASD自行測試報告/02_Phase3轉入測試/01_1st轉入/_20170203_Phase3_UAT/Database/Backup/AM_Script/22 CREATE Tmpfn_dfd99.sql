USE [isdbTGL]
GO

/****** Object:  Table [dbo].[Tmpfn_dfd99]    Script Date: 2017/2/6 �U�� 02:02:33 ******/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���/�N�� �N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'ifund'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������νs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'ifdID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'ddate_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'q_qty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mcost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s����������`�B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mamt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ū�^�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mscost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����w��{�l�q' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mprft'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s����{�l�q' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'urprft'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'icurid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����b��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'pnav'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�|�p����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'AccountType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������q�N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'Iagtid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s�����x��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mcostTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mcostCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s�����x���`�B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mamtTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s��������`�B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mamtCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ū�^��������x��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mscostTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ū�^����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mscostCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����w��{�l�q�x��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mprftTWD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����w��{�l�q���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'mprftCur'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�x���ײv' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'TWDcurprice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����D�N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'classcod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��s��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'i_user_update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s�W�ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tmpfn_dfd99', @level2type=N'COLUMN',@level2name=N'systime'
GO


