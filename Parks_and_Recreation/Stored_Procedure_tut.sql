-- Stored Procedure

create Procedure large_salary()
select * 
from employee_salary
where salary >= 50000;


call large_salary();


create Procedure large_salary2()
select * 
from employee_salary
where salary >= 50000;
select * 
from employee_salary
where salary >= 10000;

-- This procedure won't execute the second query as it don't know where the procedure ends

call large_salary2();

DELIMITER $$
create Procedure large_salary3()
Begin
	select * 
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 10000;
End $$ DELIMITER ;

CALL large_salary3();



DELIMITER $$
create Procedure large_salary4(employee_id_param int)
Begin
	select salary
    from employee_salary
    where employee_id = employee_id_param; 
    
End $$ DELIMITER ;

call large_salary4(1);