/*Question from https://www.tryexponent.com/questions/3975/find-customer-lifetime-value

Find Customer Lifetime Value (LTV)

You are given the following tables:

attribution table:

session_id	marketing_channel	purchase_value
string	string	float
user_sessions table:

session_id	ad_click_timestamp	user_id
string	datetime	string
Find the customer lifetime value (LTV) for each user and order the results from most valuable customer to least valuable. Your output should contain the following columns: user_id, LTV

My answer: */

SELECT 
    usrsh.user_id AS user_id, 
    SUM(attr.purchase_value) AS LTV 
FROM 
    user_sessions usrsh
JOIN 
    attribution attr
ON 
    usrsh.session_id = attr.session_id
GROUP BY 
    usrsh.user_id
ORDER BY 
    LTV DESC;
