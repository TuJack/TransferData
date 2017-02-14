USE [isdbTGL]
GO

/****** Object:  View [dbo].[Vgl_cash_trade_FOF]    Script Date: 2017/2/6 上午 11:19:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Vgl_cash_trade_FOF]
AS
SELECT          a.itdNO, a.ifund, a.dacc_w AS ddate_w, a.iagtID, d.CashActno AS accno, d.ibank, d.cashtype AS dtype, '-1' AS dc, 
                            a.tb_msum AS amt, a.icurid, 'T01' AS fkind, 'FOF' AS classcod, '' AS itemcod, '基金投資' AS fkind2, 
                            a.dacc_w AS tradedate, a.dpay_w AS paydate, '基金交易' AS memo, b.monfund
FROM              dbo.fn_fd_buy AS a INNER JOIN
                            dbo.cm_fund_relation AS b ON a.ifund = b.sonfund INNER JOIN
                            dbo.VcmFundRelLevel2 AS c ON b.sonfund = c.ifund and c.fund_type = '2' left join 
							Cm_act_data AS d on a.ibank = d.iagt  and a.cashaccount = d.actno and a.icurid = d.icurid and d.classcod = 'BANK' and d.sttype = b.monfund
UNION ALL
SELECT          a.itdNO, a.ifund, a.dacc_w AS ddate_w, a.iagtID, d.CashActno AS accno, d.ibank, d.cashtype AS dtype, '1' AS dc, 
                            a.ts_msum AS amt, a.icurid, 'T02' AS fkind, 'FOF' AS classcod, '' AS itemcod, '基金投資' AS fkind2, 
                            a.dtrans_w AS tradedate, a.dacc_w AS paydate, '基金交易' AS memo, b.monfund
FROM              dbo.fn_fd_sell AS a INNER JOIN
                            dbo.cm_fund_relation AS b ON a.ifund = b.sonfund INNER JOIN
                            dbo.VcmFundRelLevel2 AS c ON b.sonfund = c.ifund and c.fund_type = '2' left join 
							Cm_act_data AS d on a.ibank = d.iagt  and a.cashaccount = d.actno and a.icurid = d.icurid and d.classcod = 'BANK' and d.sttype = b.monfund
UNION ALL
SELECT          a.itdNO, a.ifund, a.ddate_w, a.iagtID, d.CashActno AS accno, d.ibank, d.cashtype AS dtype, '1' AS dc, 
							a.msum AS amt, a.icurid, 'TC4' AS fkind, 
                            'FOF' AS classcod, '' AS itemcod, '基金領息' AS fkind2, a.ddate_w AS tradedate, a.iaccdate_w AS paydate, 
                            '基金領息' AS memo, b.monfund
FROM              dbo.fn_fd_getch AS a INNER JOIN
                            dbo.cm_fund_relation AS b ON a.ifund = b.sonfund INNER JOIN
                            dbo.VcmFundRelLevel2 AS c ON b.sonfund = c.ifund and c.fund_type = '2' left join 
							Cm_act_data AS d on a.ibank = d.iagt  and a.cashaccount = d.actno and a.icurid = d.icurid and d.classcod = 'BANK' and d.sttype = b.monfund
UNION ALL
SELECT          a.itdNO, a.ifund, a.ddate_w, a.iagtID, d.CashActno AS accno, d.ibank, d.cashtype AS dtype, '1' AS dc, 
							a.act_accint_receive AS amt, 
                            a.icurid_receive, 'TC4' AS fkind, 'FOF' AS classcod, '' AS itemcod, '基金Rebate' AS fkind2, a.ddate_w AS tradedate, 
                            a.ddate_w AS paydate, '基金Rebate' AS memo, b.monfund
FROM              dbo.fn_fd_rebate AS a INNER JOIN
                            dbo.cm_fund_relation AS b ON a.ifund = b.sonfund INNER JOIN
                            dbo.VcmFundRelLevel2 AS c ON b.sonfund = c.ifund and c.fund_type = '2' left join 
							Cm_act_data AS d on a.ibank = d.iagt  and a.cashaccount = d.actno and a.icurid_receive = d.icurid and d.classcod = 'BANK' and d.sttype = b.monfund

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[5] 4[16] 2[60] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -480
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vgl_cash_trade_FOF'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vgl_cash_trade_FOF'
GO


