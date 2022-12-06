INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria_id FROM pizzeria
        INNER JOIN menu m on pizzeria.id = m.pizzeria_id
        WHERE m.price < 800 AND name <> (SELECT name FROM mv_dmitriy_visits_and_eats) LIMIT 1),
        '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;