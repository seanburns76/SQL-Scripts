
if OBJECT_ID('tempdb..#dt') is not null
	drop table #dt

declare @start int = '20170101'
declare @end int = @start + 30    

select 
	@start as TransDate
	,1 as Value
into #dt

;with DateTable(day) as 
	(select @start as day
		union all 
	select day + 1
		from DateTable
			where day < @end
	)
select DateTable.day
	from DateTable
		left join #dt on #dt.TransDate = DateTable.day