use sales;

# Genera Data : Loop 
create table  loop_table(val int);

Delimiter $$
create procedure insert_data1()
Begin
set @var = 10; # Global Variable 
generate_data : loop
insert into loop_table values(@var);
set @var=@var+1;
if  @var=100 then
   leave generate_data;
end if;
end loop generate_data;
end $$

call insert_data1();
select * from loop_table;

#Create a loop for a table to insert a record into a table for two Column in forst column one to 100 and in secpnd square of the data 
create table TaskLoopSql(var1 int,var2 int);

delimiter $$
create procedure TaskSql()
	begin
		declare  val1 int default 1;
		declare  val2 int default 1;
		generate_loop :loop
		insert  into TaskLoopSql values(val1,val2);
		set val1=val1+1;
		set val2=val1*val1;
		if val1 =100 then
			leave generate_loop;
		end if;
	end loop generate_loop;
end $$


call TaskSql();
select * from TaskLoopSql;
# Task Completed 


DELIMITER $$  
CREATE PROCEDURE ABC()

   BEGIN
      DECLARE a INT Default 1  ;
      declare b int default 1;
      simple_loop: LOOP         
         insert into table1 values(a,b);
         SET a=a+1;
         set b=a*a;
         IF a=51 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
END $$

create table table1(a1 int,b1 int);
call ABC();
select * from table1;

# Create Function to find out Date difference in no of days

select * from sales;

# Create Procedure to find the 5 highest Profit
select profit from sales order by profit desc limit 1 offset 5;