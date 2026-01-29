CREATE DATABASE IF NOT EXISTS optics;
USE optics;

SET FOREIGN_KEY_CHECKS  = 0;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
    sale_id     INT AUTO_INCREMENT PRIMARY KEY,
    sale_date   DATE  NOT NULL,
    customer_id INT   NOT NULL,
    employee_id INT   NOT NULL,
    glass_id    INT   NOT NULL,
    quantity    INT   NOT NULL,
    total_price DOUBLE NOT NULL,
    CONSTRAINT fk_sale_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    CONSTRAINT fk_sale_employee_id
        FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    CONSTRAINT fk_sale_glass_id
        FOREIGN KEY (glass_id) REFERENCES glasses (glass_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
    customer_id              INT AUTO_INCREMENT PRIMARY KEY,
    customer_name            VARCHAR(60)  NOT NULL,
    customer_address         VARCHAR(60)  NOT NULL,
    customer_telephone       VARCHAR(60)  NOT NULL,
    customer_e_mail          VARCHAR(255) NOT NULL,
    customer_registration    DATE         NOT NULL,
    customer_who_recommended INT      ,
    CONSTRAINT customer_e_mail
        UNIQUE (customer_e_mail),
    CONSTRAINT fk_sale_customer_who_recommended_id
        FOREIGN KEY (customer_who_recommended) REFERENCES customers (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
    employee_id          INT AUTO_INCREMENT PRIMARY KEY,
    employee_name        VARCHAR(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers
(
    supplier_id          INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name        VARCHAR(60) NOT NULL,
    supplier_street      VARCHAR(60) NOT NULL,
    supplier_number      VARCHAR(10) NOT NULL,
    supplier_floor       VARCHAR(8) NOT NULL,
    supplier_door        VARCHAR(8) NOT NULL,
    supplier_city        VARCHAR(60) NOT NULL,
    supplier_zipcode     VARCHAR(15) NOT NULL,
    supplier_country     VARCHAR(60) NOT NULL,
    supplier_telephone   VARCHAR(15) NOT NULL,
    supplier_fax         VARCHAR(15)     NULL,
    supplier_nif         VARCHAR(60) NOT NULL,
    CONSTRAINT supplier_nif
        UNIQUE (supplier_nif)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS glasses;
CREATE TABLE glasses
(
    glass_id              INT AUTO_INCREMENT PRIMARY KEY,
    brand                 VARCHAR(60)                           NOT NULL,
    mount_type            ENUM ('floating', 'plastic', 'metal') NOT NULL,
    mount_color           VARCHAR(20)                           NOT NULL,
    crystal_color         VARCHAR(20)                           NOT NULL,
    price                 DOUBLE                                NOT NULL,
    right_lens_graduation DOUBLE                                NOT NULL,
    left_lens_graduation  DOUBLE                                NOT NULL,
    supplier_id           INT                                   NOT NULL,
    CONSTRAINT fk_sell_supplier_id
        FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
