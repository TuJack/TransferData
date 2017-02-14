USE [isdbTGL]
GO

/****** Object:  Table [dbo].[log_fn_fd_data]    Script Date: 2017/2/7 ¤U¤È 05:50:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[log_fn_fd_data](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](1) NOT NULL,
	[id] [varchar](50) NULL,
	[col] [varchar](100) NOT NULL,
	[ori_val] [varchar](200) NOT NULL,
	[new_val] [varchar](200) NOT NULL,
	[i_user_update] [varchar](20) NOT NULL,
	[systime] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


