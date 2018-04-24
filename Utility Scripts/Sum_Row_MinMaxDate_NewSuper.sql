

declare @st date = '2014-12-31'
declare @end date = '2015-03-30'




select 
sum(w.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(w.sfdate) as mindate
,max(w.sfdate) as maxdate




from  Backlog w

where w.sfdate > @st and w.sfdate <= @end

----------------------------------------------------------------------

select 
sum(x.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(x.sfdate) as mindate
,max(x.sfdate) as maxdate




from  invoiced x

where x.sfdate > @st and x.sfdate <= @end

-------------------------------------------------------------------------

select 
sum(y.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(y.sfdate) as mindate
,max(y.sfdate) as maxdate


from  booking y

where y.sfdate > @st and y.sfdate <= @end



----------------------------------------------------------------------


select 
sum(z.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(z.sfdate) as mindate
,max(z.sfdate) as maxdate


from  other z

where z.sfdate > @st and z.sfdate <= @end