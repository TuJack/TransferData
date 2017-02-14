USE [isdbTGL]
GO
--TG0403-基金買入交易
insert into cm_symbol values ('FN34', '1', '一般交易', '1', '1', '', '19630101', '99999999')
go
insert into cm_symbol values ('FN34', '2', '轉申購', '2', '2', '', '19630101', '99999999')
go
insert into cm_symbol values ('FN34', '3', '股利再投資', '3', '3', '', '19630101', '99999999')
go

--select *
--into Log_fn_fd_buy
--from Log_fn_stk_trade
--where 1 = 2

--TG0404-基金贖回交易
insert into cm_symbol values ('FN35', '1', '單位數', '1', '1', '', '19630101', '99999999')
go
insert into cm_symbol values ('FN35', '2', '金額', '2', '2', '', '19630101', '99999999')
go

--select *
--into Log_fn_fd_sell
--from Log_fn_stk_trade
--where 1 = 2

--TG0406-基金配息領取

--select *
--into Log_fn_fd_getch
--from Log_fn_stk_trade
--where 1 = 2

--TG0408-基金Rebate領取

--select *
--into Log_fn_fd_rebate
--from Log_fn_stk_trade
--where 1 = 2
