USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_EstRebate]    Script Date: 2017/2/6 下午 02:50:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_EstRebate](
	[ddate_w] [varchar](8) NOT NULL,
	[iagtID] [varchar](10) NOT NULL CONSTRAINT [DF_fn_fd_EstRebate_iagtID]  DEFAULT (''),
	[fdtype] [varchar](1) NOT NULL CONSTRAINT [DF_fn_fd_EstRebate_fdtype]  DEFAULT (''),
	[curtype] [varchar](1) NOT NULL,
	[amt] [decimal](20, 4) NOT NULL,
	[fdrate] [decimal](20, 6) NOT NULL,
	[int] [decimal](20, 4) NOT NULL CONSTRAINT [DF_fn_fd_EstRebate_accint]  DEFAULT ((0)),
	[icurid] [varchar](3) NOT NULL CONSTRAINT [DF_fn_fd_EstRebate_icurid]  DEFAULT (''),
	[actint] [decimal](20, 4) NOT NULL CONSTRAINT [DF_fn_fd_EstRebate_actint]  DEFAULT ((0)),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_EstRebate_systime]  DEFAULT (getdate()),
 CONSTRAINT [PK_fn_fd_EstRebate] PRIMARY KEY CLUSTERED 
(
	[ddate_w] ASC,
	[iagtID] ASC,
	[fdtype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基金公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_EstRebate', @level2type=N'COLUMN',@level2name=N'iagtID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基金類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_EstRebate', @level2type=N'COLUMN',@level2name=N'fdtype'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實際領取rebate利息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_EstRebate', @level2type=N'COLUMN',@level2name=N'int'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實際領取幣別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_EstRebate', @level2type=N'COLUMN',@level2name=N'icurid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_EstRebate', @level2type=N'COLUMN',@level2name=N'systime'
GO


