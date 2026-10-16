SELECT * FROM parks_and_recreation.employee_demographics;
SELECT * FROM parks_and_recreation.employee_salary
;
select * from parks_and_recreation.parks_departments;
select * from employee_demographics; 

--PEMDAS- sequesnce of executing mathematical computation - P-parantheses, E-Exponents, M- Multiplication, D- Divison, A- Addition, S- Subtraction.
 
select first_name, age, (age+10)%5 *10
from employee_demographics;

select distinct age
from employee_demographics;
-- Distinct keyword only filter the unique entries in table