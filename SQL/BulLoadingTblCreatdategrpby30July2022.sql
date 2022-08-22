# Bulk Upload 
#Table Creation 
/*

(base) C:\Windows\system32>cd C:\Users\dell\Downloads
(base) C:\Users\dell\Downloads>pip install csvkit
(base) C:\Users\dell\Downloads>csvsql --dialect mysql --snifflimit 100000 sales_data_final1.csv > output_sales.sql
*/
create database sales;
use sales;
CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

# Bulk Loading the data into the table Sales

set session sql_mode='';


load data infile  'G:/MYSQL/sales_data_final.csv'
into table sales
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


select * from sales;


select str_to_date(order_date,'%m/%d/%y') from sales;# Here str column into date data type

# Create New Column near orer_date column using Alter Table Command
Alter table sales add column order_date_new date after order_date;
select * from sales;
# Update Command to insert the data into  new column 
set SQL_SAFE_UPDATES = 0;
update sales 
set order_date_new = str_to_date(order_date,'%m/%d/%Y');

# add column ship_date_new near ship_date column
alter table sales
 add column ship_date_new date 
 after ship_date;
 
 # add data into new column from ship_date but into date data type not into String 
 update sales 
 set ship_date_new=str_to_date(ship_date,'%m/%d/%Y');
 
 select * from sales;
 
 # Ship_date is 2011-01-05
 select * from sales where ship_date_new='2011-01-05';
  # Ship_date is  greater than 2011-01-05
 select * from sales where ship_date_new>'2011-01-05';
   # Ship_date is  lesser than 2011-01-05
 select * from sales where ship_date_new<'2011-01-05';

# Record between fifth and fourth month 
select * from sales where ship_date_new between '2011-04-01' and '2011-05-30';

# Current Date and Time in system 
select now();
# Current Date oof the system 
select curdate();
# Current Time of the System 
select curtime();

# Sales Happend before  Last Week 
select * from sales where ship_date_new < date_sub(now(),interval 1 week);
# Sales happend after next week 
select * from sales where ship_date_new > date_sub(now(),interval 1 week);

# 3 days back Date 
select date_sub(now(),interval 3 day);
# 30 days Date back 
select date_sub(now(),interval 30 day);
# Current Year
select year(now());
# Day Name
select dayname(now());
select dayname('2023-01-31');

# Insert Current date when the data is inserted  
# First Create New Column where we will store the Date
alter table sales
add column flag date after order_id;
# Add current Date 
update sales set flag=now();

select * from sales;

# Override the Year Column 
# Change the Datatype of the Column 
alter table sales 
modify column year datetime;

# Add column Year month and Date from order_date_now
alter table sales
modify column year_new  int after order_date_new;
alter table sales
modify column month_new int after order_date_new;
alter table sales
modify column day_new int after order_date_new;

# Now add Data Year,Month ,Day From order_date_now
update sales set month_new=month(order_date_new);
update sales set day_new=day(order_date_new);
update sales set year_new=year(order_date_new);
select * from sales limit 5;

# Year wise Avg Sales
select year_new,avg(sales) from  sales group by year_new;

# Sum of sales Year Wise
select year_new,sum(sales) from  sales group by year_new;

# min Sales Every Year
select year_new,min(sales) from  sales group by year_new;

# max sales every Year
select year_new,max(sales) from  sales group by year_new;

# min ,avg,sum,max sales every Year
select year_new,min(sales),sum(sales),avg(sales),max(sales) from  sales group by year_new;


# Quanitty tht is sold every year
select year_new,sum(quantity) from sales group by year_new;

# cost to company
select shipping_cost+discount from sales;		

#discount Flag
select order_id,discount,if(discount>0,'Yes','No') as discount_flag from sales;

# All the items count  with Discount and not Discount 
alter table sales add column discount_flag varchar(20) after discount;
# insert Yes no inside the discount Flag 
update sales  set discount_flag = if(discount>0,'Yes','No');
select * from sales limit 5;
# no of Items Availaable for Discount and not Discount 
select discount_flag,count(*) from sales group by discount_flag;


