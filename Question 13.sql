-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
 
select name , revenue from
(select category, name, revenue , rank() over (partition by category order by revenue desc) as rn 
from
(SELECT 
    pizza_types_new.category,pizza_types_new.name,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types_new
        JOIN
    pizzas ON pizza_types_new.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types_new.category, pizza_types_new.name) as a) as b 
where rn <= 3
