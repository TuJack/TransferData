use ETS_P 

/* ���F�קK����i��o�͸�ƿ򥢪����D�A�z���ӥ��Բ��˵������O�X�A�M��~��b��Ʈw�]�p�u�����ҥH�~����m����C*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_FOHedgeMapping
	(
	FundID varchar(10) NOT NULL,
	FoFundID varchar(10) NOT NULL,
	Country varchar(5) NOT NULL,
	FoIndex varchar(10) NOT NULL,
	Correlation decimal(18, 6) NULL,
	Beta decimal(18, 6) NULL,
	BeginDT datetime NOT NULL,
	EndDT datetime NULL,
	ModifyUser varchar(50) NOT NULL,
	ModifyDT datetime NOT NULL,
	UpdateErrMsg varchar(200) NULL,
	UpdateDT datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_FOHedgeMapping SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.FOHedgeMapping)
	 EXEC('INSERT INTO dbo.Tmp_FOHedgeMapping (FundID, FoFundID, Country, FoIndex, Correlation, Beta, BeginDT, EndDT, ModifyUser, ModifyDT, UpdateErrMsg, UpdateDT)
		SELECT FundID, FoFundID,''TW'', FoIndex, Correlation, Beta, BeginDT, EndDT, ModifyUser, ModifyDT, UpdateErrMsg, UpdateDT FROM dbo.FOHedgeMapping WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.FOHedgeMapping
GO
EXECUTE sp_rename N'dbo.Tmp_FOHedgeMapping', N'FOHedgeMapping', 'OBJECT' 
GO


ALTER TABLE dbo.FOHedgeMapping ADD CONSTRAINT
	PK_FOHedgeMappingNewNew PRIMARY KEY CLUSTERED 
	(
	FundID,
	FoFundID,
	Country
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO


COMMIT


