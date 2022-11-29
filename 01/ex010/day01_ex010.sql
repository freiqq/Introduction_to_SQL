SELECT person.name AS person_name,
       menu.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order
         INNER JOIN person ON person.id = person_order.person_id
         INNER JOIN menu ON menu.id = menu_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY person.name,
       menu.pizza_name,
       pizzeria.name;