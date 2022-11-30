SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, menu.price
FROM pizzeria FULL JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name