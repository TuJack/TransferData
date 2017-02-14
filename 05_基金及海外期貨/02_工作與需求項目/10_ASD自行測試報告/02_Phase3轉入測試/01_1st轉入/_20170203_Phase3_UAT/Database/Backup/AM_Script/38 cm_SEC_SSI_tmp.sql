USE [isdbTGL]
GO
/****** Object:  Table [dbo].[cm_SEC_SSI_tmp]    Script Date: 2017/02/09 ¤W¤È 10:28:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cm_SEC_SSI_tmp](
	[seqno] [bigint] IDENTITY(1,1) NOT NULL,
	[itdNO] [varchar](12) NOT NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_itdNO]  DEFAULT (''),
	[edit_mode] [varchar](1) NULL,
	[classcod] [varchar](10) NOT NULL,
	[iagt] [varchar](5) NOT NULL,
	[ACName] [varchar](100) NOT NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_ACName]  DEFAULT (''),
	[ActNO] [varchar](50) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_ActNO]  DEFAULT (''),
	[ACName_HK] [varchar](50) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_ACName_HK]  DEFAULT (''),
	[ActNO_HK] [varchar](50) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_ActNO_HK]  DEFAULT (''),
	[AttnName] [varchar](50) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_AttnName]  DEFAULT (''),
	[Tel] [varchar](50) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_Tel]  DEFAULT (''),
	[Fax] [varchar](50) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_Fax]  DEFAULT (''),
	[MarketName] [varchar](50) NOT NULL,
	[AClearingCode] [varchar](50) NOT NULL,
	[settleplace] [varchar](50) NOT NULL,
	[Sub_Custodian] [varchar](50) NOT NULL,
	[icurid] [varchar](5) NOT NULL,
	[ibank] [varchar](5) NULL,
	[ibank_TGL] [varchar](20) NULL,
	[instructions] [varchar](max) NULL,
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_systime]  DEFAULT (getdate()),
	[checker] [varchar](20) NULL,
	[checktime] [datetime] NULL,
	[CashActno] [varchar](20) NULL CONSTRAINT [DF_cm_SEC_SSI_tmp_CashActno]  DEFAULT (''),
 CONSTRAINT [PK_cm_SEC_SSI_tmp] PRIMARY KEY CLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


