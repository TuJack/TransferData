USE [CMoney]
GO

/****** Object:  Table [dbo].[Cmoney_Com]    Script Date: 2016/12/22 ¤W¤È 10:06:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMoney_SIT](
	[YYYY] [nvarchar](20) ,
	[sitid] [nvarchar](6) NOT NULL,
	[cname] [nvarchar](150) NULL,
	[ename] [nvarchar](150) NULL,
	[IncopratedDate] [datetime] NULL,
	[chairman] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[fax] [nvarchar](20) NULL,
	[Com_No] [nvarchar](10) NULL,
	[modifydate] [datetime] NULL CONSTRAINT [DF_Cmoney_SIT_modifydate]  DEFAULT (getdate())
 CONSTRAINT [PK_Cmoney_SIT] PRIMARY KEY NONCLUSTERED 
(
	[sitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


