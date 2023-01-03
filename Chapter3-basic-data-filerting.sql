use sakila;

select * from actor;


SELECT first_name, last_name
FROM actor
WHERE first_name = 'PENELOPE' ;


SELECT first_name, last_name
FROM actor
WHERE first_name <> 'PENELOPE' ;


SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id >5 and actor_id <20 ;


SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'penelope' and actor_id <20 ;


SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'penelope' or first_name = 'nick' ;


SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'penelope' or actor_id <20 or first_name = 'ed' ;


SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name IN ('penelope','nick','ed') ;


SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name NOT IN ('penelope','nick','ed') ;

SELECT actor_id
FROM actor
ORDER BY actor_id desc; -- order by in ascending order

SELECT First_name, last_name,actor_id
From actor
where (first_name= 'PENELOPE' OR first_name= 'JOHNNY') AND actor_id<100
ORDER BY first_name ASC;  -- order by in ascending order

SELECT First_name, last_name,actor_id
From actor
where (first_name= 'PENELOPE' OR first_name= 'JOHNNY') AND actor_id<100
ORDER BY first_name DESC;  -- order by in descending order

Select first_name,last_name,actor_id
From actor
where  actor_id !=5      -- for not equal threr are two option   !=  and <>
order by actor_id
limit 10;  



-- ----------------------------------------------------- 3. DISTINCT, COUNT --------------------------------------------------------
/*
The SELECT DISTINCT statement is used to return only distinct (different) values.
Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

The COUNT() function returns the number of records returned by a select query.

Note: NULL values are not counted.

*/
Use world;

SELECT * FROM city;

SELECT distinct CountryCode FROM city;

select count(CountryCode) FROM city;

SELECT COUNT(DISTINCT (CountryCode)) FROM city;

select count(CountryCode), COUNT(DISTINCT (CountryCode)) FROM city;


select count(*) from city; -- count all number of records or rows




-- ------------------------------------------------------- 5. LIKE, REGEXP, WILDCARDS --------------------------------------------------
/*
The LIKE operator is a logical operator that tests whether a string contains a specified pattern or not.

Here’s the syntax of the LIKE operator:

												expression LIKE pattern ESCAPE escape_character



In this syntax, if the expression matches the pattern, the LIKE operator returns 1. Otherwise, it returns 0.

MySQL provides two wildcard characters for constructing patterns: percentage % and underscore _ .

    1. The percentage ( % ) wildcard matches any string of zero or more characters.
    2. The underscore ( _ ) wildcard matches any single character.

For example, s% matches any string starts with the character s such as sun and six. 
The se_  matches any string starts with  se and is followed by any character such as see and sea.

When the pattern contains the wildcard character and you want to treat it as a regular character, you can use the ESCAPE clause.

Typically, you’ll use the LIKE operator in the WHERE clause of the SELECT , DELETE, and UPDATE statement.

*/
Use sakila;
Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'MA%';    -- starting with N


Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'PAR%';  





Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'Joh%';  

Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'Joh%y';  

Select first_name, Last_name, actor_id
from actor
where first_name LIKE '%y';  


Select first_name, Last_name, actor_id
from actor
where first_name LIKE '%ry';  -- ending with ry

Select first_name, Last_name, actor_id
from actor
where first_name LIKE '%AR%';  

Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'AR';

Select first_name, Last_name, actor_id
from actor
where first_name LIKE '_AR%';


Select first_name, Last_name, actor_id
from actor
where first_name LIKE '_D';

Select first_name, Last_name, actor_id
from actor
where first_name LIKE '_D%';

Select first_name, Last_name, actor_id
from actor
where first_name LIKE '_D%_M';


Select first_name, Last_name, actor_id
from actor
where first_name LIKE '__N%';



Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'J__N%Y';

Select first_name, Last_name, actor_id
from actor
where first_name LIKE 'J__N%';


Select first_name, Last_name, actor_id
from actor
where first_name LIKE '%V_R'; 

SELECT first_name FROM actor WHERE first_name REGEXP '^sa';

SELECT first_name FROM actor 

WHERE first_name LIKE 'SA%' ;