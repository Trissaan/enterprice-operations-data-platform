--Orders per customer
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

--Top selling product
select  
	p.product_name,
	sum(oi.quantity) as total_sold
from order_items oi 
join products p on oi.product_id = p.product_id
group by p.product_name 
order by total_sold desc
limit 10;

--revenue per month
SELECT
    DATE_TRUNC('month', order_created_at) AS month,
    SUM(order_total) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

--Return Rate per Product
SELECT
    p.product_name,
    COUNT(r.return_id) AS returns
FROM returns r
JOIN order_items oi ON r.order_item_id = oi.order_item_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY returns DESC
LIMIT 10;

-- inventory risk detection
SELECT
    p.product_name,
    i.stock_quantity,
    i.reorder_lvl
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.stock_quantity < i.reorder_lvl
ORDER BY i.stock_quantity;

--warehose load
SELECT
    w.warehouse_name,
    w.state,
    SUM(i.stock_quantity) AS total_stock
FROM inventory i
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_name, w.state
ORDER BY total_stock DESC;