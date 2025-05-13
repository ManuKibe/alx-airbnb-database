

```sql
SELECT 
    b.id, u.id, u.name, p.id, p.title, pay.id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
