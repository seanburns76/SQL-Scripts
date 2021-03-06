SELECT
 a.StartDate as OpsDate,
  a.[Order Number] as [Base WO],
  b.[Order Number] as [Concurrent WO],
  b.[Work Center],
  a.StartTime as [Base Start Time],
  b.starttime as [Concurrent Start Time],
  a.StopTime as [Base Stop Time],
  b.StopTime as [Concurrent Stop Time],
  a.[Part Number] as [Base Part Number],
  b.[Part Number] as [Concurrent Part Number]
 
FROM vSeam_WorkCenter a
LEFT JOIN (SELECT
  x.StartDate,
  x.StartTime,
  x.stoptime,
  x.[Work Center],
  x.[Order Number],
  x.[Ops Start],
  x.[Ops Stop],
  x.[Part Number]
FROM vSeam_WorkCenter x) b
  ON b.StartDate = a.StartDate
  AND b.[Work Center] = a.[Work Center]
WHERE b.[Ops Stop] BETWEEN a.[Ops Start] AND a.[Ops Stop]
AND b.[Ops Start] > a.[Ops Start]
AND b.[Order Number] <> a.[Order Number]
UNION
SELECT
  a.StartDate as OpsDate,
  a.[Order Number] as [Base WO],
  b.[Order Number] as [Concurrent WO],
  b.[Work Center],
  a.StartTime as [Base Start Time],
  b.starttime as [Concurrent Start Time],
  a.StopTime as [Base Stop Time],
  b.StopTime as [Concurrent Stop Time],
  a.[Part Number] as [Base Part Number],
  b.[Part Number] as [Concurrent Part Number]
  
  
FROM vSeam_WorkCenter a
LEFT JOIN (SELECT
  x.StartDate,
  x.StartTime,
  x.stoptime,
  x.[Work Center],
  x.[Order Number],
  x.[Ops Start],
  x.[Ops Stop],
  x.[Part Number]
FROM vSeam_WorkCenter x) b
  ON b.StartDate = a.StartDate
  AND b.[Work Center] = a.[Work Center]
WHERE b.[Ops Stop] BETWEEN a.[Ops Start] AND a.[Ops Stop]
AND b.[Ops Start] < a.[Ops Start]
AND b.[Order Number] <> a.[Order Number]