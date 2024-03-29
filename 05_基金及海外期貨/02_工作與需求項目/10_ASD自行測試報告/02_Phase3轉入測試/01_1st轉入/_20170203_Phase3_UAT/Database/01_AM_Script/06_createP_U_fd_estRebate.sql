USE [isdbTGL]
GO
/****** Object:  StoredProcedure [dbo].[P_U_fd_estRebate]    Script Date: 2017/1/20 下午 03:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update fn_fd_estRebate
create PROCEDURE [dbo].[P_U_fd_estRebate] (@dstart varchar(8) , @dend varchar (8))

--select * from fn_fd_estRebate

AS     
Begin
--exec P_U_fd_estRebate '20161001', '20161231'

--一律先刪除
delete fn_fd_estRebate where ddate_w between @dstart and @dend

insert into fn_fd_estRebate
select x.ddate_w, x.iagtid, x.fdtype, i.curtype,x.amt,i.fdrate, round(x.amt * i.fdrate / 365, [dbo].[F_Q_Get_CurrDecimal](x.fdicurid)) as int , x.fdicurid, 0, getdate()
from (
select aa.iagtid, aa.ddate_w, sum(aa.mamt) as amt, aa.fdtype, aa.fdicurid
from [dbo].[F_Q_Get_RebateDetail](@dstart,@dend) aa
group by aa.iagtid, aa.ddate_w, aa.fdtype, aa.fdicurid
) x
inner join fn_fd_iagtfdtype i on x.iagtid = i.iagtid and x.fdtype = i.fdtype and x.amt >= i.low_amt and x.amt <= i.upper_amt

end



