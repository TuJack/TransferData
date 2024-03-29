USE [isdbTGL]
GO
/****** Object:  StoredProcedure [dbo].[P_U_FS_FD_Trade]    Script Date: 2017/2/3 下午 04:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[P_U_FS_FD_Trade]  
(@Stype varchar(1)--@買賣別
,@Sdtrans varchar(8)--交易日
,@Sifund varchar(10)--基金代號
,@SifdID varchar(15)--bloomberg ticker
,@Samt decimal(18,6)=0--金額(贖回預設為0)
,@Sqty decimal(15,4)=0--單位數(申購預設為0)
,@Spnav decimal(18,6)=0--淨值
,@Sicurid varchar(4)=''--幣別
,@Stfee decimal(18,6)=0--郵匯費(預設為0)
,@Shfee decimal(18,6)=0--手續費(預設為0)
,@Sdacc varchar(8)=''--上帳日(預設為空白)
,@Spay varchar(8)=''--付款日(預設為空白)
,@Sdpnav varchar(8)=NULL--淨值採用日
,@Sibank varchar(5)=''--銀行代碼
,@Siaccount varchar(15)=''--帳戶代碼
,@ifdid_buy varchar(15)=''--轉申購基金
,@Sdtrans_buy varchar(8)=NULL--轉申購基金轉出交易日
,@etsno int=0--電子下單單號
,@adacc varchar(40)=''--交易員ad
,@settle_seqno varchar(13) = '' --交割編號
,@fstype varchar(1) = '' --申購/贖回方式(1單位數申購 2金額申購)
,@InsDeltype varchar(1) = 'I' --I新增D刪除
)


AS     
declare @PitdNO as varchar(24)
declare @Pihead varchar(15)
declare @Ptmp as varchar(1)
declare @Ptmp2 as varchar(1)
set @PitdNO =''
set @Pihead =''
set @Ptmp =''
set @Ptmp2 =''

--for procedure
declare @Perrdesc varchar(50)
declare @Perrmsg varchar(50)
declare @Pmsum decimal(18,6)
declare @chkdata int
declare @iagtid varchar(5)
set @Perrdesc =''
set @Perrmsg = ''
set @Pmsum =0
set @chkdata =0
set @iagtid =''

declare @monfund as varchar(10) --level2帳號
declare @PitdNOmonfund as varchar(50) --level2帳號成交單號
declare @accountType as varchar(10)
set @monfund =''
set @PitdNOmonfund =''
set @accountType =''

--========================================檢查=======================================BEGIN
	--檢查是否有基本資料
	select @chkdata=count(ifdid) from fn_fd_data where ifdid = @SifdID
	if  @chkdata=0
		begin
			set @Perrdesc='無基金基本資料'
			goto EndPro
		end 

	--檢查是否有投組資料
	Select @Sifund = orifund from isdbtgl.dbo.cm_monfund_relation where subfund in (select monfund from isdbtgl.dbo.cm_fund_relation where sonfund = @Sifund)
	if @Sifund = NULL
		begin
			set @Perrdesc='無投組基本資料'
			goto EndPro
		end 

	select @monfund = isnull(monfund,''), @accountType = b.accountType 
	from cm_fund_relation a left join cm_fund_data b on b.ifund = a.sonfund where b.ifund = @Sifund 

	if @monfund = ''
	Begin
		set @Perrdesc='該帳戶找不到所屬LEVEL2!'
			
		if @Perrdesc <> ''		
		begin
			goto EndPro
		end 
	END
--========================================檢查=======================================END

--========================================公用資料=======================================BEGIN
	--會計科目
	select @accountType = isnull(AccountType,'') from cm_fund_data where ifund = @Sifund
	if  @accountType=''
		begin
			set @Perrdesc='查無基金會計科目'
			goto EndPro
		end 

	--交易對手
	select @iagtid = isnull(compno,'') from fn_fd_data where ifdid = @Sifdid
	if  @iagtid=''
		begin
			set @Perrdesc='查無此基金之交易對手'
			goto EndPro
		end 

--========================================公用資料=======================================END

--增刪資料開始

	IF @insdeltype = 'I' 
	BEGIN
		IF  @Stype='B'   
		BEGIN
			if len(@Sdtrans)=6 set @Ptmp='0'
			else set @Ptmp=''
			if len(@Sifund)=2 set @Ptmp2='0'
			else set @Ptmp2=''

			set @Pihead = 'ETS'+@Ptmp2+rtrim(@Sifund)+@Ptmp+@Sdtrans
			exec usp_cm_autogetno 'ETS', @Pihead,  5 ,@rNo = @PitdNO OUTPUT 
			if @PitdNO=''
			begin
				set @Perrdesc='系統給號功能失敗,請連絡電腦室'
				GOTO EndPro
			end

			--level2
			set @PitdNOmonfund =''
			if len(@Sdtrans)=6 set @Ptmp='0'
			else set @Ptmp=''
			if len(@monfund)=2 set @Ptmp2='0'
			else set @Ptmp2=''

			set @Pihead = 'ETS'+@Ptmp2+rtrim(@monfund)+@Ptmp+@Sdtrans
			exec usp_cm_autogetno 'ETS', @Pihead,  5 ,@rNo = @PitdNOmonfund OUTPUT 
			if @PitdNOmonfund=''
			begin
				set @Perrdesc='系統給號功能失敗,請連絡電腦室'
				GOTO EndPro
			end	
			
			-- 實際付出總金額(申購金額 + 手續費 + 郵匯費)
			set @Pmsum= @Samt + @Stfee + @Shfee 
 			BEGIN TRANSACTION

				delete fn_fd_buy Where ifund = @Sifund and dtrans_w = @Sdtrans and ifdid = @Sifdid and itdno = @etsno  
				delete fn_fd_buy Where ifund = @monfund and dtrans_w = @Sdtrans and ifdid = @Sifdid and itdno = @PitdNOmonfund  
				if @PitdNO is not NULL 
					Begin	
						insert into fn_fd_buy(itdNo, ifund, ifdID, dtrans_w, dacc_w, tb_amt, tb_qty, pnav, tb_hfee, tb_tfee, tb_msum, icurid, dpay_w, kind, dpnavb_w, 
							AccountType, iagtid, ibank, CashAccount, i_user_update, time_update, systime, memo, sub_itdno, ETSDecseq, settle_seqno, fstype)
									values(@PitdNO, @Sifund ,@Sifdid, @Sdtrans, @Sdtrans ,@Samt, @Sqty, @Spnav ,@Shfee, @Stfee, @Pmsum, @Sicurid, @Spay, '1' ,@Sdpnav,
									@AccountType, @iagtid, @Sibank, @Siaccount, @adacc, getdate(), getdate(), '', '', @etsno ,@settle_seqno, @fstype)
					End	
				if @PitdNOmonfund is not NULL 
					Begin	
						insert into fn_fd_buy(itdNo, ifund, ifdID, dtrans_w, dacc_w, tb_amt, tb_qty, pnav, tb_hfee, tb_tfee, tb_msum, icurid, dpay_w, kind, dpnavb_w, 
							AccountType, iagtid, ibank, CashAccount, i_user_update, time_update, systime, memo, sub_itdno, ETSDecseq, settle_seqno, fstype)
									values(@PitdNOmonfund, @monfund ,@Sifdid, @Sdtrans, @Sdtrans ,@Samt, @Sqty, @Spnav ,@Shfee, @Stfee, @Pmsum, @Sicurid, @Spay, '1' ,@Sdpnav,
									@AccountType, @iagtid, @Sibank, @Siaccount, @adacc, getdate(), getdate(), '', @PitdNO, @etsno, @settle_seqno , @fstype)
					end
		
				IF @@ERROR <> 0 
					BEGIN
						set @Perrmsg='基金交易檔增刪發生錯誤'
						set @Perrdesc= @PitdNO + '塞入基金申購檔發生錯誤'
						GoTo ENDPro	
					END
				ELSE
					BEGIN
						update fund_updDate set dlast_update_w = @Sdtrans where ifund = @Sifund and dlast_update_w > @Sdtrans 
						update fund_updDate set dlast_update_w = @Sdtrans where ifund = @monfund and dlast_update_w > @Sdtrans 
						set @Perrdesc=''
					END
			COMMIT TRANSACTION
		END

		If  @Stype='S'   
		BEGIN
			if len(@Sdtrans)=6 set @Ptmp='0'
			else set @Ptmp=''
			if len(@Sifund)=2 set @Ptmp2='0'
			else set @Ptmp2=''

			set @Pihead = 'ETS'+@Ptmp2+rtrim(@Sifund)+@Ptmp+@Sdtrans
			exec usp_cm_autogetno 'ETS', @Pihead,  5 ,@rNo = @PitdNO OUTPUT 
			if @PitdNO=''
			begin
				set @Perrdesc='系統給號功能失敗,請連絡電腦室'
				GOTO EndPro
			end

			--level2
			set @PitdNOmonfund =''
			if len(@Sdtrans)=6 set @Ptmp='0'
			else set @Ptmp=''
			if len(@monfund)=2 set @Ptmp2='0'
			else set @Ptmp2=''

			set @Pihead = 'ETS'+@Ptmp2+rtrim(@monfund)+@Ptmp+@Sdtrans
			exec usp_cm_autogetno 'ETS', @Pihead,  5 ,@rNo = @PitdNOmonfund OUTPUT 
			if @PitdNOmonfund=''
			begin
				set @Perrdesc='系統給號功能失敗,請連絡電腦室'
				GOTO EndPro
			end	

			-- 實際收到總金額(贖回金額 - 手續費 - 郵匯費) 
			set @Pmsum= @Samt - @Stfee - @Shfee 

 			BEGIN TRANSACTION
				delete fn_fd_sell Where ifund = @Sifund and dtrans_w = @Sdtrans and ifdid = @Sifdid and itdno = @etsno  
				delete fn_fd_sell Where ifund = @monfund and dtrans_w = @Sdtrans and ifdid = @Sifdid and itdno = @PitdNOmonfund  
				if @PitdNO is not NULL 
					Begin	
						insert into fn_fd_sell(itdNo, ifund, ifdID, dtrans_w, dacc_w, dpay_w, fstype, ts_amt, ts_qty, pnav, ts_hfee, ts_tfee, ts_msum, icurid, 
						dtrans_buy_w, dpnavs_w, AccountType, iagtid, ibank, CashAccount, i_user_update, time_update, systime, memo, sub_itdno, ETSDecseq, settle_seqno)
									values(@PitdNO, @Sifund ,@Sifdid, @Sdtrans, @Sdtrans, @Spay, @fstype ,@Samt, @Sqty, @Spnav ,@Shfee, @Stfee, @Pmsum, @Sicurid, 
									'' ,@Sdpnav, @AccountType, @iagtid, @Sibank, @Siaccount, @adacc, getdate(), getdate(), '', '', @etsno, @settle_seqno)
					End	
				if @PitdNOmonfund is not NULL 
					Begin	
						insert into fn_fd_sell(itdNo, ifund, ifdID, dtrans_w, dacc_w, dpay_w, fstype, ts_amt, ts_qty, pnav, ts_hfee, ts_tfee, ts_msum, icurid, 
						dtrans_buy_w, dpnavs_w, AccountType, iagtid, ibank, CashAccount, i_user_update, time_update, systime, memo, sub_itdno, ETSDecseq, settle_seqno)
									values(@PitdNOmonfund, @monfund ,@Sifdid, @Sdtrans, @Sdtrans, @Spay, @fstype ,@Samt, @Sqty, @Spnav ,@Shfee, @Stfee, @Pmsum, @Sicurid, 
									'' ,@Sdpnav, @AccountType, @iagtid, @Sibank, @Siaccount, @adacc, getdate(), getdate(), '', @PitdNO, @etsno, @settle_seqno)
					end
				IF @@ERROR <> 0 
					BEGIN
						set @Perrmsg='基金交易檔增刪發生錯誤'
						set @Perrdesc= @PitdNO + '塞入基金贖回檔發生錯誤'
						GoTo ENDPro	
					END
				ELSE
					BEGIN
						update fund_updDate set dlast_update_w = @Sdtrans where ifund = @Sifund and dlast_update_w > @Sdtrans 
						update fund_updDate set dlast_update_w = @Sdtrans where ifund = @monfund and dlast_update_w > @Sdtrans 
						set @Perrdesc=''
					END
			COMMIT TRANSACTION
		END
	END


	IF @insdeltype = 'D'
	BEGIN
		If  @Stype='B'   
		BEGIN
			BEGIN TRANSACTION
				Delete fn_fd_buy Where ifund = @Sifund and dtrans_w = @Sdtrans and ifdid = @Sifdid and ETSDecseq = @etsno 
				Delete fn_fd_buy Where ifund = @monfund and dtrans_w = @Sdtrans and ifdid = @Sifdid and ETSDecseq = @etsno 
				IF @@ERROR <> 0 
					BEGIN
						set @Perrmsg='基金交易檔增刪發生錯誤'
						set @Perrdesc= @PitdNO + '刪除基金申購檔發生錯誤'
						GoTo ENDPro	
					END
				ELSE
					BEGIN
						update fund_updDate set dlast_update_w = @sdtrans where ifund = @Sifund  and dlast_update_w > @Sdtrans
						update fund_updDate set dlast_update_w = @Sdtrans where ifund = @monfund and dlast_update_w > @Sdtrans 
						set @Perrdesc=''
					END
			COMMIT TRANSACTION
		END
	
		If  @Stype='S'   
		BEGIN
			BEGIN TRANSACTION
				Delete fn_fd_sell Where ifund = @Sifund and dtrans_w = @Sdtrans and ifdid = @Sifdid and ETSDecseq = @etsno 
				Delete fn_fd_sell Where ifund = @monfund and dtrans_w = @Sdtrans and ifdid = @Sifdid and ETSDecseq = @etsno 
				IF @@ERROR <> 0 
					BEGIN
						set @Perrmsg='基金交易檔增刪發生錯誤'
						set @Perrdesc= @PitdNO + '刪除基金贖回檔發生錯誤'
						GoTo ENDPro	
					END
				ELSE
					BEGIN
						update fund_updDate set dlast_update_w = @sdtrans where ifund = @Sifund  and dlast_update_w > @Sdtrans
						update fund_updDate set dlast_update_w = @Sdtrans where ifund = @monfund and dlast_update_w > @Sdtrans 
						set @Perrdesc=''
					END
			COMMIT TRANSACTION
		END
	END


EndPro:
	IF (@Perrdesc <> '')
	BEGIN
		IF @Perrmsg = '基金交易檔增刪發生錯誤'
			BEGIN
				ROLLBACK TRANSACTION
			END
		RAISERROR (@Perrdesc,11,1);
	END
