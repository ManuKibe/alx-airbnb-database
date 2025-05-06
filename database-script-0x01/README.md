The directory houses a SQL script which defines the essential database structure for the Airbnb Clone project.
The existing files
- `schema.sql`: The database creation script includes multiple `CREATE TABLE` commands for Users, Properties, Bookings and Payments, Reviews and Messages.
- Defines constraints such as:
  - Primary Keys
  - Foreign Keys
  - ENUM types
  - CHECK constraints for valid ratings
The database includes index structures for fields that get queried often including `email`, `property_id`, and `booking_id`.
Key Notes
The database ensures scalability and record consistency throughout all records by using UUIDs as primary keys.
SQL ENUM fields help enforce valid role assignments while booking states and payment options.
Records receive timestamps for automatic creation and updating through database management.
