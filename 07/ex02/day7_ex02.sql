(SELECT p.name, count(pizzeria_id) AS count, 'visit' AS action_type
FROM person_visits
INNER JOIN pizzeria p on p.id = person_visits.pizzeria_id
GROUP BY p.name
ORDER BY count DESC, p.name
LIMIT 3)
UNION ALL
(SELECT p.name, count(order_date), 'order'
FROM person_order
INNER JOIN menu m on m.id = person_order.menu_id
INNER JOIN pizzeria p on m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY p.name LIMIT 3)
ORDER BY action_type, count DESC
