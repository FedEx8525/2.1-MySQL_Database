USE optics;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE sales;
TRUNCATE TABLE glasses;
TRUNCATE TABLE suppliers;
TRUNCATE TABLE customers;
TRUNCATE TABLE employees;
SET FOREIGN_KEY_CHECKS = 1;

    INSERT INTO suppliers (supplier_name, supplier_address, supplier_telephone, supplier_fax, supplier_nif)
    VALUES
        ('Luxottica', 'Calle de Luxotica, 105, Sants-Montjuïc, 08029, Barcelona', 900111222, NULL, 'NIF123'),
        ('Marcolín', 'Calle de Marcolín, 54, Ciudat Vella, 08002, Barcelona', 900444555, 900123123, 'NIF436'),
        ('Beautaste', 'Calle Beautaste, 347, Horta-Guinardó, 08030, Barcelona', 900467764, NULL, 'NIF987');

    INSERT INTO customers (customer_name, customer_address, customer_telephone, customer_e_mail, customer_registration, customer_who_recommended)
    VALUES
        ('Marcos Rodriguez Torres', 'Calle de Marcos, 134, Les Corts, 08024, Barcelona', 900111111, 'marcos@gmail.com', '2025-12-15', NULL),
        ('Carlos Marquez Gomez', 'Calle de Carlos, 25, Gràcia, 08012, Barcelona', 900826862, 'carlos@gmail.com', '2025-12-15', NULL),
        ('Sebastian Cantor Muñoz', 'Calle de Sebastian, 53, Sant Andreu, 08030, Barcelona', 900456789, 'sebastian@gmail.com', '2025-12-12', NULL),
        ('Maria Pastor Romero', 'Calle de Maria, 90, Sant Martì, 08019, Barcelona', 900446677, 'maria@gmail.com', '2025-12-12', 1),
        ('Laia Serrat Pujol', 'Calle de Laia, 01, Serrià-Sant Gervasi, 08022, Barcelona', 900121234, 'laia@gmail.com', '2025-12-12', 2),
        ('Guillermo Perez Martìn', 'Calle de Guillermo, 32, Sant Martì, 08020, Barcelona', 900987654, 'guillermo@gmail.com', '2025-12-11', 1),
        ('Sara Álvarez Díaz', 'Calle de Sara, 289, L''Eixample, 08010, Barcelona', 900674523, 'sara@gmail.com', '2025-12-11', 3),
        ('Laura Gomez Jiménez', 'Calle de Laura, 99, Gràcia, 08024, Barcelona', 900792739, 'laura@gmail.com', '2025-12-11', NULL),
        ('Isabella Navarro Casas', 'Calle de Isabella, 105, Ciutat Vella, 08003, Barcelona', 900115599, 'iasabella@gmail.com', '2025-12-11', 1),
        ('Maya Moreno Martínez', 'Calle de Maya, 68, Sant Andreu, 08030, Barcelona', 900150150, 'maya@gmail.com', '2025-12-11', 2);

    INSERT INTO employees (employee_name)
    VALUES
        ('Luisa Martínez Ruiz'),
        ('Javier García Fernández'),
        ('Elena Sánchez Castro');

    INSERT INTO glasses (brand, mount_type, mount_color, crystal_color, price, right_lens_graduation, left_lens_graduation, supplier_id)
    VALUES
        ('Ray-Ban', 'metal', 'gold', 'green G-15', 145.00, -1.50, -1.25, 1),
        ('Oakley', 'plastic', 'black mate', 'prizm sapphire', 160.00, +0.00, +0.00, 2),
        ('Silhouette', 'floating', 'silver', 'transparent', 218.99, -2.25, -2.50, 3),
        ('Prada', 'metal', 'pink gold', 'transparent', 240.00, -3.00, -3.25, 2),
        ('Vogue', 'metal', 'copper', 'pastel pink', 85.00, +0.50, +0.50, 3),
        ('Carrera', 'plastic', 'carey', 'brown', 95.00, +1.25, +1.00, 1),
        ('Persol', 'plastic', 'cobalt blue', 'gradient gray', 184.90, -0.75, - 0.75, 1),
        ('Gucci', 'plastic', 'glossy black', 'transparent', 290.00, +2.00, +2.00, 1),
        ('Lindberg', 'floating', 'titanium gray', 'transparent', 450.00, -1.00, -1.50, 3),
        ('Arnette', 'plastic', 'blue/withe', 'dark gray', 75.00, -1.00, -0.75, 2 );

    INSERT INTO  sales (sale_date, customer_id, employee_id, glass_id, quantity, total_price)
    VALUES
        ('2025-12-15', 1, 1, 1, 1, 145.00),
        ('2025-12-15', 2, 2, 2, 1, 160.00),
        ('2025-12-12', 3,1, 3, 1, 218.99),
        ('2025-12-12', 4, 2, 4, 1, 240.00),
        ('2025-12-12', 5, 3, 5, 2, 170.00),
        ('2025-12-11', 6, 2, 6, 1, 95.00),
        ('2025-12-11', 7, 3, 7, 1, 184.90),
        ('2025-12-11', 8, 1, 8, 1, 290.00),
        ('2025-12-11', 9, 1, 9, 1, 450.00),
        ('2025-12-11', 10, 2, 10, 2, 150.00),
        ('2024-04-29', 1, 3, 6, 1, 95.00),
        ('2023-10-05', 1, 1, 5, 1, 170.00),
        ('2022-11-20', 1, 1, 9, 1, 450.00),
        ('2021-02-05', 1, 2, 3, 1, 218.99);