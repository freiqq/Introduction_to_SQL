-- NEED TO FIX

WITH man AS (SELECT *
FROM person
WHERE gender = 'male'),
    woman AS (SELECT *
FROM person
WHERE gender = 'female')

(SELECT pizzeria.name AS pizzeria_name
FROM person_visits, man, pizzeria
WHERE man.id = person_visits.id AND pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
ORDER BY pizzeria_name)
UNION ALL
(SELECT pizzeria.name AS pizzeria_name
FROM person_visits, woman, pizzeria
WHERE woman.id = person_visits.id AND pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
ORDER BY pizzeria_name)
