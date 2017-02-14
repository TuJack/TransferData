rem Vanensa's Script
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\01_加代操mapping帳號Table_cm_fund_data_DsAccno.sql			-o .\vanessa\Log\01_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\02_加台幣匯率TABLE_fn_cur_priceTWD.sql									-o .\vanessa\Log\02_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\03_加台幣欄位_fn_dstk.sql															-o .\vanessa\Log\03_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\04_加台幣欄位_fn_stk_cash.sql													-o .\vanessa\Log\04_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\05_加台幣欄位_fn_stk_reduce.sql												-o .\vanessa\Log\05_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\06_加台幣欄位_fn_stk_right.sql													-o .\vanessa\Log\06_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\07_加台幣欄位_fn_stk_set.sql														-o .\vanessa\Log\07_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\08_加台幣欄位_fn_stk_trade.sql													-o .\vanessa\Log\08_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\09_加台幣欄位_Tmpfn_dstk99.sql													-o .\vanessa\Log\09_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\10_加台幣欄位_Tmpfn_stk_trade99.sql										-o .\vanessa\Log\10_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\11_加交易幣欄位_cm_fund_data.sql												-o .\vanessa\Log\11_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\12_加多幣別價格TABLE_fn_stk_priceCur.sql								-o .\vanessa\Log\12_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\13_加改雜幣匯率TABLE_fn_cur_price.sql									-o .\vanessa\Log\13_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\14_加取交易幣股價F_Q_GL_Get_Stk_PriceCur.sql						-o .\vanessa\Log\14_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\15_加取個股TWD平均成本F_Q_Get_Stk_Twd_AVGCost.sql			-o .\vanessa\Log\15_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\16_加換台幣Fuction_F_Q_Change2TWD.sql									-o .\vanessa\Log\16_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\17_加幣別欄位_fn_stk_reduce.sql												-o .\vanessa\Log\17_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\18_加欄位_fn_stk_data.sql															-o .\vanessa\Log\18_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\19_加欄位portfolioid＿gl_cash_trade.sql								-o .\vanessa\Log\19_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\20_加欄位portfolioid_gl_dcash.sql											-o .\vanessa\Log\20_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\21_加欄位portfolioid_tmpgl_dcash99.sql									-o .\vanessa\Log\21_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\22_重建保銀TABLE_fn_dstk_SecAcc.sql										-o .\vanessa\Log\22_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\23_比對保銀庫存P_Q_FS_ChkSecDstk.sql										-o .\vanessa\Log\23_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\24_重建海外企業活動相關TABLE_merge_separate_ca_catrade.sql		-o .\vanessa\Log\24_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\25_修改F_Q_Get_StkSaleCost.sql													-o .\vanessa\Log\25_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\26_修改F_Q_Get_StkSaleDivCost.sql											-o .\vanessa\Log\26_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\27_修改P_U_CopyTempByPgm.sql														-o .\vanessa\Log\27_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\28_修改P_U_Stk_Trade_DivMcost.sql											-o .\vanessa\Log\28_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\29_修改P_U_Stk_Trade_Mcost_Tmp.sql											-o .\vanessa\Log\29_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\30_新建TABLE_fund_updDateLog.sql												-o .\vanessa\Log\30_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\31_加TABLEINDEX_fn_cur_priceTWD_Index.sql							-o .\vanessa\Log\31_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\33_改金流View_加Function_F_Q_Get_Gstk_ChAct.sql				-o .\vanessa\Log\33_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\34_改金流View_加view_Vgl_cash_trade_GSTK.sql						-o .\vanessa\Log\34_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\35_改金流View_加view_Vgl_cash_trade_TWDSTK.sql					-o .\vanessa\Log\35_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\36_改金流View_修改view_Vgl_cash_trade.sql							-o .\vanessa\Log\36_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\37_改金流View_加金流用_P_Q_GET_CashBalance.sql					-o .\vanessa\Log\37_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\38_加欄位cm_control.sql																-o .\vanessa\Log\38_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\39_新增幣別欄位_fn_invest_index.sql										-o .\vanessa\Log\39_Log.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\vanessa\40_改海外企業活動項目.sql															-o .\vanessa\Log\40_Log.txt

