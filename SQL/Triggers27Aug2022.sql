# 6  types of Triggers
# Insert Trigger Before and After  Insert Trigger

# Delete Trigger Before and After  Insert Trigger

# Update Trigger Before and After  Insert Trigger
Create database Ineuron;
use Ineuron;

Create table Course1(
course_id int,
course_name varchar(50),
course_mentor varchar(50),
course_price  int,
course_discount int,
create_date date
);

Create table course_update(
course_mentor_update varchar(50),
course_price_update int,
course_discount_update int
);


 
# this Trigger will add value to date automatically before we try to insert the data in Course table 
delimiter //
create trigger course_before_insert1
before insert
on Course1 for each row
begin
	set new.create_date = sysdate();
end //



select * from course1;

insert into course1(course_id,course_name,course_mentor,course_price,course_discount) values
(101,'FSDA','Sudhanshu',17700,10);
select * from course1;# Trigger wil be trigeer before insert and the date will be automatically inserted

Create table Course2(
course_id int,
course_name varchar(50),
course_mentor varchar(50),
course_price  int,
course_discount int,
create_date date,
user_info varchar(60)
);

delimiter //
create trigger course_before_insert_user
before insert
on Course2 for each row
begin
	declare user_val varchar(60);
	set new.create_date = sysdate();
    select user() into user_val;
    set new.user_info =user_val;
end //
insert into course2(course_id,course_name,course_mentor,course_price,course_discount) values
(101,'FSDA','Sudhanshu',17700,10);
select * from course2;
# it will add automatically values using trigger inside the Create_date and user_info Column 
insert into course2(course_id,course_name,course_mentor,course_price,course_discount) values
(102,'FSDS','Krish',17700,20);
select * from course2;

# Trigger with Another Table Inserting tabl in another table while insert into our table 
drop trigger course_before_insert_user1;
delimiter //
create trigger course_before_insert_user1
before insert
on Course2 for each row
begin
	declare user_val varchar(60);
	set new.create_date = sysdate();
    select user() into user_val;
    set new.user_info =user_val;
    insert into reference_table values(sysdate(),user());
end //

create table reference_table(
record_insert_date date,
record_insert_user varchar(50)
);

select * from reference_table;
# By before insert Trigger if we will iinsert anything in course2 it will also insert the 
# values in reference table Also;
insert into course2(course_id,course_name,course_mentor,course_price,course_discount) values
(106,'FSBC','Telusko',17000,5);
select * from course2;
select * from reference_table;

# before insert in Test1 it should insert in Test2 and Test3 in every insertiono Create Trigger
create table test1
(
c1 varchar(30),
c2 date,
c3 int
)

create table test2
(
c1 varchar(30),
c2 date,
c3 int
)
create table test3
(
c1 varchar(30),
c2 date,
c3 int
)

delimiter $$
create trigger to_update_2_table
before insert on test1 for each row
begin 
   insert into test2 values("xyz",sysdate(),23343);
   insert into test3 values("xyz",sysdate(),23343);
end $$

select * from test1;
select * from test2;
select * from test3;
insert into test1 values ('Ragh',sysdate(),232);

# After Insert Trigger

Delimiter //
create trigger after_insert
after insert on test1 for each row
begin
     update test2 set c1='ABC' where c1='xyz';
     delete  from test3  where c1='xyz';
end;//

insert into test1 values ('Chotu',sysdate(),231);

set SQL_SAFE_UPDATES = 0;



# After Delete Trigger
Delimiter //
create trigger after_delete
after delete on test1 for each row
begin
     update test2 set c1='uvw' where c1='ABC';
     insert into  test3 values ('after_Delete',sysdate(),32134);
end;//

select * from test1;
delete from test1 where c1='Ragh';

# before Delete Trigger
Delimiter //
create trigger before_delete
before delete on test1 for each row
begin
     update test2 set c1='abc' where c1='uvw';
     insert into  test3 values ('Before_Delete',sysdate(),32134);
end;//
select * from test1;
delete from test1 where c1='Chotu';

select * from test2;
select * from test3;


create table test13(
c1 varchar(50),
c2 date,
c3 int )

delimiter //
create trigger to_delete_others_before_observation3
before delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //



insert into test11 values("sudh" , sysdate(), 435456);
select * from test11

delete from test11 where c1 = 'sudh'

select * from test12


delimiter //
create trigger to_delete_others_before_observation4
after delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

delete from test11 where c1 = 'sudhanshu'


delimiter //
create trigger to_upate_others
after update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

select * from test11;

insert into test11 values("sudh",sysdate(),234354)

update test11 set c1 = "after update" where c1 = "after delete"


select * from  test12;

delimiter //
create trigger to_upate_others_before
before update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(new.c1, new.c2,new.c3);
end; //

update test11 set c1 = "insert new" where c1 = "sudh"

1.create a table col = name , mail_id,phone_number , address , users_sys, time_sys,salary,incentive,final_salary
2.try to time all the time that uses name should start with s for each and every insert op




use ineuron_partition

SELECT * FROM ineuron_partition.ineuron_course;

select * ,
case 
	when course_name = 'fsda' then sysdate()
    when course_name = 'fsds' then system_user()
    else "this is not your batch"
end as statement 
from ineuron_course

select * ,
case 
	when length(course_name) = 4  then "len 4"
    when length(course_name)= 2  then "len 2"
    else "other lenght"
end as statement 
from ineuron_course


update ineuron_course set course_name = case 
when course_name = 'RL' then 'reinforcement learing'
when course_name = 'dl' then 'deep learning'
end 

select * from ineuron_course





