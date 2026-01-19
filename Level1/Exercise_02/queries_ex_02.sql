SELECT DISTINCT
    c.name AS city,
    p.product_type  AS product,
    SUM(pq.product_quantity) AS total_drinks
FROM products p
INNER JOIN products_quantity pq
    ON p.product_id = pq.product_id
INNER JOIN orders o
    ON pq.order_id = o.order_id
INNER JOIN stores s
    ON o.store_id = s.store_id
INNER JOIN cities c
    ON s.city_id = c.city_id
WHERE p.product_type  = 'Drink' AND c.name = 'Barcelona';

SELECT
    CONCAT(e.name, ' ', e.surname) AS employee_name,
    COUNT(o.order_id) AS total_orders
FROM orders o
INNER JOIN employees e
    ON o.employee_id = e.employee_id
WHERE e.name = 'Guillermo' AND e.surname = 'Gomez Díaz';