rem Eddie's Script
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\cm_broker_SSI.sql 			-o .\Eddie\Log\cm_broker_SSI.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\cm_MarketName.sql 			-o .\Eddie\Log\cm_MarketName.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\cm_SEC_SSI.sql 				-o .\Eddie\Log\cm_SEC_SSI.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\fn_stk_getch.sql 			-o .\Eddie\Log\fn_stk_getch.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\Log_cm_broker_SSI.sql 	-o .\Eddie\Log\Log_cm_broker_SSI.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\Log_cm_MarketName.sql 	-o .\Eddie\Log\Log_cm_MarketName.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\Log_cm_SEC_SSI.sql 		-o .\Eddie\Log\Log_cm_SEC_SSI.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Eddie\更新規費cm_broker_Fee.sql -o .\Eddie\Log\更新規費cm_broker_Fee.txt
rem   cm_symbol匯入資料.xlsx

rem Sandy's Script
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\sandy\log_cm_currency.sql		-o .\sandy\Log\log_cm_currency.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\sandy\log_cm_fund_data_DSAccno.sql		-o .\sandy\Log\log_cm_fund_data_DSAccno.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\sandy\P_Q_GET_TG9919.sql			-o .\sandy\Log\P_Q_GET_TG9919.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\sandy\P_Q_GET_TG9933_DstkSecAcc.sql	-o .\sandy\Log\P_Q_GET_TG9933_DstkSecAcc.txt
rem sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\sandy\TG9919.sql			-o .\sandy\Log\TG9919.txt
rem sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\sandy\TG9935.sql			-o .\sandy\Log\TG9935.txt


rem Yenling's Script
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\01_Riskmgt_v_fas_fn_dstk.sql								-o .\Yenling\Log\01_Riskmgt_v_fas_fn_dstk.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\02_Riskmgt_RawData.sql											-o .\Yenling\Log\02_Riskmgt_RawData.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\03_ETS_Function_ToTWDRate.sql							-o .\Yenling\Log\03_ETS_Function_ToTWDRate.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\04_ETS_Update_ana_document_STK_TYPE.sql		-o .\Yenling\Log\04_ETS_Update_ana_document_STK_TYPE.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\05_ETS_v_fas_fn_stk_data.sql								-o .\Yenling\Log\05_ETS_v_fas_fn_stk_data.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\06_ETS_vCm_act_data.sql										-o .\Yenling\Log\06_ETS_vCm_act_data.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\07_ETS_vFundDecisionDealed.sql							-o .\Yenling\Log\07_ETS_vFundDecisionDealed.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\08_ETS_View_GlStkStockData.sql							-o .\Yenling\Log\08_ETS_View_GlStkStockData.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\09_ETS_View_SecuritiesAccount.sql					-o .\Yenling\Log\09_ETS_View_SecuritiesAccount.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\10_ETS_vTradeConfirmGlStkMappingData.sql		-o .\Yenling\Log\10_ETS_vTradeConfirmGlStkMappingData.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\11_ETS_SP_GetOrderRpt_Detail.sql						-o .\Yenling\Log\11_ETS_SP_GetOrderRpt_Detail.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\12_ETS_SP_GetOrderRpt_Sum.sql							-o .\Yenling\Log\12_ETS_SP_GetOrderRpt_Sum.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\13_ETS_View_SecuritiesBranch.sql						-o .\Yenling\Log\13_ETS_View_SecuritiesBranch.txt


