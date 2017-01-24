USE [Bloomberg]
GO

/****** Object:  Table [dbo].[FundPrice]    Script Date: 2017/1/24 ¤W¤È 09:26:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FundPrice](
	[iFdID] [nvarchar](20) NOT NULL,
	[DDate] [datetime] NOT NULL,
	[OpenPrice] [numeric](21, 6) NULL,
	[LastPrice] [numeric](21, 6) NULL,
	[HighPrice] [numeric](21, 6) NULL,
	[LowPrice] [numeric](21, 6) NULL,
	[Change1D] [numeric](21, 6) NULL,
	[LastVolume] [numeric](21, 6) NULL,
	[Eqy_Divid_Yield_12M] [numeric](21, 6) NULL,
	[systime] [datetime] NULL CONSTRAINT [DF_FundPrice_systime]  DEFAULT (getdate()),
 CONSTRAINT [PK_FundPrice] PRIMARY KEY CLUSTERED 
(
	[iFdID] ASC,
	[DDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


