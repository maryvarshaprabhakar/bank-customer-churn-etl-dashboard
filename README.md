# End-to-End Bank Customer Churn Pipeline & Dashboard

## Overview
An end-to-end data engineering and analytics pipeline built to analyze retail bank customer retention. Demonstrates relational database design, SQL data cleaning, live ODBC connectivity, and interactive dashboarding.

---

## Architecture Pipeline
`MySQL Database (Source)` ➔ `SQL Cleaned View` ➔ `Excel (Power Query)` ➔ `Power BI (Dashboard)`

---

## Tech Stack & Features
* **MySQL:** Hosted source data (`bank500`) and constructed a cleaned view (`Cleaned_bank500`) using `COALESCE`, `CASE`, and `TRIM` to resolve formatting and missing values.
* **Excel:** Connected directly to MySQL via ODBC for dynamic data modeling and pivot reporting.
* **Power BI:** Built interactive dashboards to visualize churn metrics, demographic splits, and account balance distributions.

---

## Key Findings
1. **Geography Trends:** Normalized location data showed consistent churn patterns across Germany and France.
2. **Product Engagement:** Single-product holders demonstrate a significantly higher exit rate compared to multi-product customers.
3. **Account Balances:** Imputed missing balance records enabled accurate financial risk modeling across all customer segments.

---

## Repository Contents
* `/sql/`: SQL setup and data cleaning scripts (`.sql`)
* `/data/`: Raw CSV input files (`.csv`)
* `/excel/`: Dynamic Excel workbook with ODBC connection (`.xlsx`)
* `/powerbi/`: Interactive Power BI dashboard (`.pbix`)
