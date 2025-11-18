-- Identify the highest-priced pizza.

SELECT 
    pizzas.price, pizza_types_new.name
FROM
    pizza_types_new
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types_new.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;


