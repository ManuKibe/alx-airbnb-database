
```sql
EXPLAIN ANALYZE
SELECT b.id, u.name, p.name, b.start_date, b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2023-01-01';
