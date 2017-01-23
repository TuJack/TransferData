USE [Bloomberg]
GO

/****** Object:  Table [dbo].[FundData]    Script Date: 2017/1/23 �U�� 05:15:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FundData](
	[iFdID] [varchar](20) NOT NULL,
	[iFdName] [varchar](150) NULL,
	[iFdEName] [varchar](150) NULL,
	[iFdELongName] [nvarchar](150) NULL,
	[ISINCode] [varchar](15) NULL,
	[dIssue_w] [datetime] NULL,
	[dEnd_w] [datetime] NULL,
	[iCountry] [varchar](2) NULL,
	[iCurid] [varchar](3) NULL,
	[invRegion] [varchar](30) NULL,
	[invTarget] [varchar](30) NULL,
	[fundType] [varchar](50) NULL,
	[fundAssets] [decimal](20, 6) NULL,
	[fundAssetsCurency] [varchar](3) NULL,
	[fundAssetsDate] [datetime] NULL,
	[issueCountry] [varchar](5) NULL,
	[systime] [datetime] NOT NULL CONSTRAINT [DF_FundData_systime]  DEFAULT (getdate()),
	[time_update] [datetime] NOT NULL CONSTRAINT [DF_FundData_time_update]  DEFAULT (getdate()),
	[flags] [varchar](1) NULL,
 CONSTRAINT [PK_FundData] PRIMARY KEY CLUSTERED 
(
	[iFdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'iFdName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����^��W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'iFdEName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISIN Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'ISINCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�o����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'dIssue_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�M����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'dEnd_w'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��a�O(Bloomberg Issue ISO)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'iCountry'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'iCurid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bloomberg���ϰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'invRegion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ؼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'invTarget'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bloomberg�������(Fund_Asset_Class_Focus)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'fundType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����`�겣(�ʸU) FUND_TOTAL_ASSETS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'fundAssets'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����`�겣���O FUND_TOTAL_ASSETS_CRNCY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'fundAssetsCurency'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�`�겣�p����� FUND_TOTAL_ASSETS_DT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'fundAssetsDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���q���U��(CNTRY_OF_INCORPORATION)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FundData', @level2type=N'COLUMN',@level2name=N'issueCountry'
GO


