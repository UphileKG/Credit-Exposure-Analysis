select *
from customers c ;

SELECT AVG(annual_income)
FROM customers c;

SELECT
    MIN(annual_income) AS min_income,
    MAX(annual_income) AS max_income,
    AVG(annual_income) AS avg_income
FROM customers c ;
