USE [isdbTGL]
GO

/****** Object:  Table [dbo].[TAB_RMD_DFD]    Script Date: 2017/2/9 �W�� 11:44:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TAB_RMD_DFD](
	[ddate_w] [varchar](8) NOT NULL,
	[ifund] [varchar](20) NOT NULL,
	[ifdID] [varchar](15) NOT NULL,
	[AccountType] [varchar](10) NOT NULL,
	[icountry] [varchar](3) NULL CONSTRAINT [DF_TAB_RMD_Dfd_icoun__03D23369]  DEFAULT ('N'),
	[Classcod] [varchar](10) NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_Class__04C657A2]  DEFAULT ('STK'),
	[USERID] [varchar](20) NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_USERI__05BA7BDB]  DEFAULT ('SYS'),
	[U_DATE] [datetime] NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_U_DAT__06AEA014]  DEFAULT (getdate()),
	[PositionDate] [varchar](8) NOT NULL,
	[SourceSystem] [varchar](50) NOT NULL,
	[PositionID] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[Department] [varchar](50) NULL,
	[Division] [varchar](50) NULL,
	[Desk] [varchar](50) NULL,
	[Trader] [varchar](50) NULL,
	[Account] [varchar](50) NULL,
	[Market] [varchar](24) NULL,
	[ProductGroup] [varchar](24) NOT NULL,
	[ProductType] [varchar](24) NOT NULL,
	[Product] [varchar](24) NOT NULL,
	[ProductDetail] [varchar](24) NULL,
	[Portfolio] [varchar](24) NOT NULL,
	[Strategy] [varchar](24) NOT NULL,
	[StrategyDetail] [varchar](24) NOT NULL,
	[Continent] [varchar](24) NULL,
	[Region] [varchar](24) NULL,
	[IssuerClass] [varchar](24) NULL,
	[Sector] [varchar](24) NOT NULL,
	[IssuerRating] [varchar](24) NOT NULL,
	[AccountingClass] [varchar](24) NOT NULL,
	[Accounting] [varchar](24) NOT NULL,
	[Benchmark] [varchar](24) NULL,
	[positionName] [varchar](100) NOT NULL,
	[equityName] [varchar](24) NOT NULL,
	[numberOfShares] [decimal](20, 4) NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_numbe__07A2C44D]  DEFAULT ((0)),
	[beta] [decimal](9, 6) NULL CONSTRAINT [DF_TAB_RMD_Dfd_beta__0896E886]  DEFAULT ((1)),
	[dividendYield] [decimal](7, 5) NULL,
	[equityPrice] [decimal](15, 8) NULL,
	[settlementDate] [varchar](8) NULL,
	[settlementPrice] [numeric](30, 8) NULL,
	[equityCurrency] [varchar](3) NOT NULL,
	[ignoreFXRisk] [varchar](1) NULL,
	[YTDSoldNumOfShares] [decimal](20, 4) NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_YTDSo__098B0CBF]  DEFAULT ((0)),
	[YTDRealizedPL] [decimal](25, 5) NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_YTDRe__0A7F30F8]  DEFAULT ((0)),
	[IPODate] [varchar](8) NOT NULL CONSTRAINT [DF_TAB_RMD_Dfd_IPODa__0B735531]  DEFAULT ((0)),
	[settlementPrice2] [decimal](30, 8) NULL,
	[BBGTicker] [varchar](100) NULL,
	[settlementCurrency] [varchar](3) NULL,
 CONSTRAINT [PK_TAB_RMD_Dfd] PRIMARY KEY CLUSTERED 
(
	[ddate_w] ASC,
	[ifund] ASC,
	[ifdID] ASC,
	[AccountType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'PositionDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ƨӷ��t��,�t�ΦW��(TGL)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'SourceSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����N�X,�PProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'PositionID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ꤺ�G�Ѳ��N�X
��~�GBloomberg Ticker
�p�ҡG�t�Τ��W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��´���פ@ - ���q,���q�W��(TGlobe/KHL)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Company'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��´���פG- ����,�����W��(IMD)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Department'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��´���פG��´���פT - �B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Division'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��´���ץ| - ��O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Desk'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��´���פ� - �����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Trader'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��´���פ� - �b��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Account'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӫ~���פ@ - ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Market'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӫ~���פG -�ӫ~classes,�����O(EQUITY),ex:EQUITY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductGroup'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӫ~���פT- �ӫ~����,�� Portia Oracle Class,ex:T_stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӫ~���ץ|- �ӫ~����,�ӫ~�W��;ex:�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Product'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ҳ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductDetail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���զX���פ@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Portfolio'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���զX���פG-�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Strategy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���զX���פT-��������Ӷ�;��Portia Portfolio Name;ex:G_T_Local asset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'StrategyDetail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�o���(������)�����@-�w�O;�a�ϧO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Continent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�o���(������)�����G-�a�ϧO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Region'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�o���(������)�����T-�o������O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'IssuerClass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�o���(������)�����|-���~�O;�ꤺ�G�Ӧ�Cmoney�򥻸��
��~�G�Ӧ�Bloomberg�򥻸��;ex:Insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Sector'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�o��̵���;ex:NR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'IssuerRating'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�|�p����;�|�p�ت� in ( CASH, AFS, FVPL )�GFV
�|�p�ت� in ( HTM, NACTM )�GAV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'AccountingClass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�|�p�ت�����;�|�p�ت�(CASH/AFS/HTM/FVPL/NACTM)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Accounting'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ӳ���ҨϥΪ�Benchmark�Ъ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Benchmark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����W��;PositionDate + "_" +  Department+ "_" +StrategyDetail+ "_" +ProductID;ex:20160429_IMD_G_T_Local asset_2882' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'positionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ѳ��W��,�ꤺ�B(PositionDate-IPODate)>=1year�GCLNT.SYSJ.+ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'equityName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������Ѽ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'numberOfShares'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�H�Ѳ�proxy�ҭp��X�Ӫ�beta��,�w�]��1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'beta'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ѧQ���q�v;1. �Ω�Equity Forward Contract
2. �s��ƧQ���ѧQ���q�v,�H�~�Q�v�Ӫ��, �Y���ť�,�h�H0����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'dividendYield'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ъ��Ѫѻ�,�Ъ��Ѳ����t�ε��b����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'equityPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����A����K�Xyyyymmdd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'settlementDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'settlementPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ъ��ѹ��O,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'equityCurrency'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����~�׭��I,�O-->Y, �_-->�Ů�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ignoreFXRisk'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ȭ���X, �t�Ȭ��^��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'YTDSoldNumOfShares'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��~�֭p�w��{�l�q,�p�����O���Ъ��ѹ��O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'YTDRealizedPL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�W�����,����K�Xyyyymmdd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'IPODate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������2(�t���`����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'settlementPrice2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�^�եN�X;�ꤺ�GProductID + " TT Equity";��~�GBloomberg Ticker' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'BBGTicker'
GO


