# Database Setup

## Project

ISE311 - Bank Customer Analysis

## Database

- **DBMS:** Microsoft SQL Server
- **Database Name:** BANK
- **Management Tool:** SQL Server Management Studio (SSMS)

## Setup Steps

1. Created a new database named `BANK` in SSMS.
2. Executed the instructor-provided `BANK.sql` script.
3. Verified that the database contains 12 tables.
4. Confirmed that the `MUSTERI` table contains 1,000 customer records.

## Verification Query

```sql
SELECT COUNT(*) AS MusteriSayisi
FROM MUSTERI;
```

**Result:** 1000 customers.

## Note

The original database initialization script was provided by the course instructor and is not included in this repository.
