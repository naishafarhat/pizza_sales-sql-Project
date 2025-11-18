-- Group the orders by date and calculate the average number of pizzas ordered per day.


SELECT 
    ROUND(AVG(avg_order), 0) as avg_pizza_perday
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS avg_order
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity
