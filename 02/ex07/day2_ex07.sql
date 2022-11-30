WITH pizz AS (SELECT *
              FROM person_visits
                       FULL JOIN (SELECT id
                                  FROM person
                                  WHERE name = 'Dmitriy') person ON person_visits.person_id = person.id
              WHERE person_visits.visit_date = '2022-01-08'
                AND person_visits.person_id = person.id)

SELECT pizzeria.name
FROM menu
INNER JOIN pizz on pizz.pizzeria_id = menu.pizzeria_id
INNER JOIN pizzeria on pizz.pizzeria_id = pizzeria.id
WHERE menu.price < 800;

