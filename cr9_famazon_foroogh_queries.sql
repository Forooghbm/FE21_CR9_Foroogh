1.How many customers the last name beginning with "m" bought in Famazon?
SELECT COUNT(last_name) FROM customers WHERE first_name LIKE "M%";

2.What is the vender name of company ID 26? 
SELECT vender_name FROM vender WHERE fk_companies_id = 26;

3.Has someone paid with Visa?
SELECT visa FROM `sale_transaction`;

4. which product is sold by esprit company
SELECT product_name, company_name
from `products`
LEFT JOIN `companies` on fk_companies_id = company_id 
where company_name = “esprit”;

5. What is the name of the customer who ordered from Germany?
select first_name, last_name, country_customer
from `customers`
right Join `customer_location` on fk_user_id = user_id 
where country_customer = “Germany”;

Which company has the most expensive order and how much is it?
select product_name, product_price, company_name 
from `products` 
Left JOIN `companies` on fk_companies_id = company_id 
WHERE product_price = ( SELECT MAX(product_price) FROM products );


