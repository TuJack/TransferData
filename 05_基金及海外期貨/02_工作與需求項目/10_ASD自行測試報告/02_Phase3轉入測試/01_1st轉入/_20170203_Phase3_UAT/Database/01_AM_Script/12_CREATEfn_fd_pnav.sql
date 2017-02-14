USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_pnav]    Script Date: 2017/2/6 �U�� 04:19:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_pnav](
	[classcod] [varchar](10) NULL,
	[ifdID] [varchar](15) NOT NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[pnav] [decimal](10, 4) NULL,
	[i_user_update] [varchar](20) NOT NULL,
	[time_update] [datetime] NOT NULL,
	[systime] [datetime] NOT NULL,
	[memo] [text] NOT NULL,
 CONSTRAINT [PK_fn_fd_pnav_1] PRIMARY KEY CLUSTERED 
(
	[ifdID] ASC,
	[ddate_w] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[fn_fd_pnav] ADD  CONSTRAINT [DF_fn_fd_pnav_classcod]  DEFAULT ('FOF') FOR [classcod]
GO

ALTER TABLE [dbo].[fn_fd_pnav] ADD  CONSTRAINT [DF_fn_fd_pnav_i_user_update]  DEFAULT ('SYS') FOR [i_user_update]
GO

ALTER TABLE [dbo].[fn_fd_pnav] ADD  CONSTRAINT [DF_fn_fd_pnav_time_update]  DEFAULT (getdate()) FOR [time_update]
GO

ALTER TABLE [dbo].[fn_fd_pnav] ADD  CONSTRAINT [DF_fn_fd_pnav_systime]  DEFAULT (getdate()) FOR [systime]
GO

ALTER TABLE [dbo].[fn_fd_pnav] ADD  CONSTRAINT [DF_fn_fd_pnav_memo]  DEFAULT ('') FOR [memo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������νs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_pnav', @level2type=N'COLUMN',@level2name=N'ifdID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�b�Ȥ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_pnav', @level2type=N'COLUMN',@level2name=N'ddate_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����b��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_pnav', @level2type=N'COLUMN',@level2name=N'pnav'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SYS:�t�νƻs�e��
 Lip:Lipper
  BlgEnd:Bloomberg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_pnav', @level2type=N'COLUMN',@level2name=N'i_user_update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��s�ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_pnav', @level2type=N'COLUMN',@level2name=N'time_update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s�W�ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_pnav', @level2type=N'COLUMN',@level2name=N'systime'
GO


