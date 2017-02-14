USE [ETS_P]
GO

/****** Object:  Table [dbo].[FofAccAmt]    Script Date: 2017/2/2 ¤U¤È 02:26:12 ******/
DROP TABLE [dbo].[FofAccAmt]
GO

/****** Object:  Table [dbo].[FofAccAmt]    Script Date: 2017/2/2 ¤U¤È 02:26:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FofAccAmt](
	[Seq] [int] IDENTITY(1,1) NOT NULL,
	[BTicker] [varchar](50) NULL,
	[BeginDate] [varchar](8) NULL,
	[BS] [varchar](1) NULL,
	[LatestAmt] [decimal](20, 2) NULL,
	[LatestShares] [decimal](20, 2) NULL,
	[Systime] [datetime] NULL CONSTRAINT [DF_FofAccAmt_Systime]  DEFAULT (getdate()),
	[IsDelete] [bit] NULL,
	[StoreDate] [varchar](8) NULL,
 CONSTRAINT [PK_FofAccAmt_new] PRIMARY KEY CLUSTERED 
(
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


