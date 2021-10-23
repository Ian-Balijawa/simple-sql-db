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