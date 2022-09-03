Create database Operation;
use operation;
Create table if not exists course(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)
);

create table if not exists Student(
student_id int,
student_name varchar(30),
student_mobile int,
student_course_enroll varchar(30),
student_course_id int
);

insert into course values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');


insert into student values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103);


select * from course;


# who have enrolled for the Courses 
# join Operation 
# In inner Join on common data we will get
select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
inner join student as s on c.course_id=s.student_course_id;
#OR BOth work as Inner join
select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
 join student as s on c.course_id=s.student_course_id;
 
 # Left Join 
 
 select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
left  join student as s on c.course_id=s.student_course_id;

 # Question All the courses not enrolled By any student
select c.course_id,c.course_name,c.course_desc from course as c
left  join student as s on c.course_id=s.student_course_id where s.student_id is null;

# Right Join 
select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
right  join student as s on c.course_id=s.student_course_id;


# Fetch Student wo has any of the Course 
select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
right  join student as s on c.course_id=s.student_course_id where c.course_id is null;

#Cross Join

# Cross Join gives all the possible combinations 
select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
cross  join student as s ;

# Indexing 
# it is used for optimisation in big tables
show index from course;

create table if not exists course1 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id)
);

show index from course1;

insert into course1 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course1;
# using Indexing optimisation of Query use to happen and ti will seach FASt instead of searching all the data 
# Using Binary Tree Index Tyoe it will dvide the data into Half if number greater than 5 then right Side and THen again divide 
# it bcomes Heavy using insert delete and update bcoz it need to create the Binary Tree Again so
# indexing is not successful with insert update and Delete 



#unique indexes
create table if not exists course5 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_id)
);
show index from course5;
# unique wil guve the distinct records


#unique  with multipleindexes
create table if not exists course6 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_id,course_name)
);

show index from course6;

select * from  course;

select  * from student;
# Combine both the below Table using union
select student_id,student_name from student;
select course_id,course_name from course;

# union add rows to the table whereas join add columns to the table see example below 

select student_id,student_name from student 
union
select course_id,course_name from course;


# for example if the no of  Columns are different then union will fail see example below 
# in union no of columns should be same in both the Tables 
select student_id,student_name from student 
union
select course_id,course_name,course_desc from course;


select course_id,course_name,course_desc from course
union
select student_id,student_name from student;

# if the data type of the columns are different doing union then it will do union with no error
# union remove all the duplicate rows
select course_desc ,course_name from course
union
select student_id,student_name from student;

# union all doesnot remove the duplicate rows
# it will give all the rows from both the tables

select course_desc ,course_name from course
union all
select student_id,student_name from student;

# CTE - Common Table Expression 
with sample_students as
(select * from course where course_id in (101,102,106))
# out of this dataset if we need to filter out something thne we use CTE 
# we will try to treat the course select aout query as a data set andthen we will filter it so it is called CTE
select * from sample_students where course_tag='java';


# Another Example of CTE
with CRoss_Join_Students_course as
(select c.course_id,s.student_course_id,c.course_name,c.course_desc,s.student_id,s.student_name from course as c
cross  join student as s ) 
select * from Cross_Join_Students_course where course_id=student_course_id;

