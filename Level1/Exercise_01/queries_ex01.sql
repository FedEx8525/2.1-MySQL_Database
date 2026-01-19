
SELECT
    c.customer_name  AS client,
    COUNT(s.sale_id) AS total_invoices
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
WHERE c.customer_name = 'Marcos Rodriguez Torres' AND s.sale_date BETWEEN '2020-12-01' AND '2025-12-18'
GROUP BY c.customer_name;

SELECT
    e.employee_name AS employee,
    g.brand         AS glass_brand,
    s.sale_date     AS day
FROM sales s
INNER JOIN employees e
ON s.employee_id = e.employee_id
INNER JOIN glasses g
ON s.glass_id = g.glass_id
WHERE e.employee_name = 'Luisa Martínez Ruiz' AND s.sale_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY s.sale_date DESC;

SELECT
    sup.supplier_name AS provider,
    g.brand           AS brand,
    SUM(s.quantity)   AS glasses_sold
FROM sales s
    INNER JOIN glasses g
    ON s.glass_id = g.glass_id
    INNER JOIN suppliers sup
    ON g.supplier_id = sup.supplier_id
GROUP BY sup.supplier_name, g.brand
ORDER BY glasses_sold DESC;

