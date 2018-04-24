


if (select count(*) from productmaster where sfitm = 19807) > 1

begin
    select * from productmaster where sfitm = 19807
end
else if (select count(*) from productmaster where sfitm = 70424) > 0
begin
    select * from productmaster where sfitm = 70424
end
--select distinct p.sfitm,p.sflitm,p.sfdsc1,c.calendardate from productmaster p left join tblassa_calendar c on c.CalendarJulian=p.lastupdate