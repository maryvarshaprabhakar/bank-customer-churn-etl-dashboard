-- BANK CUSTOMER CHURN PIPELINE: DATABASE SETUP, ETL & CLEANING

-- SOURCE TABLE: bank500 (500 Records)
-- Target View: Cleaned_bank500

USE dataset_500;

-- STEP 1: CREATE CLEAN PRESENTATION VIEW

-- Fixes Geography formatting and converts Null in Balance/Exited back to 0
CREATE OR REPLACE VIEW Cleaned_bank500 AS
SELECT
    RowNumber,
    CustomerId,
    Surname,
    CreditScore,
    -- Fix Geography: Remove spaces, handle GER/france casing
    CASE
        WHEN UPPER(TRIM(Geography)) = 'GER' THEN 'Germany'
        WHEN UPPER(TRIM(Geography)) = 'FRANCE' THEN 'France'
        ELSE TRIM(Geography)
    END AS Geography,
    Gender,
    Age,
    Tenure,
    -- Fix NULL Balances: Replace NULL with 0 for numeric calculations
    COALESCE(Balance, 0) AS Balance,
    NumOfProducts,
    HasCrCard,
    IsActiveMember,
    EstimatedSalary,
    -- Fix NULL Exited: Replace NULL with 0 (assumed non-churned)
    COALESCE(Exited, 0) AS Exited,
    -- Business Label: Display Yes/No for churn status
    CASE
        WHEN COALESCE(Exited, 0) = 0 THEN 'No'
        ELSE 'Yes'
    END AS Is_Exited
FROM bank500;

-- STEP 2: VERIFICATION & AUDIT

-- Verify total record count (500)
SELECT COUNT(*) AS total_records FROM Cleaned_bank500;
-- Preview cleaned data
SELECT * FROM Cleaned_bank500;

-- STEP 3: PIPELINE VERIFICATION & INCREMENTAL DATA AUDIT

-- Check total record count across the cleaned view
SELECT COUNT(*) FROM Cleaned_bank500;
-- Preview top transformed records
SELECT * FROM Cleaned_bank500 LIMIT 30;
-- Verify latest appended batch (run after uploading incremental rows)
SELECT * FROM Cleaned_bank500 
ORDER BY RowNumber DESC 
LIMIT 100;