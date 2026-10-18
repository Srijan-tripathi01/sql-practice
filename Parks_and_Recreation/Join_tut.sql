-- JOINS

-- Joins Columns from different tables

select * from employee_demographics;
select * from employee_salary;


-- Inner Join

select *
from employee_demographics demo
inner join employee_salary sal
on demo.employee_id = sal.employee_id;

-- Outer join

select *
from employee_demographics demo
Right join employee_salary sal
on demo.employee_id = sal.employee_id;

select *
from employee_demographics demo
Left join employee_salary sal
on demo.employee_id = sal.employee_id;

-- Self join

select *
from employee_demographics demo
 join employee_salary sal
on demo.employee_id = sal.employee_id;


select *
from employee_demographics demo
 join employee_salary sal
on demo.employee_id+1 = sal.employee_id;

-- Joining multiple tables

select *
from employee_demographics demo
 join employee_salary sal
on demo.employee_id = sal.employee_id
join parks_departments pd
on sal.dept_id = pd.department_id;