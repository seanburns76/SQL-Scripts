

select count(*) as Booking from Booking b
where b.sfdate = cast(getdate()-1 as date)

select count(*) as Backlog from Backlog ba
where ba.sfdate = cast(getdate()-1 as date)

select count(*) as Other from Other o
where o.sfdate = cast(getdate()-1 as date)

select count(*) as Invoice from Invoiced i
where i.sfdate = cast(getdate()-1 as date)