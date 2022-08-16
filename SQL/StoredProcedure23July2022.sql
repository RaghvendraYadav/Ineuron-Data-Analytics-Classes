use ineuron_fsda;
select * from bank_details;

Stored Procedure 

Delimiter &&
create procedure  select_records()
BEGIN
   select * from bank_details;
END &&

call select_records();

Delimiter &&
create procedure bal_max()
Begin 
	select * from bank_details where balance in (select max(balance) from bank_details);
end &&
call bal_max();

# Parametrized Stored Procedure

DELIMITER &&
create procedure Avg_bal_Jobrole1(IN var varchar(30))
Begin
	select avg(balance) from bank_details where job=var;
end &&
call Avg_bal_Jobrole1('admin.');
call Avg_bal_Jobrole1('unknown');
call Avg_bal_Jobrole1('retired');


#Multiple Paratematrized Stored Procedure
delimiter &&
create procedure sel_edu_job(in edu varchar(30),in job1 varchar(30)) 
Begin
	select * from bank_details where education=edu and job=job1;
end &&

call sel_edu_job('secondary','admin.');
call sel_edu_job('primary','retired');








