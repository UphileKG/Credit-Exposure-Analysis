--Exposure concentration

--1. Top borrowers

SELECT 
	customer_id,
	SUM(loan_amount) AS  total_exposure
FROM loans l 
GROUP BY customer_id 
ORDER BY total_exposure DESC LIMIT 10;

--Variability check

SELECT 
	MIN(loan_amount),
	MAX(loan_amount),
	COUNT(DISTINCT loan_amount)
FROM loans;

--Aproved results

--2. Concentration percentage of portfolio

WITH exposure AS (
	SELECT 
		customer_id,
		SUM(loan_amount) AS  total_exposure
	FROM loans 
	GROUP BY customer_id
),
portfolio AS (
	SELECT SUM(total_exposure) AS total_portfolio
	FROM exposure
)
SELECT 
	exposure.customer_id,
	exposure.total_exposure,
	ROUND(
	CAST(exposure.total_exposure AS REAL )* 100 / portfolio.total_portfolio, 2
	) AS exposure_pct
FROM exposure 
CROSS JOIN portfolio 
ORDER BY exposure.total_exposure DESC;

--SANITY CHECK

PRAGMA table_info(loans);

SELECT SUM(CAST(loan_amount AS REAL)) FROM loans;

--The portfolio is several orders of magnitude larger than individual loan balances which is why exposure_pct appears as 0.
--Exposure by income band is more appropriate for this dataset

WITH income_segments AS (
	SELECT 
		customer_id,
		CASE 
			WHEN annual_income < 30000 THEN 'Low Income'
			WHEN annual_income BETWEEN 30000 AND 70000 THEN 'Middle Income'
			ELSE 'High Income'
		END AS income_band 
	FROM customers 
),
band_exposure AS (
	SELECT 
		income_segments.income_band,
		SUM(loans.loan_amount) AS total_exposure
	FROM loans
	JOIN income_segments
		ON loans.customer_id = income_segments.customer_id
	GROUP BY income_segments.income_band
), 
portfolio AS (
	SELECT SUM(total_exposure) AS total_portfolio
	FROM band_exposure
)
SELECT 
	band_exposure.income_band,
	band_exposure.total_exposure,
	ROUND(
		band_exposure.total_exposure * 100.0 / portfolio.total_portfolio, 
		2
	) AS exposure_pct
FROM band_exposure 
CROSS JOIN portfolio 
ORDER BY band_exposure.total_exposure DESC;




















