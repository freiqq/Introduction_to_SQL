SELECT DISTINCT name
FROM person_order
FULL JOIN person p on p.id = person_order.person_id
WHERE person_order.id IS NOT NULL
ORDER BY name