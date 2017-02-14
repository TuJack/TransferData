USE [ETS_P]
GO

/****** Object:  View [dbo].[FOData]    Script Date: 2017/2/2 ¤U¤È 02:32:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[FOData]
AS
SELECT          classcod + '_' + istyID AS Seq, classcod AS FOType, nCsty AS LongName, nCsty AS ShortName, nEsty AS EngName, 
                            case when icountry = 'TW' then  'TW' else 'GL' end AS Region, istyID AS FOID, istyID AS FOID2, tick, vPoint AS TickValue, icurid AS Currency, 
                            1 / (CASE tick WHEN 0 THEN 1 ELSE tick END) * vPoint AS Point, 1 AS isUsed, 1 AS Etrade, 1 AS useOrder, 
                            compliance_class1 AS complianceclass, icountry
FROM              isdbTGL.dbo.fn_fts_style
WHERE          dexpire_w = 99999999
UNION
SELECT          classcod + '_' + istyID AS Seq, classcod AS FOType, nCsty AS LongName, nCsty AS ShortName, nEsty AS EngName, 
                            'TW' AS Region, istyID AS FOID, istyID AS FOID2, 1 AS tick, 1 AS TickValue, icurid AS Currency, vPoint AS Point, 
                            1 AS isUsed, 1 AS Etrade, 1 AS useOrder, compliance_class1 AS complianceclass, 'TW' icountry
FROM              isdbTGL.dbo.fn_opt_style
WHERE          dexpire_w = 99999999


GO


