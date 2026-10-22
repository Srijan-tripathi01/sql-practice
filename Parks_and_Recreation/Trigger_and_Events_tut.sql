-- Trigger and Events
  
DELIMITER $$
CREATE TRIGGER emoloyee_insert
	After insert on employee_salary
    for each row 
    Begin
		insert into employee_demographics(employee_id, first_name, last_name)
        Values (New.employee_id, New.first_name, New.last_name);
End $$
DELIMITER ;


Insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
Values(13, 'jean-Ralphino', 'Saperstein', 'Exntertainment 720 CEO', 100000, NULL);

Select * from employee_salary;

Select * from employee_demographics;


-- Events

Select * from employee_demographics;

DELIMITER $$
Create Event delete_retirees
on schedule every 30 Second
do 
	begin 
		Delete 
        from employee_demographics
        where age >= 60;
End $$
DELIMITER ; 
        
Show variables like 'event%';