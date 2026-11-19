# ISE311 – Bank Customer Analysis with SSIS

## Project Overview

This project was developed for the **ISE311 Data Science** course.

The main objective is to analyze customer data stored in the SQL Server `BANK` database and identify the top-ranked customers within each region and customer category.

The project uses **Microsoft SQL Server**, **SQL Server Integration Services (SSIS)**, and **SQL** to calculate customer wealth, determine customer locations, rank customers, and generate a final analysis table.

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL Server Integration Services (SSIS)
- Visual Studio 2022
- SQL
- Git & GitHub

## Project Workflow

The SSIS package performs the following operations:

### 1. Customer Location Analysis

- Retrieves customer account information.
- Identifies each customer's earliest bank account.
- Determines the associated city and region.
- Stores intermediate results in `Stg_MusteriKonum`.

### 2. Customer Wealth Calculation

- Calculates customers' total cash balances.
- Calculates the TRY equivalent of their owned assets.
- Combines cash and asset values to determine total wealth in TRY.
- Stores intermediate results in `Stg_MusteriServet`.

### 3. Customer Ranking

- Retrieves customer information, including full name, category, and age.
- Ranks customers separately within each region and category.
- Applies age in ascending order and total wealth in descending order.
- Uses SQL Server's `DENSE_RANK()` function.
- Stores the results in `Stg_MusteriSiralama`.

### 4. Final Customer Analysis

- Combines customer ranking and wealth information.
- Selects customers whose ranking is between 1 and 3.
- Loads the results into `MusteriAnalizSonuc`.

## Final Output

The final SQL Server table contains the following columns:

| Column     | Description                            |
| ---------- | -------------------------------------- |
| MusteriID  | Customer identifier                    |
| KategoriID | Customer category                      |
| TamAd      | Full name                              |
| SehirAd    | City                                   |
| BolgeAd    | Region                                 |
| Yas        | Age                                    |
| ServetTRY  | Total wealth in TRY                    |
| SiraNo     | Ranking within the region and category |

**Final result:** 126 customer records across 8 columns.

The ranking uses `DENSE_RANK()`, allowing customers with equal ranking values to share the same rank.

## SSIS Package Structure

The package contains eight tasks executed sequentially:

1. `SQL_ClearCustomerLocation`
2. `DFT_CustomerAnalysis`
3. `SQL_ClearCustomerWealth`
4. `DFT_CustomerWealth`
5. `SQL_ClearCustomerRanking`
6. `DFT_CustomerRanking`
7. `SQL_ClearFinalResults`
8. `DFT_FinalCustomerResults`

The staging and final tables are cleared before each load to prevent data accumulation across package executions.

## Repository Structure

```text
ISE311-Bank-Customer-Analysis/
├── docs/
├── sql/
│   ├── customer_cash_try.sql
│   ├── customer_assets_try.sql
│   ├── customer_total_wealth.sql
│   ├── customer_account_order.sql
│   ├── customer_region.sql
│   ├── customer_details.sql
│   ├── customer_ranking.sql
│   ├── top_3_customers.sql
│   ├── create_staging_tables.sql
│   └── create_final_results_table.sql
├── ssis/
│   └── BankCustomerAnalysisSSIS/
├── .gitignore
└── README.md
```

## How to Run

1. Set up the instructor-provided `BANK` database in SQL Server.
2. Execute `sql/create_staging_tables.sql` to create the staging tables.
3. Execute `sql/create_final_results_table.sql` to create the final results table.
4. Open the SSIS project in Visual Studio 2022.
5. Configure the OLE DB connection manager for the local SQL Server instance and `BANK` database.
6. Execute `Package.dtsx`.
7. Inspect the final results using:

```sql
SELECT *
FROM dbo.MusteriAnalizSonuc
ORDER BY BolgeAd, KategoriID, SiraNo, MusteriID;
```

_The instructor-provided source database script is not included in this repository._

## Validation

The SSIS package was executed and tested successfully.

The following checks were performed:

- Final table contains 126 records and 8 columns.
- Customer rankings are within the required range of 1–3.
- No missing wealth or region values were detected.
- No duplicate customer records were detected.
- Re-executing the package produced the same record count.
- Bidirectional SQL result comparisons returned zero differences.

## Course Information

**Course:** ISE311 – Data Science  
**Project:** Bank Customer Analysis  
**Project Type:** SQL Server & SSIS Data Integration
