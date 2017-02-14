USE [AM_COMM]
GO

INSERT INTO sc_MenuData(i_menu_group,menu_name,menu_desc,f_order)VALUES('ETS_MA_FoF','�l���','�l���','140')
INSERT INTO sc_MenuData(i_menu_group,menu_name,menu_desc,f_order)VALUES('ETS_TR_FoF','�l���','�l���','250')

INSERT INTO sc_Program(i_prg,prg_name,f_execute,f_def_fund_src,f_by_ifund,f_rebuild,src_dir,i_user_dev,systime,f_POPD,menu_name)VALUES('frmFoFDecision','�g�z�H�U��(�l���)','1','ETS','Y','N','','620',NULL,NULL,'�U��')
INSERT INTO sc_Program(i_prg,prg_name,f_execute,f_def_fund_src,f_by_ifund,f_rebuild,src_dir,i_user_dev,systime,f_POPD,menu_name)VALUES('frmFoFPEFundDecision','�g�z�H�U��(PEFund)','1','ETS','Y','N','','620',NULL,NULL,'PEFund�U��')
INSERT INTO sc_Program(i_prg,prg_name,f_execute,f_def_fund_src,f_by_ifund,f_rebuild,src_dir,i_user_dev,systime,f_POPD,menu_name)VALUES('frmFoFDealerDec','����^���@�~(�l���)','1','ETS','Y','N','','620',NULL,NULL,'�U��')
INSERT INTO sc_Program(i_prg,prg_name,f_execute,f_def_fund_src,f_by_ifund,f_rebuild,src_dir,i_user_dev,systime,f_POPD,menu_name)VALUES('frmCheckBrokerConfirmFoF','��ӽL��^��\����T�{�@�~(���)','1','ETS','Y','N','','620',NULL,NULL,'���')
INSERT INTO sc_Program(i_prg,prg_name,f_execute,f_def_fund_src,f_by_ifund,f_rebuild,src_dir,i_user_dev,systime,f_POPD,menu_name)VALUES('frmProposalData','Proposal��J','1','ETS','Y','N','','620',NULL,NULL,'Proposal��J')

INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('40','frmFoFDecision','ADUQ','ETS_MA_FoF','100','1')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('10','frmFoFDealerDec','ADUQ','ETS_TR_FoF','100','1')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('20','frmFoFDealerDec','ADUQ','ETS_TR_FoF','100','1')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('21','frmFoFDealerDec','ADUQ','ETS_TR_FoF','100','1')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('22','frmFoFDealerDec','ADUQ','ETS_TR_FoF','100','1')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('40','frmFoFPEFundDecision','ADUQ','ETS_MA_FoF','100','2')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('40','frmFoFDealerDec','ADUQ','ETS_TR_FoF','100','1')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('40','frmCheckBrokerConfirmFoF','ADUQ','ETS_ST_CHK','100','3')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('10','frmCheckBrokerConfirmFoF','ADUQ','ETS_ST_CHK','100','3')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('11','frmCheckBrokerConfirmFoF','ADUQ','ETS_ST_CHK','100','3')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('20','frmCheckBrokerConfirmFoF','ADUQ','ETS_ST_CHK','100','3')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('30','frmCheckBrokerConfirmFoF','ADUQ','ETS_ST_CHK','100','3')
INSERT INTO sc_Role_Program(i_role,i_prg,f_author_ui,f_author_data,i_task,f_order)VALUES('33','frmCheckBrokerConfirmFoF','ADUQ','ETS_ST_CHK','100','3')




