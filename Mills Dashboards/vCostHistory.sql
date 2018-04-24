

WITH data
AS (SELECT
  ROW_NUMBER() OVER (PARTITION BY y.[part number] ORDER BY y.coststart ASC) AS seq1,
  *
FROM (SELECT
  [Part Number],
  [Unit Cost],
  MIN([Ops Date]) AS CostStart,
  MAX([ops date]) AS CostEnd
FROM (SELECT
  ROW_NUMBER() OVER (PARTITION BY x.sflitm ORDER BY x.sfdate ASC) AS seq,
  x.sfdate AS [Ops Date],
  x.sflitm AS [Part Number],
  x.sfuncs AS [Unit Cost]
FROM (SELECT DISTINCT
  i.sfdate,
  RTRIM(i.sflitm) AS sflitm,
  i.sfuncs
FROM vInvoiced i where i.sfuncs >0) AS x
) t
GROUP BY [Part Number],
         [Unit Cost]) y)



SELECT
  a.[Part Number],
  a.CostStart,
  DATEADD(dd, -1, b.CostStart) AS costend,
  a.[Unit Cost]
FROM data a
LEFT JOIN data b
  ON b.[Part Number] = a.[Part Number]
WHERE b.seq1 = a.seq1 + 1
