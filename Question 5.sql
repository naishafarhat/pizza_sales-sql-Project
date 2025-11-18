-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types_new.name,
    SUM(orders_details.quantity) AS total_quantity
FROM
    pizza_types_new
        JOIN
    pizzas ON pizza_types_new.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types_new.name
ORDER BY total_quantity DESC
LIMIT 5