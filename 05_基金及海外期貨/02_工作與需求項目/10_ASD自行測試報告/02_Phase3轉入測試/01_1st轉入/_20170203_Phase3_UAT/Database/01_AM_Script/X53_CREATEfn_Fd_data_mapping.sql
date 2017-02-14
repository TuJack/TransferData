USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_Fd_data_mapping]    Script Date: 2017/2/9 ¤U¤È 06:29:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_Fd_data_mapping](
	[ifdid] [varchar](20) NOT NULL,
	[ifdname] [varchar](150) NULL,
	[MoneyDJCode] [varchar](20) NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[i_user_udpate] [varchar](20) NOT NULL CONSTRAINT [DF_fn_Fd_data_mapping_i_user_udpate]  DEFAULT ('SYS'),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_Fd_data_mapping_systime]  DEFAULT (getdate()),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_Fd_data_mapping_time_update]  DEFAULT (getdate()),
 CONSTRAINT [PK_fn_Fd_data_mapping] PRIMARY KEY CLUSTERED 
(
	[ifdid] ASC,
	[ddate_w] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


