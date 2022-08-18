create database Dress_Data;
use Dress_Data;
create table if not exists Dress(`Dress_ID`varchar(30),
`Style` varchar(30),
`Price` varchar(30),
`Rating` varchar(30),
`Size` varchar(30),
`Season` varchar(30),
`NeckLine` varchar(30),
`SleeveLength` varchar(30),
`waiseline` varchar(30),
`Material` varchar(30),
`FabricType` varchar(30),
`Decoration` varchar(30),
`Pattern Type` varchar(30),
`Recommendation` varchar(30));

select * from Dress;
# Loading the Bulk Data
/* 
LOad data infile 'path having forward slash and fillr name with extension'
into table Table_name
Fields terminated by                                   #our data set is seperated by Comma Fields means column data 
ENCLOSED by '"'                                      # if data is enclosed by " " if not then also it will not give the errror 
lines terminated by '\n'                              # new records on next line
ignore 1 rows;													# One line we have header having column names so skip thr first line
*/
Load data infile 'G:/AttributeDataSet.csv'
into table Dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

Select * from Dress;

/*
MYSQL is running at the secure_file_private error  
here program Data may be in hidden items
Go to the location C:\ProgramData\MySQL\New folder 
open my 
open it in notepad ++
then in tht secure-file_priv='please remove everything inside me'
it is done Now it will give no error 
then restart the system 
or go to services and restart the mysql 
*/



 