CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_amount DECIMAL(12,2),
    currency VARCHAR(10),
    processing_fee DECIMAL(10,2),
    payment_status VARCHAR(50),
    payment_attempted_at TIMESTAMP,
    payment_confirmed_at TIMESTAMP
);