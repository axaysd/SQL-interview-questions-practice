/*
Q:
Nielsen is a global measurement and data analytics company that provides the most complete and trusted view available of consumers and markets worldwide. Nielsen's databases contain information on hundreds of thousands of products, customers, and buying behaviors.

You're given a table called customers with the following columns:

customer_id (integer): An unique identifier for each customer.
customer_name (string): The name of the customer.
products_bought (integer): The number of products bought by the customer in the last year.
last_survey_date (date): The date the customer was last surveyed.
The company wants to regularly survey a subset of their customers to gather market insights, but they want to ensure a diverse set of opinions. Therefore, they've decided to select every 3rd customer based on their row index in the database.

Write an SQL query that returns the customer_id and customer_name of every 3rd customer based on their row index in the customers table.*/

-- My solution:

WITH customer_rows AS (
  SELECT 
    ROW_NUMBER() OVER (
      ORDER BY 
        customer_id
    ) AS row_num, 
    customer_id, 
    customer_name 
  FROM 
    customers
) 
SELECT 
  customer_id, 
  customer_name 
FROM 
  customer_rows 
WHERE 
  row_num % 3 = 0;
