
#sub query


Use hr;

    
    
SELECT 	first_name, salary, department_id
FROM 	employees
WHERE 
	salary = (SELECT MIN(salary)
			  FROM employees);
              
              
select salesRepEmployeeNumber, sum(amount) as salesrep_amount from (

SELECT a.*,b.salesRepEmployeeNumber FROM classicmodels.payments a
left join classicmodels.customers b
on a.customerNumber = b.customerNumber


) a 
group by salesRepEmployeeNumber 
;


#with cte

with cte as (
SELECT a.*,b.salesRepEmployeeNumber FROM classicmodels.payments a
left join classicmodels.customers b
on a.customerNumber = b.customerNumber
)  

select salesRepEmployeeNumber, sum(amount) as salesrep_amount from cte
group by salesRepEmployeeNumber 
