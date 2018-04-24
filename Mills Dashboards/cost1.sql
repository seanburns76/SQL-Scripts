
select 
from vinvoiced
(select * from
(
select ROW_NUMBER() over (partition by sflitm,sflitm order by sfdate asc) as seq,
	sfdate,
	sflitm,
	sfuncs
from vInvoiced
where sflitm <> '' and sfuncs > 0) as x where x.seq % 2 = 0) as even
