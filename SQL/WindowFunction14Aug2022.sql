Create database Window_func;
use Window_func;
# Windowing Function
create table if not exists Ineuron_Student(
student_id int,
student_batch varchar(60),
student_name varchar(40),
student_stream varchar(30),
student_marks int,
student_mail_id varchar(60)
);


insert into Ineuron_Student values(101,'fsda','Raghav','CSE',77,'rag@gmail.com'),
(101,'fsda','Sanket','CSE',77,'Sanket@gmail.com'),
(103,'fsda','Shyam','CSE',72,'Shyam@gmail.com'),
(102,'fsda','Ajay','CI',87,'Ajay@gmail.com'),
(104,'fsds','Snehal','CI',57,'Snehal@gmail.com'),
(105,'fsds','Anuj','ME',64,'Anuj@gmail.com'),
(106,'fsds','Mohit','ME',56,'Mohit@gmail.com'),
(107,'fsds','Prakhar','ME',97,'Prakhar@gmail.com'),
(108,'fsds','Neeraj','ME',57,'Neeraj@gmail.com'),
(109,'fsds','Bobby','EE',47,'Bobby@gmail.com'),
(110,'fsbc','Satish','EE',63,'Satish@gmail.com'),
(111,'fsbc','Saurabh','EE',83,'Saurabh@gmail.com'),
(112,'fsbc','Minjman','EE',67,'Minjman@gmail.com'),
(113,'fsbc','Pranav','ECE',74,'Pranav@gmail.com'),
(114,'fsde','Kushank','ECE',78,'Kushank@gmail.com'),
(115,'fsde','Sandeep','ECE',53,'Sandeep@gmail.com');


select * from ineuron_student;
# Aggregation Based Windowing Function
# ANalytics BAses WindowingFunctio

# Aggregation Based Windwoing Function
# Avg marks for Each Student Batch 
select student_batch,avg(Student_marks) from ineuron_student group by student_batch;
# Sum of marks for Each Student Batch 
select student_batch,sum(Student_marks) from ineuron_student group by student_batch;
# Min marks for Each Student Batch 
select student_batch,min(Student_marks) from ineuron_student group by student_batch;
# Max marks for Each Student Batch 
select student_batch,max(Student_marks) from ineuron_student group by student_batch;

# count marks for Each Student Batch 
select student_batch,count(*) from ineuron_student group by student_batch;

select * from ineuron_student;

# Analytical Based Window Operation
# Rank,Dense_rank,Row_number()
 # Rank based on Marks for Different student_batch
# Name of Student having maximum marks from FSDA BAtch
select student_name from ineuron_student where student_marks in (select max(student_marks) from ineuron_student where student_batch='fsda' );
# Name of Student having Second highest Marks from FSDS Batch
select student_marks from ineuron_student where student_batch ='FSDS' order by student_marks desc limit 1 offset 1;
select student_marks from ineuron_student where student_batch ='FSDS' order by student_marks desc limit 1,1 ;# Second highest record 

select student_name from ineuron_student where student_batch ='FSDS' order by student_marks desc limit 1,2 ;

 select * from ineuron_student;
 
 
 
 # limit 3,2 means it will skips 3 rowS AND  print next 2 rows
  # limit 4,3 means it will skips 4 rowS AND  print next 3 rows
  
 # If three People have reciede the third highest marks then this will fail so we use Windowing Function
 # Windowing Function ROW _NUMBER ,RANK,DENSE_RANK
 
 select * from ineuron_student ;
 

create table ineuron_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50));
 
 
 insert into ineuron_students values(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');
 insert into ineuron_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');

select * from ineuron_students;

# windowing Fuction

# row_number() over(condition )
select student_id,student_batch,student_stream,students_marks,
row_number() over (order by students_marks) as 'row number' from ineuron_students;

# Row number () over(Partition by student_batch order by students_marks) 
# partition by is same as group by 
 select student_id,student_batch,student_stream,students_marks
 ,row_number() over (partition by student_batch order by students_marks) as 'row number' 
 from ineuron_students;
 
 # From every Batch person who is Top Scorroer 
  select * from (select student_id,student_batch,student_stream,students_marks
 ,row_number() over (partition by student_batch order by students_marks desc) as 'row_number' 
 from ineuron_students) as test where `row_number`=1;
 # here there is a possibility tht two person are toppers so i will be not a ryt solution 
 select * from ineuron_students;
 # Rank function
  select student_id,student_batch,student_stream,students_marks
 ,rank() over (order by students_marks desc) as 'row_rank' 
 from ineuron_students;
 # row_number and rank()
 select student_id,student_batch,student_stream,students_marks,
 rank() over (order by students_marks desc) as 'row_rank',
 row_number() over (order by students_marks desc) as 'row_number'
 from ineuron_students;
 
 # Rank Batch wise
   select student_id,student_batch,student_stream,students_marks
 ,rank() over (partition by student_batch order by students_marks desc) as 'row_rank' 
 from ineuron_students;
 
 
 # Toppers from each batch
  select * from (select student_id,student_batch,student_stream,students_marks
 ,rank() over (partition by student_batch order by students_marks desc) as 'row_rank' 
 from ineuron_students) as test where row_rank=1;
 
 
 # Here problm we will not get the second highest from rank so we use dense_rank
 
 # Dense Rank 
 
 select student_id,student_batch,student_stream,students_marks,
 rank() over (order by students_marks desc) as 'row_rank',
 dense_rank() over  (order by students_marks desc) as 'row_dense_rank',
 row_number() over (order by students_marks desc) as 'row_number'
 from ineuron_students;
 
 
 # Dense_rank for Diffent Batches 
 select student_id,student_batch,student_stream,students_marks,
 dense_rank() over(partition by student_batch order by students_marks desc)
as 'dense_row_rank'  from ineuron_students;

# Second highest Rank in all the Batches
select * from ( select student_id,student_batch,student_stream,students_marks,
 dense_rank() over(partition by student_batch order by students_marks desc)
as 'dense_row_rank'  from ineuron_students) as test where dense_row_rank =2;