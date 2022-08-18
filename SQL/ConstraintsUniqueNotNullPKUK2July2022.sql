use dress_data;

/*
Constraints
auto_increment will automatically increASE THE TESTid
work on if the key is primary key (not null,unique value)
*/
# Here we need to give the column name while using the auto increment with primary key
create table if not exists Test(
test_id int auto_increment,
test_name varchar(30) ,
test_mailId varchar(30),
test_address varchar(30),
primary key(test_id)
);

select * from Test;
# Column name is necesaary when we use auto_increment and it will automatically 
insert into Test (test_name,test_mailId,test_address) values('Raghvendra','rag@gmaail.com','Endoures'),
('Sudh','S@gmail.com','Bangalore'),
('Hitest','H@inoeuron.ai','AD'),
('Krish','K@ineuron.ai','Jaipur');

# Check Constraint

create table if not exists Test3(
test_id int,
test_name varchar(30) ,
test_mailId varchar(30),
test_address varchar(30),
test_salary int check(test_salary>10000)
);

# insertion of Data in Table with Check Constraint 

# here if we will insert test_salary which has check value should be >10000 less than 10K it will give the error Check Cnstraint is 
# is violated 
insert into Test3  values(1,'Raghvendra','rag@gmaail.com','Endoures',21000),
(2,'Sudh','S@gmail.com','Bangalore',200000),
(3,'Hitesh','H@inoeuron.ai','AD',111000),
(4,'Krish','K@ineuron.ai','Jaipur',1203);

# It will get successful only when test_salary for each row is greater than 10k

insert into Test3  values(1,'Raghvendra','rag@gmaail.com','Endoures',21000),
(2,'Sudh','S@gmail.com','Bangalore',200000),
(3,'Hitesh','H@inoeuron.ai','AD',111000),
(4,'Krish','K@ineuron.ai','Jaipur',12031);

Select * from Test3;

# Check Constraint on multiple columns

create table if not exists Test4(
test_id int,
test_name varchar(30) ,
test_mailId varchar(30),
test_address varchar(30) check (test_address='Bangalore'),
test_salary int check(test_salary>10000)
);

# Usinng two check Address should be  Bangalore and salary >10000 Otherwise it will give error
insert into Test4  values(1,'Raghvendra','rag@gmaail.com','Endoures',21000),
(2,'Sudh','S@gmail.com','Bangalore',200000),
(3,'Hitesh','H@inoeuron.ai','Bangalore',111000),
(4,'Krish','K@ineuron.ai','Jaipur',12031);

#Without Error
insert into Test4  values(1,'Raghvendra','rag@gmaail.com','Bangalore',21000),
(2,'Sudh','S@gmail.com','Bangalore',200000),
(3,'Hitesh','H@inoeuron.ai','Bangalore',111000),
(4,'Krish','K@ineuron.ai','Bangalore',12031);

select * From Test4;
# Alter 
 alter table Test4 add check (test_id >0);
 # Error bcoz ID should be Positive
insert into Test4  values(-1,'Raghvendra','rag@gmaail.com','Bangalore',21000);


# Constraint not null
create table if not exists Test5(
test_id int not null,
test_name varchar(30) ,
test_mailId varchar(30),
test_address varchar(30) check (test_address='Bangalore'),
test_salary int check(test_salary>10000)
);

select * from Test5;
# here we will gt error Test_id doesnot have  a default value as it will not allow null valye to enter
insert into Test5 (test_name,test_mailId,test_address,test_salary)   values('Raghvendra','rag@gmaail.com','Bangalore',21000);


# if inserted Test_Id
insert into Test5 (test_id,test_name,test_mailId,test_address,test_salary)   values(1,'Raghvendra','rag@gmaail.com','Bangalore',21000);

#  Default Constraint 
create table if not exists Test6(
test_id int not null default 0,
test_name varchar(30) ,
test_mailId varchar(30),
test_address varchar(30) check (test_address='Bangalore'),
test_salary int check(test_salary>10000)
);
# here even if we onot give any value to testId the n also it will take defalut '0'value and give no error while execution 
insert into Test6 (test_name,test_mailId,test_address,test_salary)   values('Raghvendra','rag@gmaail.com','Bangalore',21000);
select * from Test6;

# Unique Constraint 

create table if not exists Test7(
test_id int not null default 0,
test_name varchar(30) ,
test_mailId varchar(30) unique,
test_address varchar(30) check (test_address='Bangalore'),
test_salary int check(test_salary>10000)
);

insert into Test7 (test_name,test_mailId,test_address,test_salary)   values('Raghvendra','rag@gmaail.com','Bangalore',21000);# it will execute
insert into Test7 (test_name,test_mailId,test_address,test_salary)   values('Raghvendra','rag@gmaail.com','Bangalore',21000);# it will not execute bcoz emailId is unique and cannit be duplicate

# EmailID is alwys unique shoudl cannot be Duplicate and if we enter than error Duplicate entry or we cannot enter means unique can have null value 


# All in one Table Summazrized tabel

create table if not exists Test8(
test_id int not null auto_increment,
test_name varchar(30)not null default 'unknown',
test_mailId varchar(30) unique,
test_address varchar(30) check (test_address='Bangalore') not null,
test_salary int check(test_salary>10000),
primary key(test_id)
);
select * from Test8;

insert into Test8 (test_id,test_name,test_mailId,test_address,test_salary)   values(11,'Raghvendra','rag2123@gmaail.com','Bangalore',21000);
insert into Test8 (test_name,test_mailId,test_address,test_salary)   values('Raghvendra','rag1211@gmaail.com','Bangalore',21000);









