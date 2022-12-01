-- -- NEED TO FIX
--
WITH men_visits AS (SELECT *
                      FROM person,
                           person_visits
                      WHERE person_visits.person_id = person.id
                        AND person.gender = 'male'),
     women_visits AS (SELECT *
                      FROM person,
                           person_visits
                      WHERE person_visits.person_id = person.id
                        AND person.gender = 'female'),
     visited_pizzerias AS (SELECT pizzeria_id
                           FROM person_visits,
                                pizzeria,
                                person
                           WHERE pizzeria.id = person_visits.pizzeria_id
                             AND person.id = person_visits.person_id
                           GROUP BY pizzeria_id)



SELECT pizzeria.name AS names
FROM women_visits, pizzeria
WHERE women_visits.pizzeria_id = pizzeria.id
GROUP BY names
UNION ALL
SELECT pizzeria.name AS names
FROM men_visits, pizzeria
WHERE men_visits.pizzeria_id = pizzeria.id
GROUP BY names
ORDER BY names
-- (SELECT pizzeria.name AS pizzeria_name
--      FROM person_order,
--           woman,
--           pizzeria,
--           visited_pizzerias
--      WHERE woman.id = person_order.person_id
--        AND pizzeria.id = visited_pizzerias.pizzeria_id
--      ORDER BY pizzeria_name)
-- -- UNION ALL
-- -- (SELECT pizzeria.name AS pizzeria_name
-- --  FROM person_order,
-- --       man,
-- --       pizzeria,
-- --       visited_pizzerias
-- --  WHERE man.id = person_order.person_id
-- --    AND pizzeria.id = visited_pizzerias.pizzeria_id
-- --  GROUP BY pizzeria.name
-- --  ORDER BY pizzeria_name)
