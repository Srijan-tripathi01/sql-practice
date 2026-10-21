-- Subqueries ()

select * 
from employee_demographics
where employee_id in
		(Select employee_id
        from employee_salary
        where dept_id=1)
;

select first_name, salary, 
(Select Avg(salary) 
from employee_salary)
from employee_salary
Group by first_name, salary;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;


select * 
from (select gender, avg(age), max(age), min(age), count(age)
	from employee_demographics
	group by gender) as Agg_table;
    
    
    
select  avg(`Max(age)`)
from (select gender, avg(age), max(age), min(age), count(age)
	from employee_demographics
	group by gender) as Agg_tabler;
    
    
    
select  avg(max_age)
from (select gender, avg(age) as avg_age,
 max(age) as max_age,
 min(age) as min_age,
 count(age) as Count_age
	from employee_demographics
	group by gender) as Agg_tabler;