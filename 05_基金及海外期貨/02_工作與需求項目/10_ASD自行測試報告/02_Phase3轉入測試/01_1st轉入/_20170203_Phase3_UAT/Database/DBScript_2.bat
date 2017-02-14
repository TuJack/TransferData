
rem sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\11.ETS_Function_GetProductName.sql           -o .\02_ETS_Script\Log\11.txt
rem sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\15.ETS_View_v_fas_fn_dfd.sql                 -o .\02_ETS_Script\Log\15.txt
rem sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\02_ETS_Script\17.Riskmgt_View_v_fas_fn_fd_data.sql         -o .\02_ETS_Script\Log\17.txt
sqlcmd -S 10.67.99.107 -U tgl_admin -P 1qaz@WSX -i .\05_Jack\0404_Futures_FieldMapping.sql          		-o .\05_Jack\Log\0404.txt            