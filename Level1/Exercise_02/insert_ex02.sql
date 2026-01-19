USE pizzeria;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE provinces;
TRUNCATE TABLE cities;
TRUNCATE TABLE customers;
TRUNCATE TABLE categories;
TRUNCATE TABLE products;
TRUNCATE TABLE stores;
TRUNCATE TABLE employees;
TRUNCATE TABLE orders;
TRUNCATE TABLE products_quantity;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO provinces(name)
VALUES
    ('Barcelona'),
    ('Valencia'),
    ('Madrid');

INSERT INTO cities(name, province_id)
VALUES
    ('Barcelona', 1),
    ('Badalona', 1),
    ('Valencia', 2),
    ('Madrid', 3),
    ('Getafe', 3);

INSERT INTO customers(name, surname, address, zip_code, city_id, telephone)
VALUES
    ('Marcos', 'Rodriguez Torres', 'Calle de Marcos, 134', 08024, 1, 900123456),
    ('Carlos', 'Marquez Gomez', 'Calle de Carlos, 25', 08012, 1, 900112233),
    ('Maria', 'Pastor Romero', 'Calle de Maria, 62', 46007, 3, 900131324),
    ('Guillermo', 'Perez Martìn', 'Calle de Guillermo, 11', 28037, 4, 900124554),
    ('Sara', 'Álvarez Díaz', 'Calle de Sara, 152/B', 28905, 5, 900367745),
    ('Laia', 'Serrat Pujol', 'Calle de Laia, 39', 08917, 2, 900668971),
    ('Isabella', 'Navarro Casas', 'Calle de Isabella, 102', 28022, 4, 900246801),
    ('Laura', 'Gomez Jiménez', 'Calle de Laura, 15', 08019, 1, 900322332),
    ('Sebastian', 'Cantor Muñoz', 'Calle de Sebastian, 89', 08030, 1, 900869875),
    ('Maya', 'Moreno Martínez', 'Calle de Maya, 60', 28903, 5, 900224378),
    ('Marcos', 'Díaz Gomez', 'Calle de Gomez, 55', 08911, 2, 900309053);

INSERT INTO categories(name)
VALUES
    ('Classic'),
    ('Special'),
    ('Vegans');

INSERT INTO products(product_type, product_name, description, image_url, price, category_id)
VALUES
    ('Drink', 'water', '50cl bottle', '/img/water.jpg', 1.50, NULL),
    ('Drink', 'pepsi', '33cl can', '/img/pepsi.jpg', 2.50, NULL),
    ('Drink', 'beer', '33cl bottle', '/img/beer.jpg', 2.50, NULL),
    ('Hamburger', 'Wagyu', '180g Wagyu beef, manchego cheese, caramelized onion, arugula, tomato', '/img/wagyu_burger.jpg', 15.50, NULL),
    ('Hamburger', 'Cheese', '180g Beef, bacon, cheddar, pickles, lettuce, tomato, mayo', '/img/cheese_burger.jpg', 11.50, NULL),
    ('Pizza', 'Margherita', 'tomato, mozzarella, basil', '/img/margherita.jpg', 9.00, 1),
    ('Pizza', 'Carbonara', 'Cream, bacon, onion and cheese', '/img/water.jpg', 13.00, 2),
    ('Pizza', 'Veggie Delight', 'Seasonal vegetables and vegan cheese', '/img/water.jpg', 12.00, 3),
    ('Pizza', 'Devil''s', 'tomato, mozzarella, spicy salami', '/img/water.jpg', 12.00, 1),
    ('Pizza', 'Parma', 'tomato, mozzarella, Parma ham, arugula and cherry tomatoes', '/img/water.jpg', 13.00, 2),
    ('Pizza', 'Marinara', 'tomato, garlic oil, anchovies and oregano', '/img/water.jpg', 8.00, 1),
    ('Pizza', 'Queen',  'burrata mozzarella, mortadella and pistachio pesto', '/img/water.jpg', 15.00, 2);

INSERT INTO stores (address, zip_code, city_id)
VALUES
    ('Calle Girona, 32', 08010, 1),
    ('Calle de Colon, 46', 08912, 2),
    ('Calle del Sorní, 07', 46004, 3),
    ('Calle Alcalá, 63', 28014, 4),
    ('Plaza de la Magdalena', 28901, 5);

INSERT INTO employees (name, surname, nif, telephone, employee_job, store_id)
VALUES
    ('Isabella', 'Jiménez Gomez', '59823423A', 600437483,'Chef', 1),
    ('Guillermo', 'Gomez Díaz', '47623443G', 650928726, 'Dealer', 1),
    ('Sebastian', 'Martínez Moreno', '12323423A',620839029, 'Chef', 2),
    ('Carlos', 'Moreno Martínez', '34253444F', 620487392, 'Dealer', 2),
    ('Maria', 'Díaz Álvarez', '11113423B', 623948372, 'Chef', 3),
    ('Guillermo', 'Perez Martínez', '12346654G', 600201928, 'Dealer', 3),
    ('Carlos', 'Muñoz Gomez', '42314321G', 650849849, 'Chef', 4),
    ('Maya', 'Romero Díaz', '47234534A', 620938893, 'Dealer', 4),
    ('Laura', 'Torres Álvarez', '43332223B', 650930009, 'Chef', 5),
    ('Sebastian', 'Gomez Navarro', '41555555F', 620938612, 'Dealer', 5);

INSERT INTO orders(order_date_hour, order_type, total_price, delivery_date_hour, employee_id, store_id, customer_id)
VALUES
    ('2025-12-18 18:09:40', 'Delivery', 28.50, '2025-12-18 18:30:15', 2,1,1),
    ('2025-12-18 18:13:20', 'Pickup', 23.00, '2025-12-18 18:35:05', NULL,2,11),
    ('2025-12-18 18:14:23', 'Delivery', 14.50, '2025-12-18 18:36:17', 6,3,3),
    ('2025-12-18 18:26:32', 'Delivery', 53.00, '2025-12-18 18:50:08', 8,4,4),
    ('2025-12-18 18:33:11', 'Pickup', 9.50, '2025-12-18 18:36:17', NULL,5,10),
    ('2025-12-18 18:38:00', 'Delivery', 22.00, '2025-12-18 18:58:17', 2,1,8),
    ('2025-12-18 18:44:56', 'Delivery', 28.50, '2025-12-18 19:03:54', 2,1,9);

INSERT INTO products_quantity (product_id, product_quantity, order_id)
VALUES
    (1, 1, 1),
    (2,1,1),
    (5,1,1),
    (10,1,1),
    (2,2,2),
    (2,1,1),
    (3, 1, 3),
    (9, 1, 3),
    (2, 3, 4),
    (4, 1, 4),
    (12, 2, 4),
    (1, 1, 5),
    (8, 1, 5),
    (1, 1, 6),
    (2, 1, 6),
    (6, 2, 6),
    (2, 2, 7),
    (8, 1, 7),
    (5, 1, 7);

