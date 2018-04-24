


select * from
(select top 1 b.sfdate as booking
from Booking as b
order by b.sfdate desc) as booking

cross join


(select top 1 i.sfdate as invoiced
from Invoiced as i
order by i.sfdate desc) as invoiced

cross join


(select top 1 bl.sfdate as backlog
from Backlog as bl
order by bl.sfdate desc) as backlog

cross join


(select top 1 o.sfdate as other
from other as o
order by o.sfdate desc) as other