/*Q:
Target is a leading retail company offering a diverse range of products from electronics and clothing to groceries and books. As part of its marketing strategy, Target provides discounts on certain types of items to enhance sales and engage customers. Here are the specifics of the discounting strategy:

Electronic items are discounted by 10%.
Clothing items receive a 20% discount.
Groceries are cheaper by 5%.
Books come with a 15% discount.
You're given a products table with the following columns:

name (string): The name of the item.
type (string): Represents the category or type of the item. This can be 'Electronic', 'Clothing', 'Grocery', 'Book', etc.
price (float): Denotes the original selling price of the item.
Write a SQL query to generate a discounted product catalog that displays the name, type, and discounted_price for each item. Round the discounted price to the nearest cent.*/

-- My solution:
SELECT name, type,
CASE
    WHEN type = 'Electronic' THEN price-(0.10*price)
    WHEN type = 'Clothing' THEN price-(0.20*price)
    WHEN type = 'Grocery' THEN price-(0.05*price)
    WHEN type = 'Book' THEN price-(0.15*price)
    ELSE price
END AS discounted_price
FROM products;
