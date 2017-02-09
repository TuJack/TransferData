USE [Bloomberg]
GO

/****** Object:  Table [dbo].[FuturesContractPrice]    Script Date: 2017/1/19 と 02:24:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FuturesContractPrice](
	[ProductID] [varchar](20) NOT NULL,
	[ProductType] [varchar](10) NOT NULL,
	[ContractID] [varchar](20) NOT NULL,
	[ddate] [varchar](8) NOT NULL,
	[openPrice] [decimal](18, 4) NULL,
	[lastPrice] [decimal](18, 4) NULL,
	[highPrice] [decimal](18, 4) NULL,
	[lowPrice] [decimal](18, 4) NULL,
	[change1D] [decimal](18, 4) NULL,
	[lastVolume] [decimal](18, 4) NULL,
 CONSTRAINT [PK_FuturesContractPrice] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ProductType] ASC,
	[ContractID] ASC,
	[ddate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'坝珇絏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'ProductID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'坝珇摸' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'ProductType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'絏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'ContractID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ら戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'ddate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'秨絃基' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'openPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Μ絃基' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'lastPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程蔼基' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'highPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程基' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'lowPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ら害禴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'change1D'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Θユ计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractPrice', @level2type=N'COLUMN',@level2name=N'lastVolume'
GO


