

select 
[Part Number],
sum([Ship Quantity]) as qty,
SUM([Actual Hours]) as hrs,
sum([Ship Quantity])/sum([Actual Hours]) as avgUPH
from vWorkOrder
where [Actual Hours] > 0
group by [Part Number]
order by 4 desc