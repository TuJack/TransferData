USE [CMoney]
GO

/****** Object:  Table [dbo].[CMoney_SITFund]    Script Date: 2017/2/13 ¤U¤È 02:00:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CMoney_SITFund](
	[YYYY] [nvarchar](20) NOT NULL CONSTRAINT [DF_CMoney_SITFund_YYYY]  DEFAULT (''),
	[Fundid] [nvarchar](20) NOT NULL,
	[cname] [nvarchar](150) NULL,
	[ename] [nvarchar](150) NULL,
	[isin] [nvarchar](50) NULL,
	[sitid] [nvarchar](6) NULL,
	[sitcname] [nvarchar](20) NULL,
	[issueDate] [datetime] NULL,
	[fundsize] [decimal](10, 4) NULL,
	[modifydate] [datetime] NULL CONSTRAINT [DF_Cmoney_SITFund_modifydate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Cmoney_SITFund] PRIMARY KEY NONCLUSTERED 
(
	[YYYY] ASC,
	[Fundid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


