CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    shipment_cost DECIMAL(10,2),
    package_weight DECIMAL(10,2),
    delivery_days INT,
    shipment_status VARCHAR(50),
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    updated_at TIMESTAMP
);