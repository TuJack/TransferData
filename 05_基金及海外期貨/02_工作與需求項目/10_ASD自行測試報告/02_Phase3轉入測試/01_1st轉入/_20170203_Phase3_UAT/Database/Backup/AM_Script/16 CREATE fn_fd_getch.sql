USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_getch]    Script Date: 2017/2/6 下午 04:22:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_getch](
	[itdNo] [varchar](26) NOT NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[ifund] [varchar](10) NOT NULL,
	[ifdID] [varchar](15) NOT NULL,
	[mcash] [decimal](20, 4) NULL,
	[mtax] [decimal](20, 4) NULL,
	[mfee] [decimal](20, 4) NULL,
	[msum] [decimal](20, 4) NULL,
	[icurid] [varchar](3) NULL,
	[Iaccdate_w] [varchar](8) NULL,
	[div_rate] [decimal](20, 6) NULL,
	[f_invest] [varchar](1) NULL,
	[Iagtid] [varchar](10) NULL,
	[msumTWD] [decimal](20, 4) NULL,
	[msumCur] [decimal](20, 4) NULL,
	[ddateTWDCurPrice] [decimal](20, 6) NULL CONSTRAINT [DF_fn_fd_getch_ddateTWDCurPrice]  DEFAULT ((1)),
	[dpayTWDCurPrice] [decimal](20, 6) NULL CONSTRAINT [DF_fn_fd_getch_dpayTWDCurPrice]  DEFAULT ((1)),
	[batchid_ddate] [varchar](9) NULL,
	[batchid_pdate] [varchar](9) NULL,
	[AccountType] [varchar](10) NULL,
	[ibank] [varchar](5) NULL,
	[CashAccount] [varchar](50) NULL,
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_Fn_fd_getch_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_Fn_fd_getch_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_Fn_fd_getch_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_Fn_fd_getch_memo]  DEFAULT (''),
	[sub_itdno] [varchar](26) NULL,
 CONSTRAINT [PK_Fn_fd_getch] PRIMARY KEY CLUSTERED 
(
	[itdNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易日台幣匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_getch', @level2type=N'COLUMN',@level2name=N'ddateTWDCurPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易日台幣匯率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_getch', @level2type=N'COLUMN',@level2name=N'dpayTWDCurPrice'
GO


