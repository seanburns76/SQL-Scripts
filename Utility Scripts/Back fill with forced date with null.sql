
if OBJECT_ID('tempdb..#dt') is not null
	drop table #dt
declare @start int = '20170101'
declare @end int = @start + 30

select @start as TransDate
	,1 as Value
into #dt

;with DateTable(day) as 
	(select @start as day
		union all 
	select day + 1
		from DateTable
			where day < @end
	)

select 
* 
from
(
select DateTable.day
	from DateTable
		left join #dt on #dt.TransDate = DateTable.day
) as t

left join

(

SELECT	'S'					AS RecordType
,		425					AS BusinessUnitID
,		425					AS Spare019 -- BrandID
,		cast(convert(varchar(8),rdate,112) as int) 		AS TransDate
,		cast(CONCAT(doco, dcto) as varchar(50))	AS OrderNo
,		lnid				AS LineNbr
,		dcto				AS LineSeq
,		
	case 
		when lnty = 'F'  then 'F'
		when dcto = 'CR' then 'C'
		when lnty = 'N' then 'N'
			else 'T' end as TransType

,		'425_' + cast(case
				when lnty = 'F'  then 0
					else itm end as varchar) as ProductKey

,		soad				AS CustomerNo
,		'UNK'				AS AAMarketChannel --?
,		'999'				AS MarketSegment --? tblASSA_MarketSegment 
,		'APS' 				AS SalesOrgCode --? Needs aligned with AAPS Regions
,		cast(CONCAT('R0', ac04) as varchar(10))	AS TerritoryCode
,		lprc				AS ListUnitPrice
,		lprc				AS StandardUnitPrice
,		uprc				AS NetUnitPrice
,		aexp				AS TransAmount

,		(case
				when lnty = 'F'  then 0
					else itm end) as PartNo

,		litm				AS PkgPartNo --?	
,		uorg				AS NoOfPackages
,		'1'					AS QuantityPerPkg
,		uorg				AS TransUnits
,		soqs				AS TransPieces
,		cast(mcu as varchar(3))	AS PlantCode
,		''					AS ReadySetNumber --?
,		doc					AS InvoiceNumber
,		cast(convert(varchar(8),drqj,112) as int) 		AS RequestDate
,		cast(convert(varchar(8),drqj,112) as int) 		AS ScheduleDate
,		(CASE
			WHEN addj IS NULL THEN 19010101
			ELSE cast(convert(varchar(8),addj,112) as int)
			END)										AS ActualShipDate

,		cast(convert(varchar(8),trdj,112) as int) 		AS PODate
,		cast(convert(varchar(8),trdj,112) as int) 		AS BookDate
,		cast(convert(varchar(8),ivd,112) as int) 		AS InvoiceDate
,		co					AS BUDefined025
,		doco				AS BUDefined076
,		sfxo				AS BUDefined026


FROM tblAAPS_SalesOrderHistory

where

 co='00003' -- only company 3
AND dcto <> 'ST' -- no transfers
AND litm NOT LIKE '%DEPOSIT%' -- no deposits
AND ktln = 0 -- exclude kit items
AND cndj IS NULL -- no canceled lines
AND lttr NOT IN ('980','984') -- no canceled line

) as d on t.day = d.TransDate

