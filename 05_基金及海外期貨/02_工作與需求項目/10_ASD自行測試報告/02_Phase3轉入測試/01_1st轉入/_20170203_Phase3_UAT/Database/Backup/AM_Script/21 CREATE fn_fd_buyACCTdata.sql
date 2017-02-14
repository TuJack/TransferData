USE [isdbTGL]
GO

/****** Object:  Table [dbo].[fn_fd_buyACCTdata]    Script Date: 2017/2/6 ¤U¤È 04:37:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fn_fd_buyACCTdata](
	[ifdID] [varchar](20) NOT NULL,
	[iagtid] [varchar](5) NOT NULL,
	[acc_imagt] [varchar](5) NULL,
	[acc_iagt] [varchar](5) NULL,
	[acc_iagtName] [varchar](100) NULL,
	[acno] [varchar](20) NULL,
	[acntname] [varchar](100) NULL,
	[Reference] [varchar](200) NULL,
	[dstart_w] [varchar](8) NULL,
	[dend_w] [varchar](8) NOT NULL CONSTRAINT [DF_fn_fd_buyACCTdata_dend_w]  DEFAULT ('99999999'),
	[i_user_update] [varchar](20) NOT NULL CONSTRAINT [DF_fn_fd_buyACCTdata_i_user_update]  DEFAULT ('SYS'),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_buyACCTdata_time_update]  DEFAULT (getdate()),
	[systime] [datetime] NOT NULL CONSTRAINT [DF_fn_fd_buyACCTdata_systime]  DEFAULT (getdate()),
	[memo] [text] NOT NULL CONSTRAINT [DF_fn_fd_buyACCTdata_memo]  DEFAULT (''),
 CONSTRAINT [PK_fn_fd_buyACCTdata] PRIMARY KEY CLUSTERED 
(
	[ifdID] ASC,
	[iagtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


