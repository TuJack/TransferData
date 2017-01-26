select * from bloomberg.dbo.funddata

SELECT          TOP (200) iFdID, iFdName, iFdEName, iFdELongName, ISINCode, dIssue_w, dEnd_w, iCountry, iCurid, invRegion, 
                            invTarget, fundType, fundAssets, fundAssetsCurency, fundAssetsDate, issueCountry, systime, time_update, 
                            flags
FROM              bloomberg.dbo.FundData

select 'FoF' as classcod, iFdID, iFdName, iFdEName, sitData.Com_No com_id,
       ISINCode,
       isnull(SITData.sitid, '') as compno,
	   (case when FundData.iCurid =  'TWD' then '1' else '2' end) as fdis,
	   (case when FundData.fundType = 'Fixed Income' then '01'
	         when FundData.fundType = 'Equity' then '02'
			 when FundData.fundType = 'Mixed Allocation' then '03'
			 when FundData.fundType = 'Money Market' then '05'
			 else '12' end) as fkind, 
	   FundData.fundType as fkind_blg, 
	   FundData.dIssue_w as dIssue_w, 
	   FundData.iCountry as iCountry, 
	   FundData.iCurid as iCurid, 
	   FundData.invRegion as invRegion, 
	   FundData.invTarget as invTarget, 
       FundData.issueCountry as issue_cntry, 
	   'Bloomberg' as i_user_update,
	   isnull(FundData.Fund_industry_Focus,'') as Fund_industry_Focus,
	   fundData.fundAssets * 1000000 as PE_Fundsize_real,
	   fundData.fundAssetsCurency as PE_Fundsize_Real_icurid
  FROM bloomberg.dbo.FundData FundData left outer join
       (
	    select sitfund.Fundid fundid, sitFund.cname cname, 
	           sitFund.isin, sitFund.sitid sitid, sitFund.sitcname sitCName,
               sit.ename sitEName, sit.Com_no Com_No
          from CMoney.dbo.CMoney_SITFund sitFund inner join CMoney.dbo.CMoney_SIT sit
            on sitFund.sitid = sit.sitid
	   )  SITData 
	   on FundData.ISINCode = SITData.isin




