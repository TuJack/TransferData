USE [ETS_P]
GO

/****** Object:  Table [dbo].[ProposalDataDec]    Script Date: 2017/2/2 ¤W¤È 10:44:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ProposalDataDec](
	[Seq] [int] IDENTITY(1,1) NOT NULL,
	[ProposalSeq] [int] NULL,
	[DecSeq] [int] NULL,
	[Value] [decimal](24, 8) NULL,
	[ModifiedTime] [datetime] NULL,
	[IsDelete] [bit] NULL,
	[DeleteUser] [varchar](50) NULL,
	[Reason] [varchar](400) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


