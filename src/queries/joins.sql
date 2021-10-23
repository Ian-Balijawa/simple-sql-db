
-- INNER JOINS
use sql_store;

SELECT order_id, first_name, last_name, o.customer_id 
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id;


SELECT * FROM order_items oi
JOIN products p 
	ON p.product_id = oi.product_id;

SELECT order_id, oi.product_id, quantity,oi.unit_price FROM order_items oi
JOIN products p 
	ON p.product_id = oi.product_id;

-- joining across multiple databases
SELECT order_id, oi.product_id, quantity,oi.unit_price FROM order_items oi
JOIN products p 
	ON p.product_id = oi.product_id;

-- self joining a table
use sql_hr;
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name as manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;

-- joining multiple tables
use sql_store;
SELECT o.order_id, o.order_date, c.first_name, c.last_name,os.name as `status` FROM orders o 
JOIN customers c 
ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_status_id;

use sql_invoicing;

select 
	p.date,
    p.invoice_id,
    p.amount,
    c.name as client,
    pm.name as payment
from payments p 
join clients c 
	on p.client_id = c.client_id
join payment_methods  pm
	on p.payment_method = pm.payment_method_id;

-- compound join condition
SELECT * from order_items oi
join order_item_notes oin
	on oi.order_id = oin.order_id
    and oi.product_id = oin.product_id;

-- implict join systax NOT RECOMMENDED
SELECT * 
from  orders o, customers c
where o.customer_id = c.customer_id;
    
-- OUTER JOINS LEFT OR RIGHT JOIN

SELECT 
	c.customer_id,
    c.first_name as name,
    o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id=o.customer_id
ORDER BY c.customer_id;
-- returns all records in the left table whether they satisfy the join condition or not
-- returns all customers whelther they have an order or not

SELECT 
	c.customer_id,
    c.first_name as name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id=o.customer_id
ORDER BY c.customer_id;
-- returns all records in the right table whether they satisify they join condition or not
-- returns all orders whether they were or were not made by any customers