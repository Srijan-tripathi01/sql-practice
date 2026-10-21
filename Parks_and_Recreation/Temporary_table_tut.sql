-- Temporary table
	
select * 
from employee_salary;

create temporary table salary_over_50K
select * 
from employee_salary
where salary > 50000;

select * 
from salary_over_50k