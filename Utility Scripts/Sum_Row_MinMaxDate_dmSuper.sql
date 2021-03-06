

select 
sum(w.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(w.sfdate) as mindate
,max(w.sfdate) as maxdate


from  Backlog w

select 
sum(x.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(x.sfdate) as mindate
,max(x.sfdate) as maxdate


from  invoiced x

select 
sum(y.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(y.sfdate) as mindate
,max(y.sfdate) as maxdate


from  booking y


select 
sum(z.sfaexp) as sumtotal
,COUNT(*) as records
,MIN(z.sfdate) as mindate
,max(z.sfdate) as maxdate


from  other z
