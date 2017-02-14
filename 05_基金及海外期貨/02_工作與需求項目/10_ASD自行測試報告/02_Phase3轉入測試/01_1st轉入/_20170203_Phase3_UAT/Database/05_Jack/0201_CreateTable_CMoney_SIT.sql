USE [CMoney]
GO

/****** Object:  Table [dbo].[CMoney_SIT]    Script Date: 2017/2/13 ¤U¤È 01:59:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CMoney_SIT](
	[YYYY] [nvarchar](20) NOT NULL CONSTRAINT [DF_CMoney_SIT_YYYY]  DEFAULT (''),
	[sitid] [nvarchar](6) NOT NULL,
	[cname] [nvarchar](150) NULL,
	[ename] [nvarchar](150) NULL,
	[IncopratedDate] [datetime] NULL,
	[chairman] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[fax] [nvarchar](20) NULL,
	[Com_No] [nvarchar](10) NULL,
	[modifydate] [datetime] NULL CONSTRAINT [DF_Cmoney_SIT_modifydate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Cmoney_SIT] PRIMARY KEY NONCLUSTERED 
(
	[YYYY] ASC,
	[sitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


