# Data Cleaning Log – Telecom Customer Churn Analysis

## Dataset Overview

- Initial records: **7,043**
- Initial columns: **21**
- Duplicate rows: **0**
- Blank `TotalCharges` values: **11**

## Cleaning Steps

| Issue | Action Taken |
|---|---|
| 11 blank values in `TotalCharges` | Converted the column to numeric using `pd.to_numeric()` |
| Blank values became missing values after conversion | Checked the corresponding customers' tenure |
| All 11 customers had zero tenure | Replaced their missing `TotalCharges` values with `0` |

## Why Were the Blank Values Replaced with Zero?

All 11 customers with blank `TotalCharges` had a tenure of zero months. Since they had no recorded service tenure, their total charges were set to zero for the analysis.

## Final Data Check

- Missing values: **0**
- Duplicate rows: **0**
- `TotalCharges` data type: **float64**
- Cleaned records: **7,043**
- Cleaned columns: **21**

## Output

The cleaned dataset was exported as:

`Dataset/Processed/Customer_Churn_Cleaned.csv`

