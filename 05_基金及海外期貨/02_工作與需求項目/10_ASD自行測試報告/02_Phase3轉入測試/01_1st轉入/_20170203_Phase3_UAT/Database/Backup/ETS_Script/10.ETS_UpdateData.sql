use ETS_P 

update FundUser set product = 'FTS' where product = 'FO'
update mappingcode set mid = 'FTS',mname = '���f' where mcid = 'eProduct' and mid = 'FO'

delete mappingcode where mcid = 'FoFBS' and mid = 'T'
insert into mappingcode 
select 'FoFBuyPriceType','1','���B����','','system',getdate()
insert into mappingcode 
select 'FoFSellPriceType','1','����ū�^','1','system',getdate()
insert into mappingcode 
select 'FoFSellPriceType','2','����ū�^','2','system',getdate()

insert into mappingcode 
select 'FoFTradeType','1','�@��','1','system',getdate()
insert into mappingcode 
select 'FoFTradeType','2','PEFund','2','system',getdate()


insert into mappingcode 
select 'FoIndex','SPX','S&P500����','3','system',getdate()
insert into mappingcode 
select 'FoIndex','SHSZ300','���`�T��','4','system',getdate()


