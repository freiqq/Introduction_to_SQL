WITH pm AS (
    SELECT pizzeria_id, name, pizza_name, price
FROM menu
FULL JOIN pizzeria p on p.id = menu.pizzeria_id)

SELECT DISTINCT pm.pizza_name, pm.name, pm2.name, pm.price
FROM pm,pm AS pm2
WHERE pm.pizzeria_id > pm2.pizzeria_id AND pm.price = pm2.price
ORDER BY pizza_name

