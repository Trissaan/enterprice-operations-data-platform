--SUPPLIERS
INSERT INTO suppliers (supplier_name, supplier_category, supplier_status, contact_email, country, created_at)
SELECT
'Supplier_' || g,
(ARRAY['Electronics','Food','Industrial'])[floor(random()*3)+1],
'active',
'supplier'||g||'@mail.com',
(ARRAY['USA','China','Germany','Australia'])[floor(random()*4)+1],
NOW() - (random()*1000 || ' days')::interval
FROM generate_series(1,50) g;

-- WAREHOUSES
INSERT INTO warehouses (warehouse_name, city, state, capacity, warehouse_status, created_at)
SELECT
'Warehouse_'||g,
(ARRAY['Melbourne','Sydney','Brisbane','Perth'])[floor(random()*4)+1],
(ARRAY['VIC','NSW','QLD','WA'])[floor(random()*4)+1],
floor(random()*10000+2000),
'active',
NOW() - (random()*1000 || ' days')::interval
FROM generate_series(1,5) g;

--CUSTOMERS
insert into customers (first_name , last_name, email, phone_number, customer_segment, status, risk_flag, created_at, updated_at)
select 
'first' || g,
'last'||g,
'customer'||g||'@mail.com',
'040000'||g,
(array['retail', 'corporate', 'vip'])[floor(random()*3+1)],
'active', 
random()<0.05,
now() - (random()*800 ||'days')::interval,
now()
from generate_series(1,1000) g;

--PRODUCTS
INSERT INTO products (product_name,sku_code,brand,category,subcategory,supplier_id,unit_cost,created_at)
SELECT
'Product_'||g,
'SKU'||g,
(ARRAY['BrandA','BrandB','BrandC'])[floor(random()*3)+1],
(ARRAY['Electronics','Food','Home'])[floor(random()*3)+1],
(ARRAY['Type1','Type2','Type3'])[floor(random()*3)+1],
floor(random()*50+1),
round((random()*100+10)::numeric,2),
NOW() - (random()*500 || ' days')::interval
FROM generate_series(1,500) g;

--INVENTORY
INSERT INTO inventory (product_id,warehouse_id,stock_quantity,reorder_lvl,inventory_status,last_stock_update_at)
SELECT
floor(random()*500+1),
floor(random()*5+1),
floor(random()*500+20),
floor(random()*50+10),
'in_stock',
NOW() - (random()*30 || ' days')::interval
FROM generate_series(1,1500);

--ORDERS
INSERT INTO orders (customer_id,warehouse_id,order_status,order_created_at,order_confirmed_at,order_total,shipping_fee,tax_amount,discount_amount)
SELECT
floor(random()*1000+1),
floor(random()*5+1),
(ARRAY['pending','confirmed','shipped','delivered'])[floor(random()*4)+1],
NOW() - (random()*180 || ' days')::interval,
NOW() - (random()*170 || ' days')::interval,
round((random()*400+20)::numeric,2),
round((random()*20)::numeric,2),
round((random()*40)::numeric,2),
round((random()*10)::numeric,2)
FROM generate_series(1,3000);

--ORDER_ITEMS
INSERT INTO order_items (order_id,product_id,quantity,unit_price,discount_amount,line_total)
SELECT
floor(random()*3000+1),
floor(random()*500+1),
floor(random()*5+1),
round((random()*100+10)::numeric,2),
round((random()*5)::numeric,2),
round((random()*120)::numeric,2)
FROM generate_series(1,9000);

--PAYMENTS
INSERT INTO payments (order_id,payment_amount,currency,payment_status,processing_fee,payment_attempted_at,payment_confirmed_at)
SELECT
floor(random()*3000+1),
round((random()*400+20)::numeric,2),
'AUD',
(ARRAY['paid','failed','pending'])[floor(random()*3)+1],
round((random()*5)::numeric,2),
NOW() - (random()*150 || ' days')::interval,
NOW() - (random()*140 || ' days')::interval
FROM generate_series(1,2500);

--SHIPMENTS
INSERT INTO shipments (order_id,warehouse_id,shipment_status,package_weight,shipment_cost,delivery_days,shipped_at,delivered_at)
SELECT
floor(random()*3000+1),
floor(random()*5+1),
(ARRAY['processing','in_transit','delivered'])[floor(random()*3)+1],
round((random()*5+1)::numeric,2),
round((random()*20+5)::numeric,2),
floor(random()*10+1),
NOW() - (random()*100 || ' days')::interval,
NOW() - (random()*90 || ' days')::interval
FROM generate_series(1,2500);

--RETURNS
INSERT INTO returns (order_item_id, return_amount, restocking_fee, return_status, return_requested_at, return_processed_at)
SELECT
floor(random()*9000 + 1)::int,
round((random()*120 + 10)::numeric,2),
round((random()*15)::numeric,2),
(ARRAY['requested','approved','rejected'])[floor(random()*3)+1],
NOW() - (random()*60 || ' days')::interval,
NOW() - (random()*55 || ' days')::interval
FROM generate_series(1,400);