rem Hedy's Script
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\14_P_Q_GET_TG9933_DstkSecAcc.sql												-o .\Yenling\Log\14_P_Q_GET_TG9933_DstkSecAcc.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\15_update_cm_fund_data_dtkl_DTL資料.sql								-o .\Yenling\Log\15_update_cm_fund_data_dtkl_DTL資料.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\16_修改sc_program程式名稱9919.sql											-o .\Yenling\Log\16_修改sc_program程式名稱9919.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\17_新增vfnbroker_isBank.sql														-o .\Yenling\Log\17_新增vfnbroker_isBank.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\18_修改vfnbroker海外券商欄位大小.sql										-o .\Yenling\Log\18_修改vfnbroker海外券商欄位大小.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\19_新增cm_symbol存款別cm13.sql													-o .\Yenling\Log\19_新增cm_symbol存款別cm13.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\20_新增fn_stk_data_mapping.sql													-o .\Yenling\Log\20_新增fn_stk_data_mapping.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\21_新增fn_stk_trade_adj.sql														-o .\Yenling\Log\21_新增fn_stk_trade_adj.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\22_cm_act_data新增覆核欄位.sql													-o .\Yenling\Log\22_cm_act_data新增覆核欄位.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\23_新增Log_cm_act_data.sql															-o .\Yenling\Log\23_新增Log_cm_act_data.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\24_update代操銀行帳號資料cm_fund_data_DsAccno.sql			-o .\Yenling\Log\24_update代操銀行帳號資料cm_fund_data_DsAccno.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\25_update保銀cm_sec_ssi.sql														-o .\Yenling\Log\25_update保銀cm_sec_ssi.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yenling\26_匯入table資料_先刪除isdbTGL再由RelayDB整批匯入.sql	-o .\Yenling\Log\26_匯入table資料_先刪除isdbTGL再由RelayDB整批匯入.txt



rem Yvonne's Script
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\00_MsReport.sql									-o .\Yvonne\Log\00_MsReport.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\00_Tab_RMD_DStk.sql							-o .\Yvonne\Log\00_Tab_RMD_DStk.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\001_Uf_RMD_Dstk_IfExist.sql			-o .\Yvonne\Log\001_Uf_RMD_Dstk_IfExist.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\002_Up_RMD_Dstk_D.sql						-o .\Yvonne\Log\002_Up_RMD_Dstk_D.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\003_UP_RMD_Dstk_Add.sql					-o .\Yvonne\Log\003_UP_RMD_Dstk_Add.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\004_UP_RMD_DStk_Add_All.sql			-o .\Yvonne\Log\004_UP_RMD_DStk_Add_All.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\005_UP_RMD_DStk_Add_All_SE.sql	-o .\Yvonne\Log\005_UP_RMD_DStk_Add_All_SE.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\006_UP_MSRprt_Add_Rcode08.sql		-o .\Yvonne\Log\006_UP_MSRprt_Add_Rcode08.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\007_UP_MSRprt_Add_Rcode10.sql		-o .\Yvonne\Log\007_UP_MSRprt_Add_Rcode10.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\Yvonne\008_UP_MSRprt_Add.sql						-o .\Yvonne\Log\008_UP_MSRprt_Add.txt























