









update invoiced   --table being updated

set sflitm = t.sflitm,
    sfdsc1 = t.sfdsc1 
       --column(s) being updated from the columns in other table that are updating

from Booking d	 --table being updated

inner join productmaster t on t.sfitm = d.sfitm  --join the tables

where d.sfitm = t.sfitm    --constraints


