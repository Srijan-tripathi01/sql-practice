-- Window function

with CTE_example as 
(
	select gender, avg(salary) avg_sal,
	max(salary) as max_age,
	min(salary) as min_age,
	count(salary) as Count_age,
    sum(salary) as sum_sal
	from employee_demographics dem
	join employee_salary sal
	on dem.employee_id = sal.employee_id
	group by gender;
);
