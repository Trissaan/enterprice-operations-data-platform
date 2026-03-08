CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    product_id INT REFERENCES products(product_id),
    stock_quantity INT NOT NULL,
    reorder_lvl INT,
    inventory_status VARCHAR(50),
    last_stock_update_at TIMESTAMP
);