WITH pv AS (SELECT person_id, count(pizzeria_id) as count
FROM person_visits
GROUP BY person_id)

SELECT p.name, pv.count
FROM pv
INNER JOIN person p ON p.id = pv.person_id
ORDER BY count DESC, p.name
LIMIT 4;