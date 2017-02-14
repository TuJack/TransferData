USE [ETS_P]
GO

/****** Object:  Table [dbo].[ProposalData]    Script Date: 2017/2/2 ¤W¤È 10:44:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ProposalData](
	[Seq] [int] IDENTITY(1,1) NOT NULL,
	[Product] [varchar](10) NULL,
	[ProductID] [varchar](50) NULL,
	[Price] [decimal](24, 12) NULL,
	[Amount] [decimal](20, 8) NULL,
	[TotalValue] [decimal](24, 8) NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[RuleDescription] [nvarchar](max) NULL,
	[isCheck] [bit] NULL,
	[AccAmtDate] [date] NULL,
	[AddDate] [datetime] NULL,
	[AddUser] [varchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[CheckUser] [nchar](10) NULL,
	[Memo] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


