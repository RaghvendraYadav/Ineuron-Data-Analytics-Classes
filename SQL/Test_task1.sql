/*SELECT * FROM ineuron_fsda.bank_details;
minimum Balance 
SELECT * FROM ineuron_fsda.bank_details order by balance limit 1;
Who has minimum Balance
use ineuron_fsda;
-select * from bank_details where balance in (select  min(balance) from bank_details);
-select * from bank_details where balance = (select  min(balance) from bank_details);
Who has maximum Balance
use ineuron_fsda;
-select * from bank_details where balance in (select  max(balance) from bank_details);
-select * from bank_details where balance = (select  max(balance) from bank_details);
Records who has Loan 
-select * from bank_details where loan='yes';

Average balance of all people who Job role is admin
-select  avg(balance) from bank_details where job='admin.';

No Job and age is below 45
select * from bank_details where job='unknown' and age<45;

education is Primary and person is jobless

select * from bank_details where education='primary' and job='unknown';

Bank Balance is negative
select * from bank_details where balance<0;

Not having House along with there balance 
select balance,housing from bank_details where housing ='no';



*/