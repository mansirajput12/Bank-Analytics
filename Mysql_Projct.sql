create database bank_loan;
use bank_loan;

select * from finance_1_a ;
/*
KPI 1
1)year wise loan amt.*/
select year(issue_d) as yearly_issue_date, sum(loan_amnt) as Total_loan_amnt
from finance_1_a 
group by yearly_issue_date
order by yearly_issue_date;

/* kpi 2
grade sub-grade  wise revol_bal*/
 select * from finance_2;
 
 select grade, sub_grade,sum(revol_bal) as Total_revol
 from finance_1_a inner join finance_2
 on(finance_1_a.id = finance_2.ID)
 group by grade, sub_grade
 order by grade, sub_grade;
 
 
/* kpi 3
total payments for verified/ not verified status
*/
select verification_status, concat("$" ,round(count(total_pymnt)/1000,2),"K") as total_payments
from finance_1_a inner join finance_2
on (finance_1_a.id= finance_2.ID)
group by verification_status; 

select* from finance_1_a;
select * from finance_2;

/* 4 kpi
state wise last credit pull wise loan status*/
select addr_state as state, last_credit_pull_d as last_credit_pull_date, loan_status
from finance_1_a  inner join finance_2
on (finance_1_a.id = finance_2.ID)
group by state, last_credit_pull_date, loan_status;

/* 5 kpi
home ownership/ last payment date status
*/
select home_ownership, last_pymnt_d
from finance_1_a inner join finance_2
on (finance_1_a.id = finance_2.ID)
group by home_ownership , last_pymnt_d
order by home_ownership desc, last_pymnt_d;


select * from finance_2 ;