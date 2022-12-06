CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, round(price*0.9) AS discount_price
FROM person
INNER JOIN person_order po on person.id = po.person_id
INNER JOIN menu m on m.id = po.menu_id
ORDER BY name, pizza_name