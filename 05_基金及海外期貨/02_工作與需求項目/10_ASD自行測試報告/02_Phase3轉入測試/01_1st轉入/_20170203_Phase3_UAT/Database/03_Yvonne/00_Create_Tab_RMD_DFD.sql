USE [isdbTGL]
GO

/****** Object:  Table [dbo].[TAB_RMD_DFD]    Script Date: 2017/2/9 上午 11:44:35 ******/
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部位日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'PositionDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料來源系統,系統名稱(TGL)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'SourceSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部位代碼,同ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'PositionID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'國內：股票代碼
國外：Bloomberg Ticker
私募：系統內名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織維度一 - 公司,公司名稱(TGlobe/KHL)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Company'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織為度二- 部門,部門名稱(IMD)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Department'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織維度二組織維度三 - 處' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Division'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織維度四 - 科別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Desk'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織維度五 - 交易員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Trader'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織維度六 - 帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Account'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品維度一 - 市場' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Market'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品維度二 -商品classes,市場別(EQUITY),ex:EQUITY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductGroup'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品維度三- 商品種類,原 Portia Oracle Class,ex:T_stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品為度四- 商品細類,商品名稱;ex:國泰金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Product'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'評價模組' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ProductDetail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投資組合維度一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Portfolio'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投資組合維度二-交易策略' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Strategy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投資組合維度三-交易策略細項;原Portia Portfolio Name;ex:G_T_Local asset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'StrategyDetail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發行者(交易對手)分類一-洲別;地區別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Continent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發行者(交易對手)分類二-地區別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Region'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發行者(交易對手)分類三-發行者類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'IssuerClass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發行者(交易對手)分類四-產業別;國內：來自Cmoney基本資料
國外：來自Bloomberg基本資料;ex:Insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Sector'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發行者評等;ex:NR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'IssuerRating'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會計分類;會計目的 in ( CASH, AFS, FVPL )：FV
會計目的 in ( HTM, NACTM )：AV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'AccountingClass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會計目的分類;會計目的(CASH/AFS/HTM/FVPL/NACTM)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Accounting'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'該部位所使用的Benchmark標的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'Benchmark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部位名稱;PositionDate + "_" +  Department+ "_" +StrategyDetail+ "_" +ProductID;ex:20160429_IMD_G_T_Local asset_2882' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'positionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'股票名稱,國內且(PositionDate-IPODate)>=1year：CLNT.SYSJ.+ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'equityName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部位持有股數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'numberOfShares'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'以股票proxy所計算出來的beta值,預設為1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'beta'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'股利收益率;1. 用於Equity Forward Contract
2. 連續複利之股利收益率,以年利率來表示, 若為空白,則以0為準' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'dividendYield'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標的股股價,標的股票當日系統結帳價格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'equityPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易日，日期八碼yyyymmdd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'settlementDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結算價格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'settlementPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標的股幣別,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'equityCurrency'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'忽略外匯風險,是-->Y, 否-->空格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'ignoreFXRisk'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'正值為賣出, 負值為回補' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'YTDSoldNumOfShares'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當年累計已實現損益,計價幣別為標的股幣別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'YTDRealizedPL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上市日期,日期八碼yyyymmdd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'IPODate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結算價格2(含息總成本)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'settlementPrice2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'彭博代碼;國內：ProductID + " TT Equity";國外：Bloomberg Ticker' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAB_RMD_DFD', @level2type=N'COLUMN',@level2name=N'BBGTicker'
GO


