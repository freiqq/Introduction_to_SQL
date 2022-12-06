SELECT p.name, count(m.price) AS count_of_orders,
       ROUND(AVG(m.price), 2) AS avg_price,
       MAX(m.price) AS max_price,
       MIN(m.price) AS min_price
FROM person_order
         INNER JOIN menu m on m.id = person_order.menu_id
         INNER JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY p.name