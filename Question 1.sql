-- Retrieve the total number of orders placed.
-- Revenue = quantity * price

SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders
