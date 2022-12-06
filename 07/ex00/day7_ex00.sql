SELECT person_id, count(pizzeria_id) as count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC , person_id;