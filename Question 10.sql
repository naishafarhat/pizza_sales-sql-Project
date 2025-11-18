-- Determine the top 3 most ordered pizza types based on revenue.
-- Revenue = quantity * price

SELECT 
    pizza_types_new.name,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types_new
        JOIN
    pizzas ON pizza_types_new.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types_new.name
ORDER BY revenue DESC
LIMIT 3