rem 01
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\1 create F_Q_Get_FdSaleCost.sql         			-o .\01_AM_Script\Log\1.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\10 CREATE fn_fd_data.sql                 			-o .\01_AM_Script\Log\10.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\11 CREATE fn_fd_com.sql                 	 		-o .\01_AM_Script\Log\11.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\12 CREATE fn_fd_pnav.sql                 			-o .\01_AM_Script\Log\12.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\13 CREATE fn_dfd.sql                     			-o .\01_AM_Script\Log\13.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\14 CREATE fn_fd_buy.sql                  			-o .\01_AM_Script\Log\14.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\15 CREATE fn_fd_sell.sql                   		-o .\01_AM_Script\Log\15.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\16 CREATE fn_fd_getch.sql                  		-o .\01_AM_Script\Log\16.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\17 CREATE fn_fd_rebate.sql                 		-o .\01_AM_Script\Log\17.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\18 CREATE fn_fd_iagtfdtype.sql             		-o .\01_AM_Script\Log\18.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\19 CREATE fn_fd_EstRebate.sql              		-o .\01_AM_Script\Log\19.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\2 create F_Q_Get_FdSaleDivCost.sql         		-o .\01_AM_Script\Log\2.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\20 CREATE fn_Fd_data_mapping.sql           		-o .\01_AM_Script\Log\20.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\21 CREATE fn_fd_buyACCTdata.sql            		-o .\01_AM_Script\Log\21.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\22 CREATE Tmpfn_dfd99.sql                  		-o .\01_AM_Script\Log\22.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\23 CREATE Log_fn_fd_iagtfdtype.sql         		-o .\01_AM_Script\Log\23.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\24 CREATE Log_fn_fd_com.sql                		-o .\01_AM_Script\Log\24.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\25 CREATE Log_fn_fd_buy.sql                		-o .\01_AM_Script\Log\25.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\26 CREATE Log_fn_fd_data.sql               		-o .\01_AM_Script\Log\26.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\27 CREATE Log_fn_fd_pnav.sql               		-o .\01_AM_Script\Log\27.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\28 CREATE Log_fn_fd_getch.sql              		-o .\01_AM_Script\Log\28_sell.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\28 CREATE Log_fn_fd_sell.sql               		-o .\01_AM_Script\Log\28_rebate.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\29 CREATE Log_fn_fd_rebate.sql             		-o .\01_AM_Script\Log\29.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\3 create P_U_Fd_Trade_Mcost.sql            		-o .\01_AM_Script\Log\3.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\30 CREATE Log_fn_fd_buyACCTdata.sql        		-o .\01_AM_Script\Log\30.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\31 CREATE Log_fn_fd_data_mapping.sql       		-o .\01_AM_Script\Log\31.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\36 cm_broker_SSI_tmp.sql                   		-o .\01_AM_Script\36.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\37 cm_MarketName_tmp.sql                   		-o .\01_AM_Script\Log\37.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\38 cm_SEC_SSI_tmp.sql                      		-o .\01_AM_Script\Log\38.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\4 create F_Q_GL_Get_Fd_Pnav.sql            		-o .\01_AM_Script\Log\4.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\42 log fn_fd_buyACCTdata(For TG0402).sql   		-o .\01_AM_Script\Log\42.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\43 log_fn_fd_com(For TG0401).sql           		-o .\01_AM_Script\Log\43.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\44 log_fn_fd_data(For TG0402).sql          		-o .\01_AM_Script\Log\44.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\45 log_fn_fd_getch(For TG9939).sql         		-o .\01_AM_Script\Log\45.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\46 log_fn_invest_credit(For TG0020).sql    		-o .\01_AM_Script\Log\46.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\47 log_st_ds_client(For TG0401).sql        		-o .\01_AM_Script\Log\47.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\48 P_Q_GET_TG9939(For TG9939).sql          		-o .\01_AM_Script\Log\48.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\49 st_ds_client(For TG0401).sql            		-o .\01_AM_Script\Log\49.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\5 create F_Q_Get_RebateDetail.sql          		-o .\01_AM_Script\Log\5.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\50 TGL_基金_Eddie.sql                   		  -o .\01_AM_Script\Log\50.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\51 P_Q_Get_TG9941_Dfd.sql                  		-o .\01_AM_Script\Log\51.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\52 TABLE開新欄位.sql                     			-o .\01_AM_Script\Log\52.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\53 CREATE fn_Fd_data_mapping.sql         		  -o .\01_AM_Script\Log\53.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\6 create P_U_fd_estRebate.sql              		-o .\01_AM_Script\Log\6.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\7 create P_U_FS_FD_Trade.sql              		-o .\01_AM_Script\Log\7.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\8 CREATE Vgl_cash_trade_FOF.sql          			-o .\01_AM_Script\Log\8.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\9 ALTER Vgl_cash_trade.sql               			-o .\01_AM_Script\Log\9.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\AC_COMM目錄SQL.sql                        		-o .\01_AM_Script\Log\AM_COMM.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\UPDATE cm_symbol .sql                    			-o .\01_AM_Script\Log\UPDATE cm_symbol.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\UPDATE GL_acc_data.sql                   			-o .\01_AM_Script\Log\UPDATE UPDATE GL_acc_data.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\UPDATE GL_auto_vouchor.sql               			-o .\01_AM_Script\Log\UPDATE GL_auto_vouchor.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\01_AM_Script\Update SQL.sql                           			-o .\01_AM_Script\Log\Update SQL.txt


