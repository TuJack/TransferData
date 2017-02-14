USE [isdbTGL]
GO
/****** Object:  Table [dbo].[cm_MarketName_tmp]    Script Date: 2017/02/09 ¤W¤È 10:27:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cm_MarketName_tmp](
	[seqno] [bigint] IDENTITY(1,1) NOT NULL,
	[itdNO] [varchar](12) NOT NULL,
	[edit_mode] [varchar](1) NULL,
	[ibank] [varchar](5) NULL CONSTRAINT [DF_cm_MarketName_tmp_ibank]  DEFAULT (''),
	[MarketName] [varchar](50) NOT NULL,
	[BICCode] [varchar](50) NOT NULL,
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_cm_MarketName_tmp_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_cm_MarketName_tmp_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_cm_MarketName_tmp_systime]  DEFAULT (getdate()),
	[checker] [varchar](20) NULL,
	[checktime] [datetime] NULL,
 CONSTRAINT [PK_cm_MarketName_tmp] PRIMARY KEY CLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


