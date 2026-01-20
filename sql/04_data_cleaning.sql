--Data cleaning
--1. Standardizing loan status

UPDATE loans  
SET loan_status = 'Default'
WHERE loan_status IN('Charged Off', 'Late', 'Does not meet the credit policy. Status:Charged Off');

UPDATE loans
SET loan_status = 'Paid'
WHERE loan_status IN ('Fully Paid', 'Current', 'Does not meet the credit policy. Status:Fully Paid')

--2. Handling missing income

UPDATE customers 
SET annual_income = 0
WHERE annual_income IS NULL;

--3. Removing any possible duplicate loans

DELETE FROM loans 
WHERE rowid NOT IN (
	SELECT MIN(rowid)
	FROM loans
	GROUP BY customer_id, issue_date
);  

--4. Sanity check

SELECT loan_status
FROM loans l;

SELECT c.customer_id 
FROM customers c
WHERE c.annual_income IS NULL;
