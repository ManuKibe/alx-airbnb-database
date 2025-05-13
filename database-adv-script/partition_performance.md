Partitioning Performance Report

Objective
The goal was to improve query performance on the large `bookings` table by partitioning it based on the `start_date` column.

Implementation
We implemented **range-based partitioning** by year (2022, 2023, 2024) and created indexes on `start_date` in each partition.
Testing
A query was executed to fetch bookings for June 2023 using:

```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
