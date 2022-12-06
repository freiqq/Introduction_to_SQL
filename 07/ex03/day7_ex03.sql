-- WITH total AS (WITH pv AS (SELECT pizzeria_id, count(pizzeria_id) AS count, 'visit' AS action_type
--             FROM person_visits
--             GROUP BY pizzeria_id
--             ORDER BY pizzeria_id),
--      po AS (SELECT menu_id, count(menu_id) AS count, 'order' AS action_type
--             FROM person_order
--             GROUP BY menu_id
--             ORDER BY menu_id)
--
-- SELECT p.name, count, action_type
-- FROM pv
-- INNER JOIN pizzeria p on p.id = pv.pizzeria_id
-- UNION ALL
-- (SELECT p.name,
--        SUM((SELECT count
--             FROM po po2
--             INNER JOIN pizzeria pz on pz.id = po2.menu_id
--             WHERE pz.name = p.name)) AS count,
--        action_type
-- FROM po
--          INNER JOIN menu m on m.id = po.menu_id
--          INNER JOIN pizzeria p on p.id = m.pizzeria_id
-- GROUP BY p.name, action_type)
-- ORDER BY action_type, count DESC)
--
-- SELECT name, SUM(count) AS total_count
-- FROM total
-- GROUP BY name
-- ORDER BY total_count DESC, name

WITH temp_table AS ((SELECT p.name, count(pizzeria_id) AS count, 'visit' AS action_type
FROM person_visits
INNER JOIN pizzeria p on p.id = person_visits.pizzeria_id
GROUP BY p.name
ORDER BY count DESC, p.name
LIMIT 3)
UNION ALL
(SELECT p.name, count(order_date), 'order'
FROM person_order
INNER JOIN menu m on m.id = person_order.menu_id
INNER JOIN pizzeria p on m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY p.name LIMIT 3)
ORDER BY action_type, count DESC)

SELECT name, sum(count) AS total_count
FROM temp_table
GROUP BY name
ORDER BY total_count DESC, name;