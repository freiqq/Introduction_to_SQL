set ENABLE_INDEXSCAN = true;
EXPLAIN ANALYZE SELECT pizza_name, pizza_name
FROM pizzeria
INNER JOIN menu m on pizzeria.id = m.pizzeria_id