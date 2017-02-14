USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_com]    Script Date: 2017/2/6 ¤U¤È 04:18:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_com](
	[iagtid] [varchar](5) NOT NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[compno] [varchar](10) NULL,
	[manage_asset] [decimal](18, 0) NULL,
	[dbuild_w] [varchar](8) NULL,
	[isRegister] [varchar](1) NULL CONSTRAINT [DF_fn_fd_com_isRegister]  DEFAULT ('N'),
	[attn] [varchar](50) NULL,
	[com_tel] [varchar](40) NULL,
	[com_fax] [varchar](40) NULL,
	[cc] [varchar](50) NULL,
	[cctel] [varchar](40) NULL,
	[ccfax] [varchar](40) NULL,
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_fn_fd_com_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_com_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_com_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_fn_fd_com_memo]  DEFAULT (''),
 CONSTRAINT [PK_fn_fd_com] PRIMARY KEY CLUSTERED 
(
	[iagtid] ASC,
	[ddate_w] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


