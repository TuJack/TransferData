USE [ETS_P]
GO

/****** Object:  View [dbo].[vCm_act_data]    Script Date: 2017/2/3 ¤U¤È 02:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vCm_act_data]
AS
SELECT          A.iagt, A.classcod, A.STTYPE, A.ActNo, A.ibank, B.nagt AS ibankName, A.CashActno, A.swift_code, A.BTREMARK, 
                            A.ActName, A.ActEName, A.connectName, A.adderess, A.tel, A.fax, A.email, A.icurid, A.Actkind, A.Cashtype, A.Actfor, 
                            A.Acttype, A.MAINACCT, A.INV, A.INVSEQ, A.PARTNER, A.FUTURE4, A.dstart_w, A.dend_w, A.i_user_update, 
                            A.time_update, A.systime, A.memo, C.broker_code, C.fts_code, C.nagt, C.gstk_code, C.gfts_code
FROM              isdbTGL.dbo.cm_act_data AS A LEFT OUTER JOIN
                            isdbTGL.dbo.vfnbroker AS B ON A.ibank = B.iagt AND B.dstart_w <= CONVERT(varchar, GETDATE(), 112) AND 
                            B.dend_w >= CONVERT(varchar, GETDATE(), 112) LEFT OUTER JOIN
                            isdbTGL.dbo.vfnbroker AS C ON A.iagt = C.iagt AND C.dstart_w <= CONVERT(varchar, GETDATE(), 112) AND 
                            C.dend_w >= CONVERT(varchar, GETDATE(), 112)
WHERE          (A.dstart_w <= CONVERT(varchar, GETDATE(), 112)) AND (A.dend_w >= CONVERT(varchar, GETDATE(), 112))

GO


