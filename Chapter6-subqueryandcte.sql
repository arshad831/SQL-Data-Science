
#sub query


Use sakila;

SELECT MIN(salary) FROM employees;


SELECT 	first_name, salary, department_id
FROM 	employees
WHERE 	salary = min(salary)
              

    
SELECT 	first_name, salary, department_id
FROM 	employees
WHERE 
	salary = (SELECT min(salary)
			  FROM employees);
    
    
    #subquery - the salesrep who has done the more sales - performance analysis 
    
    
    use classicmodels;
    
    SELECT a.*,b.salesRepEmployeeNumber FROM classicmodels.payments a
left join classicmodels.customers b
on a.customerNumber = b.customerNumber


              
select salesRepEmployeeNumber, sum(amount) as salesrep_amount from 
(
SELECT a.*,b.salesRepEmployeeNumber FROM classicmodels.payments a
left join classicmodels.customers b
on a.customerNumber = b.customerNumber
) a 
group by salesRepEmployeeNumber 
order by salesrep_amount desc
;

#with cte

with cte as (
SELECT a.*,b.salesRepEmployeeNumber FROM classicmodels.payments a
left join classicmodels.customers b
on a.customerNumber = b.customerNumber
)  

select salesRepEmployeeNumber, sum(amount) as salesrep_amount from cte
group by salesRepEmployeeNumber 
order by salesrep_amount desc;
