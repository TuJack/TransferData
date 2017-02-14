USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_data]    Script Date: 2017/2/6 ¤U¤È 02:28:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_data](
	[classcod] [varchar](10) NOT NULL CONSTRAINT [DF_fn_fd_data_classcod]  DEFAULT ('FOF'),
	[ifdID] [varchar](20) NOT NULL,
	[ifdname] [varchar](150) NULL,
	[ifdename] [varchar](150) NULL CONSTRAINT [DF_fn_fd_data_ifdename]  DEFAULT (''),
	[com_id] [varchar](10) NULL,
	[isincode] [varchar](15) NULL CONSTRAINT [DF_fn_fd_data_isincode]  DEFAULT (''),
	[compno] [varchar](15) NULL,
	[fdis] [varchar](1) NULL,
	[fkind] [varchar](2) NULL,
	[fkind_blg] [varchar](30) NULL,
	[iextrid] [varchar](6) NULL,
	[dissue_w] [varchar](8) NULL,
	[dend_w] [varchar](8) NULL,
	[duse_w] [varchar](8) NULL,
	[dexpire_w] [varchar](8) NULL,
	[icountry] [varchar](2) NULL,
	[icurid] [varchar](3) NULL CONSTRAINT [DF_fn_fd_data_icurid]  DEFAULT (''),
	[invregion] [varchar](30) NULL,
	[invtarget] [varchar](30) NULL,
	[issue_cntry] [varchar](5) NULL,
	[Primary_id] [varchar](20) NULL,
	[seciacc] [varchar](15) NULL,
	[mgtrate] [decimal](7, 4) NULL CONSTRAINT [DF_fn_fd_data_mgtrate]  DEFAULT ((0)),
	[othrate] [decimal](7, 4) NULL,
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_fn_fd_data_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_data_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_data_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_fn_fd_data_memo]  DEFAULT (''),
	[Fund_Industry_Focus] [varchar](10) NULL,
	[PE_fundsize_goal] [decimal](20, 4) NULL,
	[PE_fundsize_goal_icurid] [varchar](3) NULL,
	[PE_fundsize_real] [decimal](20, 4) NULL,
	[PE_fundsize_real_icurid] [varchar](3) NULL,
 CONSTRAINT [PK_fn_fd_data] PRIMARY KEY CLUSTERED 
(
	[ifdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BloombergÄæ¦ìFund_Industry_Focus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fn_fd_data', @level2type=N'COLUMN',@level2name=N'Fund_Industry_Focus'
GO


