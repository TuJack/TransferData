USE [ETS_P]
GO

/****** Object:  View [dbo].[vTradeConfirmGlStkMappingData]    Script Date: 2017/2/9 下午 03:26:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vTradeConfirmGlStkMappingData]
AS
SELECT          FM.Seq AS MapingSeq, FC.Seq AS DataSeq, FM.ddate, FM.Ftype, FM.ContNo, ISNULL(MC.mName, '') AS FTypeStr, 
                            FM.ContNo + ':' + ISNULL(FD.fundSname, N'') AS FundName, FM.BrokerCode, SB.SecSName, FC.ProductID AS istkID, 
                            FC.ProductID + ' ' + ISNULL(SD.StockName, N'') AS StockName, FC.BS, 
                            CASE FC.BS WHEN 'B' THEN '現股買進' WHEN 'S' THEN '現股賣出' ELSE '' END AS BSStr, FC.TradePrice AS price, 
                            FC.TradeShares AS Amount, FC.TradeAmount AS TradeValue, FC.Fee, FC.Tax, FC.SettleAmount AS NetValue, 
                            FC.TradeNo, FC.AccountInBroker, 0 AS LastInterest, '' AS PType, '' AS FeeRebateRate, '' AS LastInterestTax, 
                            FC.MailNo, FC.ConfirmSeq, FC.MUser, FC.MTime, FC.Status, FC.Msg, '' AS flow, '' AS fkind, '' AS ftrade, 
                            FM.MarketType
FROM              dbo.TradeConfirmMapping AS FM LEFT OUTER JOIN
                            dbo.TradeConfirmGlStkBrokerData AS FC ON FM.Ftype = FC.FundType AND FM.ContNo = FC.FundID AND 
                            FM.ConfirmSeq = FC.ConfirmSeq LEFT OUTER JOIN
                            dbo.FundData AS FD ON FM.Ftype = FD.fundtype AND FM.ContNo = FD.fundid LEFT OUTER JOIN
                            dbo.GlStkStockData AS SD ON FC.ProductID = SD.Stock LEFT OUTER JOIN
                            dbo.SecuritiesBranch AS SB ON SB.SecID = FM.BrokerCode LEFT OUTER JOIN
                            dbo.MappingCode AS MC ON 'FundType' = MC.mcID AND FM.Ftype = MC.mID
WHERE          (FM.Product = 'GlStk') AND (FC.ConfirmSeq IS NOT NULL) AND (SB.Product = 'GlStk')

GO


