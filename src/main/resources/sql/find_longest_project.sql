select p.id, EXTRACT(month FROM (age(p.finish_date, p.start_date))) as month_count
from project p
group by p.id
having EXTRACT(month FROM (age(p.finish_date, p.start_date))) = (
	select EXTRACT(month FROM (age(p2.finish_date, p2.start_date))) as month_count2
	from project p2
	order by month_count2 desc
	limit 1
);