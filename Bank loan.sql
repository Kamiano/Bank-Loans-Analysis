select count(id) as Total_Clients
 from financial_loan;

select count(id) as MTD_total_loan_application
from financial_loan where month(issue_date) = 12 and year(issue_date) =2021;
 
select count(id) as previousMTD 
from financial_loan where month(issue_date) =11 and year(issue_date)= 2021;
 
select sum(loan_amount) as MTD_total_funded_amount 
from financial_loan where month(issue_date)=12 and year(issue_date)=2021;
 
select sum(loan_amount) as Previous_MTD_total_funded_amount 
from financial_loan where month(issue_date)=11 and year(issue_date)=2021;
 
select sum(total_payment) as Total_Amount_received 
from financial_loan;
 
select sum(total_payment) as MTD_Amount_received 
from financial_loan where month(issue_date)=12 and year(issue_date)= 2021;
 
select sum(total_payment) as PMTD_Amount_received 
from financial_loan where month(issue_date)=11 and year(issue_date)= 2021;
 
select round(avg(int_rate)*100 ,2,2) as avg_intr_rate 
from financial_loan ; 
 
select round(avg(int_rate)*100,2,2 )as MTD_avg_intr_rate 
from financial_loan where month(issue_date)=12 and year(issue_date)=2021;
 
select round(avg(int_rate)*100,2,2) as PMTD_avg_intr_rate 
from financial_loan where month(issue_date)=11 and year(issue_date)=2021; 

select round(avg(dti)*100,2,2) as MTD_avg_DTI 
from financial_loan;
 
select round(avg(dti)*100,2,2) as MTD_avg_DTI 
from financial_loan where month(issue_date)=12 and year(issue_date)=2021;
 
select round(avg(dti)*100,2,2) as PMTD_avg_DTI 
from financial_loan where month(issue_date)=11 and year(issue_date)=2021;
 
select count(loan_status) as good_loans 
from financial_loan where loan_status in ('fully paid','current');
 
select (count(case when loan_status in ('fully paid','current')then id end)*100)/
count(id) as percentage_of_good_loans from financial_loan;
 
select sum(loan_amount) as good_loans_funds 
from financial_loan where loan_status in ('fully paid','current');
 
select sum(total_payment) as good_loans_payment 
from financial_loan where loan_status in ('fully paid','current');
 
select count(loan_status) as bad_loans 
from financial_loan where loan_status = 'charged off';
 
select count(case when loan_status='charged off' then id end)*100 / count(id) as Bad_loans_perc
from financial_loan;
 
select sum(loan_amount) as Bad_loans_funds 
from financial_loan where loan_status ='charged off';

select sum(total_payment) as Bad_loans_payment 
from financial_loan where loan_status ='charged off';
  
select 
 loan_status,
 count(id) as Total_loan_applications,
 sum(total_payment) as Total_amount_paid_back,
 sum(loan_amount) as Total_funded_amount,
 round(avg(int_rate)*100,4) As Interest_rate,
 round(avg (dti*100),4) as DTI
 from 
 financial_loan
 group by loan_status;

select 
	loan_status,
	sum(total_payment) as MTD_total_amount_received,
	sum(loan_amount) as MTD_total_funded_amount
	from financial_loan
	where month(issue_date)= 12
	group by loan_status;
 
select 
	month(issue_date) as month_no,
	datename(month, issue_date) as month,
	count(id) as total_loan_applications,
	sum(loan_amount)as total_funded_amount,
	sum(total_payment) as total_amount_received
	from financial_loan
	group by month(issue_date),datename(month, issue_date)
	order by month(issue_date);
 
select 
	address_state,
	count(id) as total_loan_applications,
	sum(loan_amount)as total_funded_amount,
	sum(total_payment) as total_amount_received
	from financial_loan
	group by address_state
	order by sum(loan_amount) desc;
 
select 
	term,
	count(id) as total_loan_applications,
	sum(loan_amount)as total_funded_amount,
	sum(total_payment) as total_amount_received
	from financial_loan
	group by term
	order by term;
 
select 
	emp_length,
	count(id) as total_loan_applications,
	sum(loan_amount)as total_funded_amount,
	sum(total_payment) as total_amount_received
	from financial_loan
	group by emp_length
	order by emp_length;

select 
	 purpose,
	count(id) as total_loan_applications,
	sum(loan_amount)as total_funded_amount,
	sum(total_payment) as total_amount_received
	from financial_loan
	group by purpose
	order by purpose;
 
select 
	home_ownership,
	count(id) as total_loan_applications,
	sum(loan_amount)as total_funded_amount,
	sum(total_payment) as total_amount_received
	from financial_loan
	group by home_ownership
	order by home_ownership;
 

