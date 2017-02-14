USE [ETS_P]
GO

/****** Object:  Table [dbo].[FofAccAmtDec]    Script Date: 2017/2/2 ¤U¤È 02:26:46 ******/
DROP TABLE [dbo].[FofAccAmtDec]
GO

/****** Object:  Table [dbo].[FofAccAmtDec]    Script Date: 2017/2/2 ¤U¤È 02:26:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FofAccAmtDec](
	[Seq] [int] IDENTITY(1,1) NOT NULL,
	[BTicker] [varchar](50) NULL,
	[BeginDate] [varchar](8) NULL,
	[BS] [varchar](1) NULL,
	[AddAmt] [decimal](20, 2) NULL,
	[AddShares] [decimal](20, 2) NULL,
	[TotalAmt] [decimal](20, 2) NULL,
	[TotalShares] [decimal](20, 2) NULL,
	[DecSeq] [int] NULL,
	[Systime] [datetime] NULL,
	[IsDelete] [bit] NULL,
	[d_use] [bit] NULL,
	[FileName] [varchar](100) NULL,
	[d_Seq] [int] NULL,
	[TWDRate] [decimal](18, 7) NULL,
	[RateDate] [varchar](8) NULL,
 CONSTRAINT [PK_FofAccAmtDec_New] PRIMARY KEY CLUSTERED 
(
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


