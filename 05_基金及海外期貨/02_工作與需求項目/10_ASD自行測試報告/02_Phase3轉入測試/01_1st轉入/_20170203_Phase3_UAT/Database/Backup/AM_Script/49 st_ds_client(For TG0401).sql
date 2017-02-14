USE [isdbTGL]
GO

/****** Object:  Table [dbo].[st_ds_client]    Script Date: 2017/2/7 ¤U¤È 05:52:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[st_ds_client](
	[ds_ifund] [varchar](12) NOT NULL,
	[iagtid] [varchar](5) NOT NULL,
	[st_iclient_cd] [varchar](35) NULL,
	[ifund_iagtiid] [varchar](10) NULL,
	[i_user_update] [varchar](4) NULL,
	[time_update] [datetime] NULL,
	[systime] [datetime] NULL,
	[memo] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


