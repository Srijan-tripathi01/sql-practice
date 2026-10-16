-- WHERE CLAUSE

SELECT *
FROM employee_salary
WHERE
first_name = "Ron";

SELECT *
FROM employee_salary
WHERE
salary < 60000 ;

SELECT *
FROM employee_demographics
WHERE
gender != "Female";

SELECT *
FROM employee_demographics
WHERE
birth_date > '1985-01-01';


-- AND OR NOT -- LOGICAL OPERATORS

SELECT *
FROM employee_demographics
WHERE
birth_date > '1985-01-01'
AND gender = 'male';

SELECT *
FROM employee_demographics
WHERE
birth_date > '1985-01-01'
OR gender = 'male';

SELECT *
FROM employee_demographics
WHERE
birth_date > '1985-01-01'
OR NOT gender = 'male';

SELECT *
FROM employee_demographics
WHERE
(first_name = 'TOM' AND AGE = 36) or age > 55;

-- LIKE STATEMENT
-- % and _
-- % - after and before the specific character 
-- _(underscore) -- specify number of character require

SELECT *
FROM employee_demographics
WHERE
first_name like 'Jer%'
;

SELECT *
FROM employee_demographics
WHERE
first_name like '%ry'
;

SELECT *
FROM employee_demographics
WHERE
first_name like '%o%'
;
SELECT *
FROM employee_demographics
WHERE
first_name like 'a___'
;

SELECT *
FROM employee_demographics
WHERE
first_name like 'a___%'
;

SELECT *
FROM employee_demographics
WHERE
birth_date like '1989%'
;