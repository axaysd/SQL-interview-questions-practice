/*Q:
Given the employee database with the schema shown below, write a query to fetch the top 3 earning employees, including their IDs, names and salaries.

employees                  
+---------------+---------+
| id            | int     |
| first_name    | varchar |
| last_name     | varchar |
| salary        | int     |
| department_id | int     |
+---------------+---------+
Your query should output a result in the following format:


id | first_name | last_name | salary 
----+------------+-----------+--------
int | varchar    | varchar   | int
*/

-- My solution:

SELECT id, first_name, last_name, salary FROM employees ORDER BY salary DESC LIMIT 3;
