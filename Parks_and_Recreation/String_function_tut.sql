-- String Function 

Select length('Steven');

select first_name, length(first_name)
from employee_demographics
order by 2;

-- Upper and Lower

Select Upper("Skyfall");
Select lower("CATCALL");

-- Trim , LTrim, RTrim
-- Removes leadind and trailing spaces

Select trim('              APRIL            ');
Select Ltrim('             APRIL            ');
Select Rtrim('             APRIL            ');

-- Left and Right substring

select first_name, 
left(first_name,4) ,
right(first_name,4	),	
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as Birth_Month
from employee_demographics;

-- Replace


select first_name, replace(first_name,'a','*')
from employee_demographics;

-- Locate

select locate('x','Alexander');

select first_name, Locate('An',first_name)
from employee_demographics;

-- Concat

select first_name, last_name,
concat(first_name,' ', last_name) As full_name
from employee_demographics;