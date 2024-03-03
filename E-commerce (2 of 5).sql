/*
Q:
Amazon is a large e-commerce platform where customers can order various items ranging from electronics to clothing.

You're provided with two tables, orders and items, with the following columns:

order_id	customer_id	order_date	item_id	order_quantity
integer	integer	date	integer	integer
item_id	item_category
integer	string
Write an SQL query that determines how many units were ordered from Amazon's e-commerce platform in the last week. Your output should have the following columns: item_category, total_units_ordered_last_7_days
*/

-- My solution:
SELECT item_category, SUM(order_quantity) AS total_units_ordered_last_7_days
FROM orders 
INNER JOIN items
ON orders.item_id = items.item_id
WHERE JULIANDAY(CURRENT_TIMESTAMP) - JULIANDAY(order_date) <= 7
GROUP BY item_category;
