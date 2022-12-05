CREATE UNIQUE INDEX idx_person_order_order_date on person_order(person_id, menu_id)
WHERE order_date = '2022-01-01';


SET ENABLE_SEQSCAN = off;
SET ENABLE_INDEXSCAN = on;
EXPLAIN ANALYZE SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01'