 
use isdbTGL

update gl_Acc_data set nacc = '已實現損益-FVTPL股票(上市櫃)', dc = '-1' where iacc = '741121'
update gl_Acc_data set dc = '-1' where iacc = '741131'

insert into gl_Acc_data(dstart_w,dend_w,iacc,nacc,eacc,dc,channel)values('19630101','99999999','141332','國外AFS價差評價','','1','0')
insert into gl_Acc_data(dstart_w,dend_w,iacc,nacc,eacc,dc,channel)values('19630101','99999999','141432','基金匯差','','1','0')
insert into gl_Acc_data(dstart_w,dend_w,iacc,nacc,eacc,dc,channel)values('19630101','99999999','741031','已實現損益-國內REBATE','','-1','9')
insert into gl_Acc_data(dstart_w,dend_w,iacc,nacc,eacc,dc,channel)values('19630101','99999999','741032','已實現損益-國外REBATE','','-1','9')

update gl_Acc_data set nacc = '國內利息收入調整' where iacc = '741831'
update gl_Acc_data set nacc = '國外利息收入調整' where iacc = '741832'
 
