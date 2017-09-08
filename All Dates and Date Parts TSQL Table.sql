
WITH Dates as
(
	SELECT
		CAST('19850101' as date) as [date]
		, DATENAME(dw,'19850101') as day_of_week
		, DATEPART(DAY, '19850101') as [day]
		, DATEPART(MONTH, '19850101') as [month]
		, DATEPART(YEAR, '19850101') as [year]
		, datediff(week, dateadd(week, datediff(week, 0, dateadd(month, datediff(month, 0, '19850101'), 0)), 0), cast('19850101'as datetime)) + 1 as [week_in_month]
		, DATEPART(wk, '19850101') as [week_in_year]
		, DATEPART(QUARTER, '19850101') as [quarter]
	UNION ALL
	SELECT 
		DATEADD(day, 1, dates.[date]) as [date]
		, DATENAME(dw,DATEADD(day, 1, dates.[date])) as day_of_week
		, DATEPART(DAY, DATEADD(day, 1, dates.[date])) as [day]
		, DATEPART(MONTH, DATEADD(day, 1, dates.[date])) as [month]
		, DATEPART(YEAR, DATEADD(day, 1, dates.[date])) as [year]
		, datediff(week, dateadd(week, datediff(week, 0, dateadd(Month, datediff(month, 0, DATEADD(day, 1, dates.[date])), 0)), 0), DATEADD(day, 1, cast(dates.[date] as datetime))) + 1 as [week_in_month]		
		, DATEPART(wk, DATEADD(day, 1, dates.[date])) as [week_in_year]
		, DATEPART(QUARTER, DATEADD(day, 1, dates.[date])) as [quarter]
	from Dates
	where [date] < '20260101'
)

select *
--into utl.datesAndDateparts
from dates
OPTION (MAXRECURSION 0)