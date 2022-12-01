INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT po_id, person.id, (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25'
FROM GENERATE_SERIES((SELECT (MAX(id) + 1) FROM person_order),
                     (SELECT MAX(id) + 1  FROM person) + (SELECT (MAX(id))
                                                         FROM person_order)) as po_id
         JOIN person ON person.id + (SELECT (MAX(id)) FROM person_order) = po_id