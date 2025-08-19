-- Create the database
CREATE DATABASE ABC_DATA;
USE ABC_DATA;

-- 1. Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- 3. Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Create order_items table
CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data into customers
INSERT INTO customers (customer_id, first_name, last_name, email)
VALUES 
    (1, 'Joe', 'Doe', 'johndoe@email.com'),
    (2, 'Jane', 'Smith', 'janesmith@email.com'),
    (3, 'Robert', 'Johnson', 'robertj@email.com');

-- Insert sample data into products
INSERT INTO products (product_id, product_name, price)
VALUES 
    (1, 'Product A', 10.00),
    (2, 'Product B', 15.50),
    (3, 'Product C', 8.75),
    (4, 'Product D', 22.99);

-- Insert sample data into orders
INSERT INTO orders (order_id, customer_id, order_date)
VALUES 
    (1, 1, '2023-05-01'),
    (2, 2, '2023-05-02'),
    (3, 1, '2023-05-03'),
    (4, 3, '2023-05-04');

-- Insert sample data into order_items
INSERT INTO order_items (order_id, product_id, quantity)
VALUES 
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (3, 4, 1),
    (3, 1, 1),
    (4, 2, 2),
    (4, 3, 1);