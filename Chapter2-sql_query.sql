select count(film_id) from sakila.film;

SELECT * FROM sakila.film;

--- using sql query----
select rating, count(title) as Numer_of_film
from  sakila.film
group by rating
order by Numer_of_film desc;

-- using all order of operation---
select rating, count(title) as Numer_of_film
from  sakila.film
#where rental rate = 0.99
group by rating
having count(*) > 200
order by Numer_of_film desc
limit 1
;

