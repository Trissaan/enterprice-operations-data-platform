CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    sku_code VARCHAR(100) UNIQUE NOT NULL,
    supplier_id INT REFERENCES suppliers(supplier_id),
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    brand VARCHAR(100),
    unit_cost DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);