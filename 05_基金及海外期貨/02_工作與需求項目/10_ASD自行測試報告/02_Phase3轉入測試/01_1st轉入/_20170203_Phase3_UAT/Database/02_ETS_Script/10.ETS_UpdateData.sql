use ETS_P 

update FundUser set product = 'FTS' where product = 'FO'
update mappingcode set mid = 'FTS',mname = '期貨' where mcid = 'eProduct' and mid = 'FO'

delete mappingcode where mcid = 'FoFBS' and mid = 'T'
insert into mappingcode 
select 'FoFBuyPriceType','1','金額申購','','system',getdate()
insert into mappingcode 
select 'FoFSellPriceType','1','單位數贖回','1','system',getdate()
insert into mappingcode 
select 'FoFSellPriceType','2','全部贖回','2','system',getdate()

insert into mappingcode 
select 'FoFTradeType','1','一般','1','system',getdate()
insert into mappingcode 
select 'FoFTradeType','2','PEFund','2','system',getdate()


insert into mappingcode 
select 'FoIndex','SPX','S&P500指數','3','system',getdate()
insert into mappingcode 
select 'FoIndex','SHSZ300','滬深三百','4','system',getdate()


