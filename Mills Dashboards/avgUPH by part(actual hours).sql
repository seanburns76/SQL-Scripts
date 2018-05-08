


select 
a.[Ops Date],a.[Work Center], a.[Part Number],a.[Ship Quantity],a.[Ship Quantity]/a.[Actual Hours] as UPH,b.avgUPH
from vWorkOrder a left join vAverage_UPH b on b.[Part Number]=a.[Part Number]
where a.[Actual Hours] >0