
with data as (
select ROW_NUMBER() over (partition by x.sflitm order by sfdate asc) as rank,x.*
from
(select distinct sfdate,sflitm,sfuncs
from vInvoiced) as x
where x.sflitm <> '' and x.sfuncs >0 and sfdate between '2018-01-01' and '2018-01-31')

select a.rank,a.sflitm,a.sfdate as costStart,
	(select b.sfdate
		from data b where b.sflitm=a.sflitm and b.rank % 2 = 0 and b.rank = a.rank + 1) as costEnd,
		a.sfuncs
from data a where a.rank % 2 = 1