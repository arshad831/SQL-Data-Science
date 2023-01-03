SELECT * FROM sakila.customer;

SELECT * FROM sakila.address a
WHERE a.district = 'Buenos Aires' ;
-- Find the first name, last name and address of a customers who reside in 'Buenos Aires' district

use sakila;


select a.first_name , a.last_name , b.address , b.district
from customer a
inner join address b
on a.address_id = b.address_id
where b.district = 'Buenos Aires' ;

#union


    
-- Combine rows with UNION
use sakila;
SELECT * FROM sakila.actor;


SELECT * FROM sakila.address;

SELECT 'actor' as table_name , DATE(last_update) as last_updated_date FROM actor
UNION 
SELECT 'address' , DATE(last_update) as last_updated_date  FROM address ;

select * from orders;

# aggregate
use classicmodels;

SELECT     status , sum(*) as count
FROM     orders
GROUP BY status;

-- get the total amount of all orders by status, you join the orders table with the orderdetails table and 
-- use the SUM function to calculate the total amount:

SELECT 
    a.status,     SUM(b.quantityOrdered * b.priceEach) AS amount
FROM    orders a
INNER JOIN orderdetails b
    on a.orderNumber = b.orderNumber
GROUP BY     status;
    
    
     -- the total sales of the years after 2003 for shipped status of the order

SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    year
HAVING 
    year > 2003;
    
    
    -- find customer Number, customerName,orderDate,requiredDate,shippedDate,checkNumber,paymentDate,amount where payment is recieved but item is not shipped

SELECT c.customerNumber, c.customerName,o.orderDate,o.requiredDate,o.shippedDate,
p.checkNumber,p.paymentDate,p.amount
from customers c
left join orders o
on c.customerNumber = o.customerNumber
left join payments p
on o.customerNumber = p.customerNumber
where o.shippeddate is null and p.checknumber is not null;


