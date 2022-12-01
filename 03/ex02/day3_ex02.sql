WITH forgotten_menu AS (SELECT id AS menu_id
                        FROM menu
                        EXCEPT
                        SELECT person_order.menu_id AS menu_id
                        FROM person_order
                        ORDER BY 1)

SELECT DISTINCT pizza_name,
       price,
       (SELECT name
        FROM pizzeria
        WHERE id = menu.pizzeria_id)
FROM forgotten_menu,
     menu,
     pizzeria
WHERE menu.id = forgotten_menu.menu_id
ORDER BY pizza_name, price