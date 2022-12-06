CREATE VIEW  v_generated_dates AS
SELECT GENERATE_SERIES(DATE '2022-01-01',
                       DATE '2022-01-31',
                       interval '1 day')::date AS generated_date
ORDER BY generated_date