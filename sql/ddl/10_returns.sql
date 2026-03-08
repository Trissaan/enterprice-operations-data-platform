CREATE TABLE returns (
    return_id SERIAL PRIMARY KEY,
    order_item_id INT REFERENCES order_items(order_item_id),
    return_amount DECIMAL(12,2),
    restocking_fee DECIMAL(10,2),
    return_status VARCHAR(50),
    return_requested_at TIMESTAMP,
    return_processed_at TIMESTAMP
);