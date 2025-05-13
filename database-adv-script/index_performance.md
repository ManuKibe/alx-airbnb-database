
## Indexes Created
1. `idx_users_id` on `users(id)`
2. `idx_bookings_user_id` on `bookings(user_id)`
3. `idx_bookings_property_id` on `bookings(property_id)`
4. `idx_properties_id` on `properties(id)`
5. `idx_bookings_created_at` on `bookings(created_at)`

## Performance Measurement

### Sample Query (Before Indexes)
```sql
EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.name;
