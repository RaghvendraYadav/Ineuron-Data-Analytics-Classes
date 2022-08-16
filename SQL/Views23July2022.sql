# Views
# Views are actually table but if we r going to store some subset of data or doing manipulation and deal with part of table then we use Views
# Shorted Varsion of the same table ,A subset of the table it is virtual table and helps in optimise the table 
select * from bank_details;

# Create a View
create view bank_view as select age,job,marital,education from bank_details;
select * from bank_view;

