WITH p_id AS (SELECT pizzeria_id
              FROM person
                       INNER JOIN person_visits pv on person.id = pv.person_id
              WHERE person.name = 'Andrey'
              EXCEPT ALL
              SELECT pizzeria_id
              FROM person
                       INNER JOIN person_order po on person.id = po.person_id
                       INNER JOIN (SELECT menu_id, pizzeria_id
                                   FROM menu
                                            INNER JOIN person_order po on menu.id = po.menu_id)
                  AS p_m on p_m.menu_id = po.menu_id
              WHERE person.name = 'Andrey')

SELECT (SELECT name FROM pizzeria WHERE p_id.pizzeria_id = pizzeria.id)
FROM p_id
