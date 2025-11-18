-- Calculate the percentage contribution of each pizza type to total revenue.

(SELECT 
    pizza_types_new.category,
    SUM(orders_details.quantity * pizzas.price) / (SELECT 
            ROUND(SUM(orders_details.quantity * pizzas.price),
                        2) AS total_revenue
        FROM
            orders_details
                JOIN
            pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100 AS total_revenue
FROM
    pizza_types_new
        JOIN
    pizzas ON pizza_types_new.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types_new.category) ORDER BY total_revenue DESC