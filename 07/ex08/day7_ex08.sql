SELECT address, p.name, count(p.name) as count_of_orders
FROM person
INNER JOIN person_order po on person.id = po.person_id
INNER JOIN menu m on m.id = po.menu_id
INNER JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY address, p.name
ORDER BY address, p.name