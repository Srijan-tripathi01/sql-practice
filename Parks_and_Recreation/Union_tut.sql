-- Unions

-- Joins rows from different tables

Select first_name,last_name
from employee_demographics
Union
select first_name, last_name
from employee_salary;

Select first_name,last_name
from employee_demographics
Union distinct
select first_name, last_name
from employee_salary;

Select first_name,last_name
from employee_demographics
Union all
select first_name, last_name
from employee_salary;


Select first_name,last_name, 'Old Man' as Label
from employee_demographics
where age > 40 and gender = 'male'
Union 
select first_name, last_name, 'Old Lady' as Label
from employee_demographics
where age > 40 and gender = 'female'
union
Select first_name,last_name, "Highly Paid Employee" as Label
from employee_salary
where salary > 70000 
order by first_name;

