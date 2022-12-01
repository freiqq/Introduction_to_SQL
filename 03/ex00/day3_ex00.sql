WITH person_Kate AS (SELECT * FROM person WHERE name = 'Kate')

SELECT menu.pizza_name AS pizza_name,
       menu.price      AS price,
       menu.pizza_name AS pizzeria_name,
       po.visit_date   AS visit_date
FROM (SELECT *
      FROM person_visits,
           person_Kate
      WHERE person_id = person_Kate.id) as po
         FULL JOIN menu ON menu.pizzeria_id = po.pizzeria_id
WHERE po.visit_date IS NOT NULL
  AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizza_name;