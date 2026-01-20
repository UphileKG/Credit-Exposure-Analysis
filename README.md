# Credit Exposure Analysis

## Table of Contents
- [Project Overview](#Project-Overview)
- [Objectives](#Objectives)
- [Dataset Description](#Dataset-Description)
- [Key Business Question](#Key-Business-Question)
- [Analysis Workflow](#Analysis-Workflow)
- [Income Band Logic](#Income-Band-Logic)
- [Key Findings](#Key-Findings)
- [Recommendations](#Recommendations)
- [Reproducibility](#Reproducibility)
- [Author: Uphile Gama](#Author-Uphile-Gama)
- [Data source](#Data-source)


## Project Overview 
This project analyzes a credit portfolio to understand exposure distribution across income bands, with a focus on identifying risk concentration and portfolio composition.

The analysis simulates a real-world financial analytics workflow: starting from raw, inconsistent data, applying structured cleaning and normalization, and producing interpretable exposure metrics suitable for business decision-making.

## Objectives

- Clean and standardize raw portfolio data.
- Categorize customers into meaningful income bands.
- Calculate total exposure and percentage exposure by income band.
- Produce a reproducible SQL-based analysis pipeline.
- Demonstrate practical data analysis skills used in financial services.

## Dataset Description

The dataset represents a asimplified credit portfolio containing:
- Customer identifiers
- Income values
- Loan balances (exposure)
- Account and customer status fields

NB: This dataset is anonymized and used for demonstration purposes only.

## Key Business Question

__How is credit exposure distributed across customer income bands, and where is portfolio risk concentrated?__ 

## Tools & Technologies
- SQL (SQLite /PostgreSQL compatible syntax)
- Relational database design
- Data cleaning & transformation
- Analytical aggregation

## Analysis Workflow
The project follows a clear, modular SQL pipeline:

### 1. Schema Definition
- Defines tables and data types to ensure structural consistency

### 2. Data Loading & Normalization
- Raw values standardized
- Nulls and invalid entries handled
- Income vales prepared for banding

### 3. Data Cleaning 
- Status fields normalized
- Invalid or inactive records excluded
- Exposure values validated

### 4. Exposure Analysis
- Customers grouped into predefined income bands
- Total exposure calculated per band
- Percentage of total portfolio exposure computed

## Income Band Logic
Income bands were defined to balance interpretability and alignment with common consumer finance segmentation, for example:
- Low income
- Middle income
- High Income

This enables comparison of risk concentration across customer segments. Also, The portfolio is several orders of magnitude larger than on individual loan balances which leads to misinterpretable results.

## Key Findings
- **Default rates by income bands**
  - Low Income: 7.75%
  - Middle Income: 6.1%
  - High Income: 4.01%
- **Exposure is not evenly distributed across income bands**
  - Low Income: 2.48%
  - Middle Income: 43.66%
  - High Income: 53.86%
- The high and middle income bands represent disproportionately higher risk concentration of the total exposure. This increases risks of expecting losses to deplete the institutions capital.
- This is especially true for the middle income band considerng the rate of default of thus  band being higher than 5% (6.1%).
- The default rate of the high income band remains at an acceptable rate at 4.01%, despite accounting for the most exposure of the portfolio.
- The low-income band represent higher risk concentration (7.75%) despite smaller customer counts indicated by the band's higher default rate.

## Recommendations — Value adding insight
1. **Stricter lending requirements:** Enforce more rigorous credit checks and approvals for new applicants, especially those who fall under low income category.
2. **Early intervention:** Invest more into warning systems and predictive measures that can identify potential payment issues and reach out to  borrowers before they default.
3. **Increase loan loss reserves:** 2/3 of the loan portfolio is at high risk at defaulting and so the the institution should set aside a larger reserve to cover potential losses.
4. **Offer flexible solutions:** Offer flexible repayment options to assist struggling borrowers meet their obligations.

## Reproducibility
- The entire analysis can be rerun from raw data using the SQL scripts.
- Logic has been validated and frozen.
- Results are deterministic and explainable.

## Author: Uphile Gama
Aspiring Financial Data Analyst focused on building practical, job-ready analytical skills.

## Data source
1. [Kaggle, Credit Risk Analysis](https://www.kaggle.com/datasets/ranadeep/credit-risk-dataset/data)
















