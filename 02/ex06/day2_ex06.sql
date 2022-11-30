-- Найдите все названия пицц (и соответствующие названия пиццерий, используя таблицу меню),
-- которые заказывали Денис или Анна. Отсортируйте результат по обоим столбцам.
-- Образец вывода представлен ниже.

SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu on pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2;