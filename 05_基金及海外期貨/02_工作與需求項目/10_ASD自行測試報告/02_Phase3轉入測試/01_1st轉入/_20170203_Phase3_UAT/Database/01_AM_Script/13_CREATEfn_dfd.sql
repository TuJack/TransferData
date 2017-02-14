USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_dfd]    Script Date: 2017/2/13 ¤W¤È 09:57:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_dfd](
	[ifund] [varchar](10) NOT NULL,
	[ifdID] [varchar](15) NOT NULL,
	[ddate_w] [varchar](8) NOT NULL,
	[q_qty] [decimal](15, 4) NULL,
	[mcost] [decimal](18, 6) NULL,
	[mamt] [decimal](18, 6) NULL,
	[mscost] [decimal](18, 6) NULL,
	[mprft] [decimal](18, 6) NULL,
	[urprft] [decimal](18, 6) NULL,
	[icurid] [varchar](3) NULL,
	[dpnav_w] [varchar](8) NULL,
	[pnav] [decimal](10, 4) NULL,
	[AccountType] [varchar](10) NOT NULL,
	[Iagtid] [varchar](5) NOT NULL,
	[¢õcostTWD] [decimal](18, 6) NULL,
	[¢õcostCur] [decimal](18, 6) NULL,
	[mamtTWD] [decimal](18, 6) NULL,
	[mamtCur] [decimal](18, 6) NULL,
	[mscostTWD] [decimal](18, 6) NULL,
	[mscostCur] [decimal](18, 6) NULL,
	[mprftTWD] [decimal](18, 6) NULL,
	[mprftCur] [decimal](18, 6) NULL,
	[mprftCurTWD] [decimal](20, 4) NULL,
	[mdcost1] [decimal](18, 6) NULL,
	[mdcost2] [decimal](18, 6) NULL,
	[mdcost3] [decimal](18, 6) NULL,
	[mdcost1TWD] [decimal](18, 6) NULL,
	[mdcost2TWD] [decimal](18, 6) NULL,
	[mdcost3TWD] [decimal](18, 6) NULL,
	[TWDcurprice] [decimal](20, 6) NULL,
	[classcod] [varchar](10) NOT NULL,
	[i_user_update] [varchar](20) NOT NULL,
	[systime] [datetime] NOT NULL,
	[memo] [text] NOT NULL,
 CONSTRAINT [PK_fn_dfd] PRIMARY KEY CLUSTERED 
(
	[ifund] ASC,
	[ifdID] ASC,
	[ddate_w] ASC,
	[AccountType] ASC,
	[Iagtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_Table_2_dtrans_w]  DEFAULT ('') FOR [ddate_w]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_Iagtid]  DEFAULT ('') FOR [Iagtid]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mprftCurTwD]  DEFAULT ((0)) FOR [mprftCurTWD]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mdcost1]  DEFAULT ((0)) FOR [mdcost1]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mdcost2]  DEFAULT ((0)) FOR [mdcost2]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mdcost3]  DEFAULT ((0)) FOR [mdcost3]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mdcost1TWD]  DEFAULT ((0)) FOR [mdcost1TWD]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mdcost1Cur]  DEFAULT ((0)) FOR [mdcost2TWD]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_mdcost2TWD1]  DEFAULT ((0)) FOR [mdcost3TWD]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_TWDcurprice]  DEFAULT ((1)) FOR [TWDcurprice]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_classcod]  DEFAULT ('FOF') FOR [classcod]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_i_user_update]  DEFAULT ('SYS') FOR [i_user_update]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_systime]  DEFAULT (getdate()) FOR [systime]
GO

ALTER TABLE [dbo].[fn_dfd] ADD  CONSTRAINT [DF_fn_dfd_memo]  DEFAULT ('') FOR [memo]
GO


