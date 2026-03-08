CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    order_total DECIMAL(12,2),
    tax_amount DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    shipping_fee DECIMAL(12,2),
    order_status VARCHAR(50),
    order_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_confirmed_at TIMESTAMP,
    order_shipped_at TIMESTAMP,
    order_delivered_at TIMESTAMP,
    order_cancelled_at TIMESTAMP
);