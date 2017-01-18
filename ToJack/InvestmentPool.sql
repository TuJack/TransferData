USE [ETS_P]
GO

/****** Object:  Table [dbo].[InvestmentPool]    Script Date: 2017/1/17 ¤U¤È 02:45:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[InvestmentPool](
	[FundType] [varchar](2) NOT NULL,
	[FundID] [varchar](10) NOT NULL,
	[ProductType] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[BType] [varchar](20) NULL,
	[ProductID] [varchar](20) NOT NULL,
	[SetDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ModifyUser] [varchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_InvestmentPoolnewNewTest] PRIMARY KEY CLUSTERED 
(
	[FundType] ASC,
	[FundID] ASC,
	[ProductType] ASC,
	[Product] ASC,
	[ProductID] ASC,
	[SetDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


