# Data Dictionary – Telecom Customer Churn

This document describes the 21 columns in the customer churn dataset.

| Column | Meaning |
|---|---|
| `customerID` | Unique customer identifier |
| `gender` | Customer gender |
| `SeniorCitizen` | Whether the customer is a senior citizen (0 = No, 1 = Yes) |
| `Partner` | Whether the customer has a partner |
| `Dependents` | Whether the customer has dependents |
| `tenure` | Number of months the customer has stayed |
| `PhoneService` | Whether the customer has phone service |
| `MultipleLines` | Whether the customer has multiple phone lines |
| `InternetService` | Type of internet service |
| `OnlineSecurity` | Whether online security service is included |
| `OnlineBackup` | Whether online backup service is included |
| `DeviceProtection` | Whether device protection service is included |
| `TechSupport` | Whether technical support service is included |
| `StreamingTV` | Whether streaming TV service is included |
| `StreamingMovies` | Whether streaming movies service is included |
| `Contract` | Customer's contract type |
| `PaperlessBilling` | Whether the customer uses paperless billing |
| `PaymentMethod` | Customer's payment method |
| `MonthlyCharges` | Customer's monthly service charges |
| `TotalCharges` | Total amount charged to the customer |
| `Churn` | Whether the customer left the service (Yes/No) |

## Dataset Notes

- **Rows:** 7,043 customers
- **Columns:** 21
- **Target column:** `Churn`
- **Customer identifier:** `customerID`
- **Data types:** Categorical, integer and decimal values
- `TotalCharges` was converted to a numeric column during cleaning.