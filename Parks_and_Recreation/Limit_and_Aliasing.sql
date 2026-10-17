-- LIMIT AND ALIASING

-- LIMIT
select * 
from employee_demographics
limit 3;

select * 
from employee_demographics
limit 2,1; 
-- selects the next 1 after the end of limit index

-- Aliasing

Select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age >40;

-- Alisasing can also be used without the AS keyword

Select gender, avg(age) avg_age
from employee_demographics
group by gender
having avg_age >40