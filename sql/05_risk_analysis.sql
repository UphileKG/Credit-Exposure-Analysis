--Risk Analysis
-- STATUS: FROZEN
-- Date: 2026-01-16
-- Description: Logic validated and results reviewed

--1. Total loan exposure 

SELECT 
	SUM(loan_amount) AS total_loan_exposure
FROM loans l ;

--2. Income bands creation 
--Income bands chosen for interpretability and alignment
-- With common consumer finance segmentation

WITH income_segments AS (
	SELECT 
		customer_id,
		CASE 
			WHEN annual_income < 30000 THEN 'Low Income'
			WHEN annual_income BETWEEN 30000 AND 70000 THEN 'Middle Income'
			ELSE 'High Income'
		END AS income_band 
	FROM customers 
)
SELECT *
FROM income_segments LIMIT 10;

--3. Default rate by income band

WITH income_segments AS (
	SELECT 
		customer_id,
		CASE 
			WHEN annual_income < 30000 THEN 'Low Income'
			WHEN annual_income BETWEEN 30000 AND 70000 THEN 'Middle Income'
			ELSE 'High Income'
		END AS income_band 
	FROM customers c
)
SELECT 
	income_band,
	COUNT(loan_id) as total_loans, 
	SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) AS default_loans,
	ROUND(
		SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) * 100.0
		/ COUNT(loan_id),
		2
	) AS default_rate_pct
FROM loans
Join income_segments
	ON loans.customer_id = income_segments.customer_id 
GROUP BY income_segments.income_band 
ORDER BY default_rate_pct DESC;
	
