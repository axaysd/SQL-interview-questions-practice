/*Q: 
E-commerce (1 of 5)EasySQLData Scientist
I've seen this questionFlag
and 5 other times
Amazon is a large e-commerce platform where customers can order various items ranging from electronics to clothing.

You're provided with two tables, orders and items, with the following columns:

order_id	customer_id	order_date	item_id	order_quantity
integer	integer	date	integer	integer
item_id	item_category
integer	string
Write a SQL query that determines how many units were ordered on Amazon yesterday. Output it under the total_units_ordered_yesterday*/

--My solution

SELECT SUM(order_quantity) AS total_units_ordered_yesterday
FROM orders
WHERE order_date = DATE('now', '-1 DAY')
