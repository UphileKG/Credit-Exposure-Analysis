--Populating the newly created tables

INSERT INTO customers (customer_id, annual_income, employment_length, home_ownership)
SELECT DISTINCT 
	member_id,
	annual_inc,
	emp_length,
	home_ownership
FROM staging_loans sl;

SELECT COUNT(*),
FROM customers c ;

INSERT INTO loans (loan_id, customer_id, loan_amount, interest_rate, loan_purpose, loan_status, issue_date)
SELECT DISTINCT 
	id, 
	member_id,
	loan_amnt,
	int_rate,
	purpose,
	loan_status,
	issue_d
FROM staging_loans sl ;

SELECT COUNT(*)
FROM loans l;