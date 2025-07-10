/**
LOWER to normalize case
TRIM to catch any leading or trailing spaces
CONCAT for full name
COUNT for # of orders
SUM for amount spent
AVG for order value
ROUND to 2 decimal places
MAX for most recent
**/

SELECT LOWER(CONCAT(TRIM(c.first_name), ' ', TRIM(c.last_name))) AS full_name, LOWER(TRIM(c.email)) AS email, COUNT(o.order_number) AS order_count, ROUND(SUM(o.total_amount), 2) AS total_amount, ROUND(AVG(o.total_amount), 2) AS avg_amount, MAX(o.order_date) AS most_recent_order
FROM customers c
-- Only includes those who have actually made orders
JOIN orders o ON c.customer_id = o.customer_id
-- SQLite allows for grouping by alias while there are others that will not allow it
GROUP BY full_name
ORDER BY total_amount DESC

-- Only hint provided was MAX() for obtaining the most recent date
