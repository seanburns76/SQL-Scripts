

select av.[Part Number],SUM(qty)/(sum(av.ticks)/60.0/60.0) as AvgUPH
from

(
select 
a.[Order Number],b.[Part Number],sum(a.quantity) as qty, sum(DATEDIFF(SECOND,a.start,a.stop)) as ticks
from vSeamlessProd a left join (select distinct x.[Order Number],x.[Part Number]  from vSeamlessProd x) b on b.[Order Number]=a.[Order Number]
where b.[Part Number] is not null or b.[Part Number] <> ''
group by a.[Order Number],b.[Part Number]
) av
where av.qty > 0
group by av.[Part Number]
order by 2 desc
