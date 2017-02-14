USE [ETS_P]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FofFundData'

GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FofFundData'

GO

/****** Object:  View [dbo].[FofFundData]    Script Date: 2017/2/7 ¤W¤È 10:26:49 ******/
DROP table [dbo].[FofFundData]
GO

/****** Object:  View [dbo].[FofFundData]    Script Date: 2017/2/7 ¤W¤È 10:26:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FofFundData]
AS
SELECT          a.ifdID AS BTicker, a.isincode AS ISINCode, a.ifdename AS EngName, a.ifdname AS ChtName, a.fkind AS AssetType, 
                            '' AS RuleAssetType, '1' AS SaleInTaiwan, '1' AS IsLive, a.icurid AS Currency,
                                (SELECT          TOP (1) pnav
                                  FROM               isdbTGL.dbo.fn_fd_pnav
                                  WHERE           (ifdID = ifdID)
                                  ORDER BY    ddate_w DESC) AS PNav,
                                (SELECT          TOP (1) ddate_w
                                  FROM               isdbTGL.dbo.fn_fd_pnav AS fn_fd_pnav_1
                                  WHERE           (ifdID = a.ifdID)
                                  ORDER BY    ddate_w DESC) AS PDate,
                                (SELECT          mvalue
                                  FROM               isdbTGL.dbo.fn_invest_index
                                  WHERE           (classcod = 'FOF') AND (fkind = 'Oamt') AND (itemcod = a.ifdID)) AS FundSize, 0 AS Fundshare,
                                (SELECT          (CASE WHEN isnull(ddate_w, '') = '' THEN NULL ELSE CONVERT(datetime, ddate_w) END) 
                                                              AS Expr1
                                  FROM               isdbTGL.dbo.fn_invest_index AS fn_invest_index_1
                                  WHERE           (classcod = 'FOF') AND (fkind = 'Oamt') AND (itemcod = a.ifdID)) AS FundSizeDate, 
                            a.compno AS ComID, c.nagt AS ConName, '' AS PrimaryID, 0 AS SingleFundSize, 0 AS AllFundSizeUSD, 
                            '' AS GeographicalFocus, '' AS ExternalFoF, '' AS LipperGlobal, a.icountry AS Icountry, a.fdis AS f_dis, 
                            '' AS IndexFundType, 0 AS sharesdecimal, '' AS fkind_blg, '' AS Fund_INDUSTRY_FOCUS, '' AS Compno
FROM              isdbTGL.dbo.fn_fd_data AS a LEFT OUTER JOIN
                            isdbTGL.dbo.fn_fd_com AS b ON b.compno = a.compno LEFT OUTER JOIN
                            isdbTGL.dbo.vfnbroker AS c ON c.iagt = b.iagtid
WHERE          (a.dexpire_w = '99999999')

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 140
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 298
               Bottom = 140
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 505
               Bottom = 140
               Right = 671
            End
            DisplayFlags = 280
            TopColumn = 0
         End
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FofFundData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FofFundData'
GO


