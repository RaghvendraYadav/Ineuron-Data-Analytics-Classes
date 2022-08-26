use sales;
# if data is more than 1 mb then execute the below Command in MYSQL 
set global max_allowed_packet=209321212;
create table if not exists order_details (
InvoiceNo varchar(50),StockCode varchar(30),`Description` varchar(100),
Quantity varchar(50),InvoiceDate varchar(100),UnitPrice decimal(10,2),
CustomerID varchar(50),Country varchar(80)
);

load data infile 'G:/MYSQL/orders.csv'
into table order_details
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
select * from sales;

# If Elif Statement
Delimiter $$ 
create function add_to_col1(a INT)
returns int
deterministic 
begin
	Declare b int;
	set b= a + 10;
	return b;
end $$

select max(sales) from sales;
select add_to_col1(15);

select * from sales;
# add 10 to the qunatity column 
select quantity,add_to_col1(quantity) from sales;
# New Function with two Parameters
delimiter $$ 
create function final_profits(profit int,discount int)
returns int
deterministic
Begin 
declare final_profit1 int;
set final_profit1=profit-discount;
return final_profit1;
end $$

# Calling the Function inside the Query 
select profit,discount,final_profits(profit,discount) from sales;

# one more func three Paramters
delimiter $$
create function finalProfits_real(profit decimal(20,6),discount decimal(20,6),sales decimal(20,6))
returns int
deterministic
Begin 
 declare final_profit int;
 set final_profit=profit-sales*discount;
 return final_profit;
end $$

select round(profit),discount,sales,finalProfits_real(profit,discount,sales) from sales;


# function Takes Integer and convert to String
delimiter $$ 
create function int_to_str(a int)
returns varchar(50)
deterministic
begin
	declare b varchar(50);
    set b=a;
    return b;
end $$

select quantity,int_to_str(quantity) from sales;

select * from sales;
 

select max(sales),min(sales) from sales;
/*
1-100   Super Affordable
100-300  Affordable
300-600    Moderate Price
600 + Expensive*/

delimiter $$ 
create function Order_Type(sales int)
returns varchar(30)
deterministic
begin
    declare flag_for_sales varchar(30);
	if sales <100 then 
      set flag_for_sales ='Super Affordable Product';
	elseif sales >=100 and sales <300 then
		set flag_for_sales ='Affordable Product';
    elseif sales >=300 and sales<600 then
		set flag_for_sales ='Moderate Product';
	else  		
		set flag_for_sales='Expensive';
	end if;
    return flag_for_sales;
end $$ 

select order_type(420);
select sales,order_type(sales) from sales;Order_Type;

# Add New Column and update this data in the Table Sales
alter table sales add column Sales_Type varchar(30);
set SQL_SAFE_UPDATES = 0;
update sales set Sales_Type=order_type(sales);
select Sales_Type from sales;





