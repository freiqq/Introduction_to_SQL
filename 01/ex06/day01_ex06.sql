SELECT order_date AS action_date, (SELECT name FROM person WHERE id = person_id) AS person_name
FROM person_order
INTERSECT
SELECT visit_date AS action_date, (SELECT name FROM person WHERE id = person_id) AS person_name
FROM person_visits
ORDER BY action_date ASC, person_name DESC;