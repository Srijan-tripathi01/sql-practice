-- GROUP BY 

SELECT gender, avg(age) , max(age), min(age), count(age)
FROM employee_demographics
group by gender;

-- ORDER BY
-- SORTS RESULTS ON ASCENDING OR DESENDING ORDER
-- by defaul - ASC


SELECT * 
FROM employee_demographics
order by first_name;

SELECT * 
FROM employee_demographics
order by first_name desc;

SELECT * 
FROM employee_demographics
order by gender,age;

-- first the result are sorted on the basis of gender then on age
 
 SELECT * 
FROM employee_demographics
order by gender,age DESC;  