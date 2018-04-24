


SELECT        
	 'S'															AS RecordType
	, 425															AS BusinessUnitID
	, '425'															AS Spare019 
	, CAST(CONVERT(varchar(8), sfdate, 112) AS int)					AS TransDate
	, CAST(sfdoco AS varchar) + sfdcto								AS OrderNo
	, sflnid														AS LineNbr
	, CAST(sfdcto AS varchar(10))									AS LineSeq
    , CASE WHEN sflnty = 'F' THEN 'F' 
			WHEN sfdcto = 'CR' THEN 'C' 
			WHEN sflnty = 'N' THEN 'N' 
			ELSE 'T' END											AS TransType
	
	, '425_' + CAST(CASE WHEN sflnty = 'F' THEN 0 
						ELSE sfitm END AS varchar)					AS ProductKey
    ,  CAST(sfsoad AS varchar(20))									AS CustomerNo
	, 'UNK'															AS AAMarketChannel
	, '999'															AS MarketSegment
	, 'APS'															AS SalesOrgCode
	, CAST(CONCAT('R0', sfac04) AS varchar(10))						AS TerritoryCode
	, sflprc														AS ListUnitPrice 
	, sflprc														AS StandardUnitPrice
	, sfuprc														AS NetUnitPrice
	, sfaexp														AS TransAmount
	, CAST(CASE WHEN sflnty = 'F' THEN 0 
				ELSE sfitm END AS varchar)							AS PartNo
	
	, CAST(sflitm AS varchar(40))									AS PkgPartNo
	, sfuorg														AS NoOfPackages 
	, 1																AS QuantityPerPkg
	, sfuorg														AS TransUnits
	, sfsoqs														AS TransPieces
	, CAST(sfmcu AS varchar(3))										AS PlantCode
	, ''															AS ReadySetNo
	, CAST(sfdoc AS varchar(40)) AS InvoiceNo
	, CAST(CONVERT(varchar(8), sfdrqj, 112) AS int)                 AS RequestDate
	, CAST(CONVERT(varchar(8), sfdrqj, 112) AS int)					AS ScheduleDate
	, (CASE WHEN sfaddj IS NULL THEN 19010101 
			ELSE CAST(CONVERT(varchar(8), sfaddj, 112) AS int) END) AS ActualShipDate 
                         
	, CAST(CONVERT(varchar(8), sftrdj, 112) AS int)					AS PODate
	, CAST(CONVERT(varchar(8), sftrdj, 112) AS int)					AS BookDate	
	, CAST(CONVERT(varchar(8), sfivd, 112) AS int)					AS InvoiceDate
	, CAST(sfco AS varchar(40))										AS BUDefined025 
    , sfdoco														AS BUDefined076
	, CAST(sfsfxo AS varchar(40))									AS BUDefined026
	, (CASE WHEN sflnty = 'F' THEN sfaexp
			ELSE 0 END	)											AS FreightAmount

FROM            vInvoiced

WHERE        (sfco = '00003') AND (sfdcto <> 'ST') AND (sflitm NOT LIKE '%DEPOSIT%') AND (sfktln = 0) AND (sfcndj IS NULL) AND (sflttr NOT IN ('980', '984'))
and sfdate > '2017-10-21'