rem 02
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\1.Riskmgt_InsertRules.sql                    -o .\02_ETS_Script\Log\1.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\10.ETS_UpdateData.sql                        -o .\02_ETS_Script\Log\10.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\11.ETS_Function_GetProductName.sql           -o .\02_ETS_Script\Log\11.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\12.ETS_FofAccAmt.sql                         -o .\02_ETS_Script\Log\12.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\13.ETS_FofAccAmtDec.sql                      -o .\02_ETS_Script\Log\13.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\14.ETS_View_FOData.sql                       -o .\02_ETS_Script\Log\14.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\15.ETS_View_v_fas_fn_dfd.sql                 -o .\02_ETS_Script\Log\15.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\16.ETS_View_v_fas_fn_fd_pnav.sql             -o .\02_ETS_Script\Log\16.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\17.Riskmgt_View_v_fas_fn_fd_data.sql         -o .\02_ETS_Script\Log\17.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\18.ETS_View_vCm_act_data.sql                 -o .\02_ETS_Script\Log\18.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\19.ETS_FOHedgeMapping.sql                    -o .\02_ETS_Script\Log\19.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\2.Riskmgt_RawData.sql                        -o .\02_ETS_Script\Log\2.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\20.ETS_FOHedgeMappingHistory.sql             -o .\02_ETS_Script\Log\20.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\21.ETS_View_FofFundData.sql                  -o .\02_ETS_Script\Log\21.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\22.ETS_View_vTradeConfirmGlStkMappingData.sql -o .\02_ETS_Script\Log\22.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\23.ETS_TradeConfirmFileList.sql							-o .\02_ETS_Script\Log\23.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\3.ETS_OrderRpt_FoF_Detail.sql                -o .\02_ETS_Script\Log\3.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\4.ETS_OrderRpt_FoF_Sum.sql                   -o .\02_ETS_Script\Log\4.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\5.ETS_OrderRpt_GlFTS.sql                     -o .\02_ETS_Script\Log\5.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\6.ETS_TradeConfirmFund.sql                   -o .\02_ETS_Script\Log\6.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\7.ETS_ProposalData.sql                       -o .\02_ETS_Script\Log\7.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\8.ETS_ProposalDataDec.sql                    -o .\02_ETS_Script\Log\8.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\9.ETS_OrderRpt_FTS.sql                  			-o .\02_ETS_Script\Log\9.txt

