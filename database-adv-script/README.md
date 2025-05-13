SQL Join Queries – Airbnb Clone Database

This directory consists of SQL scripts illustrating advanced usage of JOIN operation in Airbnb Clone project.


- `joins_queries.sql`: Contains example for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN queries to fetch data from various tables.

Queries Overview
INNER JOIN
   - Gets all the bookings and the associated users who created the bookings.
   - Guarantees that only the corrected records that have matching users and booking are displayed.

LEFT JOIN
   – Gets all properties and their respective reviews.
   - Makes sure that even the properties that lack any reviews are in the results set.

FULL OUTER JOIN
   - Fetches all users, as well as all bookings.
   – Contains users without bookings and bookings that much not be linked to users.

Objective

The aim of this task is to show the ability to form complex queries which include different type of joins that will help in data analysis and reporting functionality of backend system.
 Subqueries

 1. Non-Correlated Subquery:
- Fetches all properties with an average review rating bigger than 4.0.
- Uses a sub-query that runs separately from the outer query to find average ratings.

2. Correlated Subquery:
- Users who have made more than 3 bookings.
- The subquery will be executed on per row basis in the outer query while taking the current user id.
