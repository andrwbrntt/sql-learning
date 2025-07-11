-- Clarifying question: do we want customer names or only IDs? Names + emails

/**
LOWER and TRIM to clean names and emails
CONCAT first and last names
COUNT for total number of orders
LEFT JOIN to include all customers
COUNT outputs NULL as 0 already
ROUND to 2 decimal places
COALESCE to handle NULL with SUM output
SUM to find total amount spent
ROUND to the nearest whole number
JULIANDAY for date difference
DATE('now') instead of CURDATE 
MAX to get most recent order date
CASE statement for order_status
ORDER BY last_order NULL first then DESC
**/

SELECT LOWER(CONCAT(TRIM(c.first_name), ' ', TRIM(c.last_name))) AS full_name, LOWER(TRIM(c.email)) AS email, COUNT(o.order_number) AS order_count, ROUND(COALESCE(SUM(o.total_amount), 0), 2) AS total_amount, ROUND(JULIANDAY(DATE('now'))-JULIANDAY(MAX(o.order_date))) AS last_order, CASE
        -- SQLite does not allow the alias in the CASE statement
        WHEN ROUND(JULIANDAY(DATE('now'))-JULIANDAY(MAX(o.order_date))) <= 30 THEN 'Active'
        WHEN ROUND(JULIANDAY(DATE('now'))-JULIANDAY(MAX(o.order_date))) > 30 THEN 'Inactive'
        ELSE 'Never Purchased'
    END AS customer_status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY full_name
ORDER BY last_order IS NULL DESC, last_order DESC

-- Needed hint / reminder for DATEDIFF syntax
-- Needed hint to figure out SQLite doesn't have DATEDIFF or CURDATE
