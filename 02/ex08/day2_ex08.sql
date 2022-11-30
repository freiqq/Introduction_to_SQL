SELECT DISTINCT name
FROM person
         JOIN person_order po on person.id = po.person_id
         JOIN menu m on po.menu_id = m.id
WHERE person.gender = 'male'
  AND (person.address = 'Moscow' OR person.address = 'Samara')
  AND (m.pizza_name = 'pepperoni pizza' OR  m.pizza_name = 'mushroom pizza')
ORDER BY name DESC;
