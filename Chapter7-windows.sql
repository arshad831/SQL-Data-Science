##lag

SELECT * FROM classicmodels.payments
order by paymentDate
;


SELECT checkNumber, amount,paymentDate,
  LAG(amount) OVER(ORDER BY paymentDate) as previous_amount_value
  
  FROM classicmodels.payments;

##lead
SELECT checkNumber, amount,paymentDate,
  lead(amount) OVER(ORDER BY paymentDate) as next_amount_value
FROM classicmodels.payments;


SELECT buyPrice, productName,  
(rank () OVER ( ORDER BY buyPrice desc)  ) as rank_1
        FROM classicmodels.products;
        
        SELECT buyPrice, productName,  
(dense_rank () OVER ( ORDER BY buyPrice desc)  ) as rank_1
        FROM classicmodels.products;
        
        
        
        
        
        SELECT productName,productLine,
 ROW_NUMBER() OVER (ORDER BY sum(buyPrice) desc) as row_num
        FROM classicmodels.products
  group  BY productLine;
  
  
  use hr;
  
  #2nd highest salary
  
select * from (
 select t.*, dense_rank() over (order by salary desc) rnk from employees t
) a 
where rnk = 2;
