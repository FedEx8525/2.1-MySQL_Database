
SELECT
    c.customer_name  AS client,
    COUNT(s.sale_id) AS total_invoices,
    SUM(s.total_price) AS total_import
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
WHERE c.customer_name = 'Marcos Rodriguez Torres' AND s.sale_date BETWEEN '2020-12-01' AND '2025-12-18'
GROUP BY c.customer_id, c.customer_name;

SELECT
    e.employee_name AS employee,
    b.name          AS glass_brand,
    g.mount_type    AS mount_type,
    g.mount_color   AS mount_color,
    s.sale_date     AS sale_date
FROM sales s
JOIN employees e
ON s.employee_id = e.employee_id
JOIN glasses g
ON s.glass_id = g.glass_id
JOIN brands b 
ON g.brand_id = b.brand_id
WHERE e.employee_name = 'Luisa Martínez Ruiz' AND YEAR(s.sale_date) = 2025
ORDER BY s.sale_date DESC;

SELECT
    sup.supplier_name         AS provider,
    COUNT(DISTINCT b.brand_id) AS total_brands_sells,
    SUM(s.quantity)           AS total_unity_sells,
    SUM(s.total_price)        AS total_invoices
FROM sales s
JOIN glasses g
ON s.glass_id = g.glass_id
JOIN brands b 
ON g.brand_id = b.brand_id
JOIN suppliers sup
ON b.supplier_id = sup.supplier_id
GROUP BY sup.supplier_id, sup.supplier_name
ORDER BY total_invoces DESC;

