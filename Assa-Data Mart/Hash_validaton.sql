--=========================== SALES ===============================================================



select 
p.DataType, sum(p.TotalDollars) as total
 from 
(
SELECT	425	AS BusinessUnitId
,		 x.TransDate
,		'Sales'		AS DataType
,		count(*)	AS RecordCount
,		sum(x.TransUnits)	AS TotalUnits
,		sum(x.TransAmount)	AS TotalDollars
,		sum(x.TransPieces)	AS TotalPieces



from vsalesimport as x



	where CONVERT(date,convert(varchar(10),x.transdate)) > cast(GETDATE() - 300 as date)
	and x.transtype NOT IN ('F','N')


	GROUP BY X.TransDate

--==================================================================================================

	UNION

--===================== SALES NC ===================================================================

SELECT	425	AS BusinessUnitId
,		 y.TransDate
,		'SalesNC'		AS DataType
,		count(*)	AS RecordCount
,		sum(Y.TransUnits)	AS TotalUnits
,		sum(Y.TransAmount)	AS TotalDollars
,		sum(Y.TransPieces)	AS TotalPieces



from


vsalesimport as y
	where CONVERT(date,convert(varchar(10),y.transdate)) > cast(GETDATE() - 300 as date)
	and Y.TransType = 'N'

	GROUP BY Y.TransDate


--==================================================================================================

	UNION

--===================== FREIGHT ====================================================================

SELECT	425	AS BusinessUnitId
,		 TransDate
,		'Freight'		AS DataType
,		count(*)	AS RecordCount
,		sum(z.TransUnits)	AS TotalUnits
,		sum(z.TransAmount)	AS TotalDollars
,		sum(z.TransPieces)	AS TotalPieces



from


vsalesimport as z
	where CONVERT(date,convert(varchar(10),z.transdate)) > cast(GETDATE() - 300 as date)
	and z.TransType = 'F'

	GROUP BY Z.TransDate


--==================================================================================================

	union

--===================== BOOKINGS ====================================================================
	
SELECT	425	AS BusinessUnitId
,		 TransDate
,		'Bookings'		AS DataType
,		count(*)	AS RecordCount
,		sum(a.TransUnits)	AS TotalUnits
,		sum(a.TransAmount)	AS TotalDollars
,		sum(a.TransPieces)	AS TotalPieces



FROM

vbookingsimport as a

where CONVERT(date,convert(varchar(10),a.transdate)) > cast(GETDATE() - 300 as date)

				


and  a.TransType <> 'N'

group by a.TransDate

--==========================================================================================================

UNION 

--========== BOOKINGS NO CHARGE =============================================================================

SELECT	425	AS BusinessUnitId
,		 TransDate
,		'BookingsNC'		AS DataType
,		count(*)	AS RecordCount
,		sum(b.TransUnits)	AS TotalUnits
,		sum(b.TransAmount)	AS TotalDollars
,		sum(b.TransPieces)	AS TotalPieces

from

vBookingsimport as b
where CONVERT(date,convert(varchar(10),b.transdate)) > cast(GETDATE() - 300 as date)

				


and b.TransType = 'N'

group by b.TransDate) as p

where p.TransDate > 20170930 and p.TransDate < 20171019


group by p.DataType