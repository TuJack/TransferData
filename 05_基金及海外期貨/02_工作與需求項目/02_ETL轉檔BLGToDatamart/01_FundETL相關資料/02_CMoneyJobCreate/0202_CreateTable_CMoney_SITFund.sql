USE [CMoney]
GO

/****** Object:  Table [dbo].[Cmoney_Com]    Script Date: 2016/12/22 ¤W¤È 10:06:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMoney_SITFund](
	[YYYY] [nvarchar](20) NULL,
	[Fundid] [nvarchar](20) NOT NULL,
	[cname] [nvarchar](150) NULL,
	[ename] [nvarchar](150) NULL,
	[isin] [nvarchar](50) NULL,
	[sitid] [nvarchar](6) NULL,
	[sitcname] [nvarchar](20) NULL,
	[issueDate] [datetime] NULL,
	[fundsize] [decimal](10,4) NULL,
	[modifydate] [datetime] NULL CONSTRAINT [DF_Cmoney_SITFund_modifydate]  DEFAULT (getdate())
 CONSTRAINT [PK_Cmoney_SITFund] PRIMARY KEY NONCLUSTERED 
(
	[Fundid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


