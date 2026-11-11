-- CUSTOMER CHURN ANALYSIS
-- SQL Analysis using MySQL

-- 1. DATABASE SETUP

CREATE DATABASE CustomerChurnDB;
USE CustomerChurnDB;

-- 2. TABLE CREATION

CREATE TABLE Customers (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(25),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(25),
    OnlineBackup VARCHAR(25),
    DeviceProtection VARCHAR(25),
    TechSupport VARCHAR(25),
    StreamingTV VARCHAR(25),
    StreamingMovies VARCHAR(25),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(30),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);

-- 3. DATA VERIFICATION

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

DESCRIBE Customers;

SELECT *
FROM Customers
LIMIT 10;

-- 4. OVERALL CHURN ANALYSIS

-- I. Total Customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- II. Churned Customers
SELECT COUNT(*) AS ChurnedCustomers
FROM Customers
WHERE Churn = 'Yes';

-- III. Overall Churn Rate
SELECT 
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers;

-- 5. CHURN BY CONTRACT

SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY Contract
ORDER BY ChurnRate DESC;

-- 6. CHURN BY INTERNET SERVICE

SELECT
    InternetService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY InternetService
ORDER BY ChurnRate DESC;

-- 7. CHURN BY PAYMENT METHOD

SELECT
    PaymentMethod,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY PaymentMethod
ORDER BY ChurnRate DESC;

-- 8. CHURN BY TENURE

SELECT
    Churn,
    COUNT(*) AS TotalCustomers,
    ROUND(AVG(tenure), 2) AS AverageTenure,
    MIN(tenure) AS MinimumTenure,
    MAX(tenure) AS MaximumTenure
FROM Customers
GROUP BY Churn;

-- 9. CHURN BY MONTHLY CHARGES

SELECT
    Churn,
    COUNT(*) AS TotalCustomers,
    ROUND(AVG(MonthlyCharges), 2) AS AverageMonthlyCharges,
    MIN(MonthlyCharges) AS MinimumMonthlyCharges,
    MAX(MonthlyCharges) AS MaximumMonthlyCharges
FROM Customers
GROUP BY Churn;

-- 10. CHURN BY SENIOR CITIZEN

SELECT
    SeniorCitizen,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY SeniorCitizen
ORDER BY ChurnRate DESC;

-- 11. CHURN BY PARTNER AND DEPENDENTS

SELECT
    'Partner' AS CustomerFactor,
    Partner AS Category,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY Partner

UNION ALL

SELECT
    'Dependents' AS CustomerFactor,
    Dependents AS Category,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY Dependents
ORDER BY ChurnRate DESC;

-- 12. CHURN BY SUPPORT & SECURITY SERVICES

SELECT
    'TechSupport' AS Service,
    TechSupport AS Category,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY TechSupport

UNION ALL

SELECT
    'OnlineSecurity' AS Service,
    OnlineSecurity AS Category,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY OnlineSecurity

UNION ALL

SELECT
    'DeviceProtection' AS Service,
    DeviceProtection AS Category,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY DeviceProtection

ORDER BY ChurnRate DESC;

-- 13. CHURN BY PAPERLESS BILLING

SELECT
    PaperlessBilling,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS ChurnRate
FROM Customers
GROUP BY PaperlessBilling
ORDER BY ChurnRate DESC;