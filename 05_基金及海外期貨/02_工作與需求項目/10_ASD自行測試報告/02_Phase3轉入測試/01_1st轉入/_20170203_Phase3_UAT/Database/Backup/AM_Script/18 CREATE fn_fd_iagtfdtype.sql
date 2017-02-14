USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_iagtfdtype]    Script Date: 2017/2/6 ¤U¤È 02:34:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_iagtfdtype](
	[iagtid] [varchar](10) NOT NULL,
	[fdtype] [varchar](1) NOT NULL,
	[fdratekind] [varchar](1) NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_fdratekind]  DEFAULT ((1)),
	[fdrate] [decimal](6, 4) NOT NULL,
	[upper_amt] [decimal](18, 0) NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_upper_amt]  DEFAULT ((0)),
	[low_amt] [decimal](18, 0) NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_low_amt]  DEFAULT ((0)),
	[curtype] [varchar](1) NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_fdcurtype]  DEFAULT ('1'),
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_fn_fd_iagtfdtype_memo]  DEFAULT (''),
 CONSTRAINT [PK_fn_fd_iagtfdtype] PRIMARY KEY CLUSTERED 
(
	[iagtid] ASC,
	[fdtype] ASC,
	[fdratekind] ASC,
	[upper_amt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


