-- WHERE VS HAVING
-- Where filters each rows before data is grouped 
-- Having used on aggregate groups after the group by clause;

select gender , Avg(age)
from employee_demographics
where Avg(age)  > 40
group by gender;
-- throws up error - invalid use of group function 

-- Right way of doing it 

select gender , Avg(age)
from employee_demographics
group by gender
Having Avg(age) > 40;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager'
group by occupation
having avg(salary) > 75000;