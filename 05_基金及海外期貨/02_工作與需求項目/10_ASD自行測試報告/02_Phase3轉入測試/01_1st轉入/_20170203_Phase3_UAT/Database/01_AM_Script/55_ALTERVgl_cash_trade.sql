USE [isdbTGL]
GO

/****** Object:  View [dbo].[Vgl_cash_trade]    Script Date: 2017/2/6 ¤W¤È 11:20:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Vgl_cash_trade]
AS
SELECT          itdNO, ifund, ddate_w, iagtID, accno, ibank, dtype, dc, amt, icurid, fkind, classcod, itemcod, fkind2, tradedate, paydate, 
                            memo, monfund
FROM              dbo.Vgl_cash_trade_TWDSTK
UNION ALL
SELECT          itdNO, ifund, ddate_w, iagtID, accno, ibank, dtype, dc, amt, icurid, fkind, classcod, itemcod, fkind2, tradedate, paydate, 
                            memo, monfund
FROM              dbo.Vgl_cash_trade_GSTK
UNION ALL
SELECT          itdNO, ifund, ddate_w, iagtID, accno, ibank, dtype, dc, amt, icurid, fkind, classcod, itemcod, fkind2, tradedate, paydate, 
                            memo, monfund
FROM              dbo.Vgl_cash_trade_FOF
UNION ALL
SELECT          itdNO, ifunddtl, paydate, iagtID, accno, ibank, dtype, dc, amt, icurid, fkind, classcod, itemcod, fkind2, tradedate, 
                            paydate, memo, ifund
FROM              dbo.gl_cash_trade

GO


