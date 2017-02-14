USE [isdbTGL]
GO
/****** Object:  Table [dbo].[cm_broker_SSI_tmp]    Script Date: 2017/02/09 ¤W¤È 10:27:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cm_broker_SSI_tmp](
	[seqno] [bigint] IDENTITY(1,1) NOT NULL,
	[itdNO] [varchar](12) NOT NULL,
	[edit_mode] [varchar](10) NOT NULL,
	[classcod] [varchar](10) NOT NULL,
	[iagt] [varchar](5) NOT NULL,
	[settleplace] [varchar](50) NOT NULL,
	[icurid] [varchar](5) NOT NULL,
	[ClearAgentType] [varchar](5) NOT NULL,
	[ClearAgentCode] [varchar](50) NOT NULL,
	[ClearAgentName] [varchar](100) NULL,
	[CounterPartyBIC] [varchar](50) NOT NULL,
	[CounterPartyType] [varchar](5) NOT NULL,
	[CounterPartyName] [varchar](100) NOT NULL,
	[AClearingCode] [varchar](50) NOT NULL,
	[AClearingName] [varchar](100) NOT NULL,
	[InterCustodianType] [varchar](15) NOT NULL,
	[InterCustodianCode] [varchar](50) NOT NULL,
	[InterCustodianName] [varchar](100) NOT NULL,
	[i_user_update] [varchar](20) NULL,
	[time_update] [datetime] NULL,
	[systime] [datetime] NULL,
	[checker] [varchar](20) NULL,
	[checktime] [datetime] NULL,
	[instructions] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


