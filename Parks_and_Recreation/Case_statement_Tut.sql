-- Case Statement

Select first_name,last_name,age, 
Case 
	When age <= 30 Then 'Young'
    When age between 31 and 50 then 'Old'
    When age > 51 then 'Super Old'
    End As Age_Bracket    
from employee_demographics;



Select first_name, last_name, salary,
Case
	When salary<= 25000 then "Middle Class"
    When salary between 25000 and 70000 then "Rich"
    when salary > 70000 then 'Super Rich'
    End as Salary_Bracket
from employee_salary;

-- Pay Incease and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

Select first_name, last_name, salary,
Case
	When salary <=50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
    end as New_Salary,
Case 
	when dept_id = 6 then salary * 1.1
    end as Bonus
from employee_salary;
select * from employee_salary;
select * from parks_departments; 