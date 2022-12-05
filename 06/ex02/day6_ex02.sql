SELECT p.name,
       m.pizza_name,
       m.price,
       (m.price * (100 - person_discounts.discount)) / 100 AS discount_price,
       pz.name                                             AS pizzeria_name
FROM person_discounts
         INNER JOIN person p ON p.id = person_discounts.person_id
         INNER JOIN pizzeria pz on pz.id = person_discounts.pizzeria_id
         INNER JOIN menu m on pz.id = m.pizzeria_id
ORDER BY p.name, m.pizza_name