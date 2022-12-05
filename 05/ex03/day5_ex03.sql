CREATE INDEX idx_person_order_multi
    ON person_order (person_id, menu_id, order_date);

SET ENABLE_SEQSCAN = off;
SET ENABLE_INDEXSCAN = on;

EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
