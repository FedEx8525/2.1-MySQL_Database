CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS provinces;
CREATE TABLE provinces (
    province_id    INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(100)          NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    city_id     INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100)          NOT NULL,
    province_id INT                   NOT NULL,
    CONSTRAINT fk_cities_province_id
        FOREIGN KEY (province_id) REFERENCES provinces(province_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(60)           NOT NULL,
    surname     VARCHAR(60)           NOT NULL,
    address     VARCHAR(100)          NOT NULL,
    zip_code    VARCHAR(60)           NOT NULL,
    city_id     INT                   NOT NULL,
    telephone   VARCHAR(60)           NOT NULL,
    CONSTRAINT fk_customers_city_id
        FOREIGN KEY (city_id) REFERENCES cities(city_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60)           NOT NULL
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id   INT AUTO_INCREMENT               PRIMARY KEY,
    product_type ENUM('Drink', 'Hamburger', 'Pizza') NOT NULL,
    product_name VARCHAR(60)                         NOT NULL,
    description  TEXT                                    NULL,
    image_url    VARCHAR(255)                            NULL,
    price        DOUBLE                              NOT NULL,
    category_id  INT                                     NULL,
    CONSTRAINT fk_products_category_id
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    address  VARCHAR(100)          NOT NULL,
    zip_code VARCHAR(60)           NOT NULL,
    city_id  INT                   NOT NULL,
    CONSTRAINT fk_stores_city_id
        FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id  INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(60)             NOT NULL,
    surname      VARCHAR(60)             NOT NULL,
    nif          VARCHAR(60)             NOT NULL,
    telephone    VARCHAR(60)             NOT NULL,
    employee_job ENUM('Chef', 'Dealer')  NOT NULL,
    store_id     INT                     NOT NULL,
    CONSTRAINT fk_employees_store_id
        FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id           INT AUTO_INCREMENT      PRIMARY KEY,
    order_date_hour    DATETIME                   NOT NULL,
    order_type         ENUM('Delivery', 'Pickup') NOT NULL,
    total_price        DOUBLE                        NOT NULL,
    delivery_date_hour DATETIME                   NOT NULL,
    employee_id        INT                            NULL,
    store_id           INT                        NOT NULL,
    customer_id        INT                        NOT NULL,
    CONSTRAINT fk_orders_employee_id
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_orders_store_id
        FOREIGN KEY (store_id) REFERENCES stores(store_id),
    CONSTRAINT fk_orders_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS products_quantity;
CREATE TABLE products_quantity (
    order_id            INT                   NOT NULL,
    product_id          INT                   NOT NULL,
    product_quantity    INT                   NOT NULL,
    CONSTRAINT fk_order_product_quantity
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_product_product_quantity
        FOREIGN KEY (product_id) REFERENCES products(product_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SET FOREIGN_KEY_CHECKS = 1;
