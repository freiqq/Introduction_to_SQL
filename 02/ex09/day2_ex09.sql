SELECT DISTINCT name
FROM person
         JOIN person_order po on person.id = po.person_id
         JOIN menu m on po.menu_id = m.id
WHERE person.gender = 'female' AND m.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT DISTINCT name
FROM person
         JOIN person_order po on person.id = po.person_id
         JOIN menu m on po.menu_id = m.id
WHERE person.gender = 'female' AND m.pizza_name = 'cheese pizza'
ORDER BY name;
