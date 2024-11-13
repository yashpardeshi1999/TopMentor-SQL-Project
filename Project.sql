create database tm_project_db;
use tm_project_db;

select * from financial_dataset;

#Q.1)What is the total number of loan applications in the financial dataset?
select count(id) as total_loan_applications from financial_dataset; #total loan applications

#Q.2)What is the total funded loan amount across all loan applications in the financial dataset?
select sum(loan_amount) as total_funded_amount from financial_dataset; #total funded amount

#Q.3)What is the total amount received as payments from loan applications in the financial dataset?
select sum(total_payment) as total_amount_received from financial_dataset; #total payments received

#Q.4)What is the average interest rate (in percentage) for loans in the financial dataset?
select avg(int_rate)*100 as avg_int_rate from financial_dataset; #avg_interest_rate

#Q.5)What is the average interest rate (rounded to two decimal places, in percentage) for loans in the financial dataset?
select round(avg(int_rate),2)*100 as avg_int_rate from financial_dataset; #avg_interest_rate

#Q.6)What is the average debt-to-income (DTI) ratio (in percentage) for loan applicants in the financial dataset?
select avg(dti)*100 as avg_dti from financial_dataset; #avg_dti

#Q.7)What are the loan status of ids in the financial dataset?
select loan_status,id from financial_dataset;

#Q.8)How many loan applications are considered "Good Loans" in the financial dataset?
select count(id) as Good_Loan_Applications from financial_dataset 
where loan_status='Fully Paid' or loan_status='Current'; #Number of Good loan applications

#Q.9)How many loan applications are considered "Bad Loans" in the financial dataset?
select count(id) as Bad_Loan_Applications from financial_dataset
where loan_status='Charged Off'; #Number of Bad loan applications 

#Q.10)What percentage of loan applications are classified as "Good Loans"  in the financial dataset?
select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)/
count(id) as Good_Loan_Percentage from financial_dataset; #Good loan percentage 

#Q.11)What percentage of loan applications are classified as "Bad Loans" in the financial dataset?
select (count(case when loan_status='Charged Off' then id end)*100)/
count(id) as Bad_Loan_Percentage from financial_dataset; #Bad loan percentage 

#Q.12)What is the total funded amount for loans classified as "Bad Loans" in the financial dataset?
select sum(loan_amount) as Bad_load_amount from financial_dataset where loan_status='Charged Off'; #Bad loan funded amount 

#Q.13)What is the total funded amount for loans classified as "Good Loans" in the financial dataset?
select sum(loan_amount) as Good_load_amount from financial_dataset where loan_status='Fully Paid' or loan_status='Current'; #Good loan funded amount 

#Q.14)What is the total amount received as payments from loans classified as "Bad Loans" (i.e., "Charged Off") in the financial dataset?
select sum(total_payment) as Bad_Loan_Amount_Received from financial_dataset where loan_status='Charged Off';
