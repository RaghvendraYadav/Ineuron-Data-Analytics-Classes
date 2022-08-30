create database key_prim;
use key_prim;

# Create Primary Key 
create table ineuron(
course_id int not null,
course_name varchar(60),
course_status varchar(40),
no_of_enrol int,
primary key(course_id)
);

insert into ineuron values(01,'FSDA','Active',100);
insert into ineuron values(01,'FSDS','Not - Active',100);#Error - Duplicate Entry for Primary Key 
insert into ineuron values(02,'FSDS','Not Active',100);# No Error



# Foregin Key Creation 
create table student_ineuron(
student_id int,
course_name varchar(60),
student_mail varchar(80),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references ineuron(course_id));

insert into student_ineuron values(101,"FSDA","Test@gmail.com","Active",05);# it will give error A foregin key constraint Fails Cannot add or update a child row
insert into student_ineuron values(101,"FSDA","Test@gmail.com","Active",01);
insert into student_ineuron values(101,"FSDA","Test@gmail.com","Active",01);
insert into student_ineuron values(101,"FSDA","Test@gmail.com","Active",01);
insert into student_ineuron values(101,"FSDA","Test@gmail.com","Active",01);

select * from student_ineuron;

create table Payment(course_name varchar(60),course_id int,course_live_status varchar(60),
course_launch_date varchar(60),foreign key(course_id) references ineuron(course_id)
);

insert into Payment values ('FSDA',01,'Not Active','7th August');
insert into Payment values ('FSDA',01,'Not Active','7th August');
insert into Payment values ('FSDA',01,'Not Active','7th August');



Create table Class(
course_id int,
class_name varchar(60),
class_topic varchar(60),
class_duration int,
primary key(course_id),
foreign key (course_id) references ineuron(course_id)
);

aLTER TABLE ineuron add constraint pk primary key(course_id,course_name);# errir Multiple Primary Key Bcoz tht 
# Table already has primary Key so it is gibing error
#v Error ----alter table ineuron drop primary key;
# Drop table ineuron
drop table Class;

create table Test(
id int not null,
name varchar(60),
email_id varchar(80),
mobile_no varchar(10),
address varchar(50)
);

# Create Primary Kkey 

Alter table Test add constraint primary key(id);
# Drop Primary Key 
alter table Test drop primary key;
# Multiple Attrivute Primary Key
alter table Test add constraint primary key(id,email_id);



Create table Parent (
id int not null,
primary key (id)
);
create table child (
id int,
parent_id int,
foreign key(parent_id) references Parent(id)
);
insert into Parent values(2);
insert into Child values(1,2);
select * from Parent;
select * from child;
insert into Parent values (1);
delete from Parent where id =2;# Error Foreign key Violated 
# Still we want to delete then 
drop table child;
# on delete Cascade 
create table child (
id int,
parent_id int,
foreign key(parent_id) references Parent(id) on delete cascade # helps to delete even from Parent Table 

);
insert into child values (1,2),(2,2),(3,2);
select * from child;

select * from Parent;
drop table Parent;

delete from Parent where id =1;

update Parent set id=3 where id=2;# Here Error 
drop table Child;
create table child (
id int,
parent_id int,
foreign key(parent_id) references Parent(id) on update cascade # helps to delete even from Parent Table 
);
insert into child values (1,2),(2,2),(3,2);
update Parent set id=3 where id=2;# Now no Error 
# Here Child Table we autoamtvc get updated
select * from child;

# delete and update table Creation with Cascade 
create table child1 (
id int,
parent_id int,
foreign key(parent_id) references Parent(id) on update cascade on delete cascade # helps to delete even from Parent Table 
);