rem 03
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\00_Create_Tab_RMD_DFD.sql          		-o .\03_Yvonne\Log\00_Create_Tab_RMD_DFD.txt       
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\00_Create_TAB_RMD_DFTS.sql      				-o .\03_Yvonne\Log\00_Create_TAB_RMD_DFTS.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\00_Insert_Data.sql              				-o .\03_Yvonne\Log\00_Insert_Data.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\00_Update_TAB_PRT_MSREPORT_L.sql				-o .\03_Yvonne\Log\00_Update_TAB_PRT_MSREPORT_L.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\01_Uf_RMD_Dfd_IfExist.sql            	-o .\03_Yvonne\Log\01_Uf_RMD_Dfd_IfExist.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\01_Uf_RMD_Dfts_IfExist.sql      				-o .\03_Yvonne\Log\01_Uf_RMD_Dfts_IfExist.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\02_Up_RMD_Dfd_D.sql             				-o .\03_Yvonne\Log\02_Up_RMD_Dfd_D.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\02_Up_RMD_DFts_D.sql            				-o .\03_Yvonne\Log\02_Up_RMD_DFts_D.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\03_UP_RMD_Dfd_Add.sql           				-o .\03_Yvonne\Log\03_UP_RMD_Dfd_Add.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\03_UP_RMD_Dfts_Add.sql          				-o .\03_Yvonne\Log\03_UP_RMD_Dfts_Add.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\03_UP_RMD_DStk_Add.sql          				-o .\03_Yvonne\Log\03_UP_RMD_DStk_Add.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\04_UP_RMD_Dfd_Add_All.sql       				-o .\03_Yvonne\Log\04_UP_RMD_Dfd_Add_All.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\04_UP_RMD_DFts_Add_All.sql      				-o .\03_Yvonne\Log\04_UP_RMD_DFts_Add_All.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\05_UP_RMD_Dfd_Add_All_SE.sql    				-o .\03_Yvonne\Log\05_UP_RMD_Dfd_Add_All_SE.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\05_UP_RMD_DFts_Add_All_SE.sql   				-o .\03_Yvonne\Log\05_UP_RMD_DFts_Add_All_SE.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\UP_MSRprt_Add_Rcode07.sql       				-o .\03_Yvonne\Log\UP_MSRprt_Add_Rcode07.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\UP_MSRprt_Add_Rcode08.sql       				-o .\03_Yvonne\Log\UP_MSRprt_Add_Rcode08.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\UP_MSRprt_Add_Rcode09_1.sql     				-o .\03_Yvonne\Log\UP_MSRprt_Add_Rcode09_1.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\UP_MSRprt_Add_Rcode10.sql       				-o .\03_Yvonne\Log\UP_MSRprt_Add_Rcode10.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\03_Yvonne\UP_MSRprt_Add_Rcode11.sql         			-o .\03_Yvonne\Log\UP_MSRprt_Add_Rcode11.txt


rem 04
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\04_Vicky\cm_fund_data_FOF.sql              			-o .\04_Vicky\Log\cm_fund_data_FOF.sql              
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\04_Vicky\cm_fund_data_relation_FOF.sql     			-o .\04_Vicky\Log\cm_fund_data_relation_FOF.sql
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\04_Vicky\Riskmgt.dbo.RB_Rule_新增欄位.sql  			-o .\04_Vicky\Log\Riskmgt.dbo.RB_Rule_新增欄位.sql
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\04_Vicky\Riskmgt.dbo.RC_LookUp_新增資料.sql      -o .\04_Vicky\Log\Riskmgt.dbo.RC_LookUp_新增資料.sql



rem 05
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0101_EquityIndexFieldMapping.sql          -o .\05_Jack\Log\0101.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0201_CreateTable_CMoney_SIT.sql           -o .\05_Jack\Log\0201.txt 
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0202_CreateTable_CMoney_SITFund.sql       -o .\05_Jack\Log\0202.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0203_JobColumnMappingCreate.sql           -o .\05_Jack\Log\0203.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0204_JobListCreateSQL.sql                 -o .\05_Jack\Log\0204.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0301_FundDataCreate.sql                   -o .\05_Jack\Log\0301.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0302_FundPriceCreate.sql                  -o .\05_Jack\Log\0302.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0303_FundFieldMapping.sql                 -o .\05_Jack\Log\0303.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0401_CreateTable_FutureOptionProduct.sql  -o .\05_Jack\Log\0401.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0402_CreateTable_FuturesContractDetail.sql -o .\05_Jack\Log\0402.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0403_CreateTable_FuturesContractPrice.sql  -o .\05_Jack\Log\0403.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0404_Futures_FieldMapping.sql     					-o .\05_Jack\Log\0404.txt






        
        