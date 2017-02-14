USE [Bloomberg]
GO

/****** Object:  Table [dbo].[FuturesContractDetail]    Script Date: 2017/1/19 �U�� 02:01:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FuturesContractDetail](
	[ProductID] [varchar](20) NOT NULL,
	[ProductType] [varchar](10) NOT NULL,
	[ContractID] [varchar](10) NOT NULL,
	[shortName] [varchar](50) NULL,
	[ContractYear] [varchar](10) NOT NULL,
	[ContractMonth] [varchar](10) NOT NULL,
	[LastTradeDay] [datetime] NOT NULL,
	[MatureDay] [datetime] NOT NULL,
	[UnderlySpotTicker] [varchar](20) NULL,
	[FuhwaCode] [varchar](10) NULL,
	[Flags] [varchar](1) NULL,
	[lastUpdate] [datetime] NULL,
 CONSTRAINT [PK_FuturesContractDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ProductType] ASC,
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FuturesContractDetail] ADD  CONSTRAINT [DF_FuturesContractDetail_lastUpdate]  DEFAULT (getdate()) FOR [lastUpdate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӫ~�N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'ProductID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӫ~���O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'ProductType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X���N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'ContractID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X���W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'shortName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X���~��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'ContractYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'ContractMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�X���̫�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'LastTradeDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'MatureDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ъ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'UnderlySpotTicker'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�̫��s�ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FuturesContractDetail', @level2type=N'COLUMN',@level2name=N'lastUpdate'
GO


