USE [isdbTGL]
GO

/****** Object:  Table [dbo].[Log_fn_fd_com]    Script Date: 2017/2/6 ¤U¤È 04:45:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Log_fn_fd_com](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](1) NOT NULL CONSTRAINT [DF_Log_fn_fd_com_status]  DEFAULT (''),
	[id] [varchar](50) NOT NULL,
	[col] [varchar](100) NOT NULL CONSTRAINT [DF_Log_fn_fd_com_col]  DEFAULT (''),
	[ori_val] [varchar](200) NOT NULL CONSTRAINT [DF_Log_fn_fd_com_ori_val]  DEFAULT (''),
	[new_val] [varchar](200) NOT NULL CONSTRAINT [DF_Log_fn_fd_com_new_val]  DEFAULT (''),
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_Log_fn_fd_com_i_user_update]  DEFAULT (''),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_Log_fn_fd_com_systime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Log_fn_fd_com] PRIMARY KEY CLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


