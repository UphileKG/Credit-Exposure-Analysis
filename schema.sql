--Creating Clean Normalized Tables
-- STATUS: FROZEN
-- Date: 2026-01-16
-- Description: Logic validated and results reviewed

CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY,
annual_income INTEGER,
employment_length INTEGER,
home_ownership TEXT
);

CREATE TABLE loans (
loan_id INTEGER PRIMARY KEY,
customer_id INTEGER,
loan_amount INTEGER,
interest_rate REAL,
loan_purpose TEXT,
loan_status TEXT,
issue_date TEXT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);