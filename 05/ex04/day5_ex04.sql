CREATE UNIQUE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = off;
SET ENABLE_INDEXSCAN = on;
EXPLAIN ANALYZE  SELECT *
FROM menu
