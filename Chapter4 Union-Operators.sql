/* --------------------------------------- Chapter 4:  -----------------------------------------------------
1. AGGREGATION - SUM, MIN, MAX, AVG, COUNT
2. Comparison Operators - =, !=,<>, >,<,>=,<=
3. LOGICAL  - AND, OR, NOT, IN, NOT IN, BETWEEN, EXISTS, ANY, ALL, SOME
4. STRING - CONCAT, UPPER, LOWER, LEFT, RIGHT, LCASE,LOCATE, MATCH, MID, LENGTH, REPLACE, REVERSE, SUBSTRING, SUBSTR, SUBSTRING_INDEX(), TRIM, LTRIM, RTRIM
*/

-- ------------------------------------------------ 1. AGGREGATION - SUM, MIN, MAX, AVG, COUNT -----------------------------------------
use classicmodels;
SHOW TABLES;
SELECT max(amount)  FROM payments;
SELECT min(amount)  FROM payments;

SELECT sum(amount),
max(amount),
min(amount),
AVG(amount),COUNT(amount)  FROM payments;


Use Animal_shelter;

select Adopter_email, adoption_date , count(*) as  No_of_adoption

from adoptions
where Adopter_email not like '%gmail%'
group by Adopter_email
having count(*)  >1 and  year(adoption_date)  = 2019
order by No_of_adoption desc; 


-- ----------------------------------- 2.  Comparison Operators - =, !=,<>, >,<,>=,<= ------------------------

SELECT * FROM payments
WHERE customerNumber=114;

SELECT AVG(amount) FROM payments;

SELECT * FROM payments 
group by customerNumber
having amount > avg(amount);

SELECT * FROM payments 
group by customerNumber
having amount < avg(amount);


SELECT * FROM employees
where JobTitle = 'Sales Rep';

SELECT * FROM employees
where JobTitle != 'Sales Rep';

SELECT * FROM employees
where JobTitle <> 'Sales Rep';

SELECT * FROM orderdetails;

SELECT * FROM orderdetails
GROUP BY orderNumber
having quantityOrdered >=35
ORDER BY quantityOrdered;



SELECT * FROM orderdetails
where orderNumber > 10152
GROUP BY orderNumber
having quantityOrdered >=35
ORDER BY quantityOrdered;


SELECT * FROM orderdetails
where orderNumber > 10152
GROUP BY orderNumber
having quantityOrdered <=35
ORDER BY quantityOrdered;


----- Union -----

SELECT * FROM orderdetails
where orderNumber > 10152 
union 
SELECT * FROM orderdetails
where quantityOrdered <=35;




-- ----------------------------------- 3. LOGICAL  - AND, OR, NOT, IN, NOT IN, BETWEEN, EXISTS, ANY, ALL, SOME ------------------------
SELECT * FROM orderdetails
where orderNumber > 10152 and quantityOrdered <=35;

SELECT * FROM orderdetails
where quantityOrdered =35 or quantityOrdered =30;

SELECT * FROM orderdetails
where (quantityOrdered =35 or quantityOrdered =30) and orderNumber=10100 ;

SELECT * FROM offices
where country in ('USA','UK');

SELECT * FROM offices
where country not in ('USA','UK');

SELECT * FROM orderdetails
WHERE quantityOrdered BETWEEN 30 AND 35
ORDER BY quantityOrdered;

/*
The EXISTS operator is used to test for the existence of any record in a subquery.
The EXISTS operator returns TRUE if the subquery returns one or more records.

Syntax:
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition); 
*/

SELECT DISTINCT orderNumber FROM orderdetails
  WHERE EXISTS (SELECT * FROM orderdetails
                WHERE quantityOrdered BETWEEN 30 AND 35);
                
SELECT DISTINCT orderNumber FROM orderdetails
  WHERE NOT EXISTS (SELECT * FROM orderdetails
                WHERE quantityOrdered BETWEEN 30 AND 35);

/*
The MySQL ANY and ALL Operators

The ANY and ALL operators allow you to perform a comparison between a single column value and a range of other values.

The ANY operator:

    returns a boolean value as a result
    returns TRUE if ANY of the subquery values meet the condition

ANY means that the condition will be true if the operation is true for any of the values in the range.

ANY Syntax:
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition); 
*/

SELECT * FROM orderdetails
WHERE orderNumber = ANY
  (SELECT orderNumber
  FROM OrderDetails
  WHERE quantityOrdered = 10); 
  
  
  
  /*
  The ALL operator:  returns a boolean value as a result
    returns TRUE if ALL of the subquery values meet the condition is used with SELECT, WHERE and HAVING statements

ALL means that the condition will be true only if the operation is true for all values in the range. 

* ALL Syntax With SELECT
SELECT ALL column_name(s)
FROM table_name
WHERE condition;


* ALL Syntax With WHERE or HAVING
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition); 
  */
  
SELECT ALL orderNumber
FROM OrderDetails
WHERE TRUE;
  
SELECT * FROM orderdetails
WHERE orderNumber = ALL
  (SELECT orderNumber
  FROM OrderDetails
  WHERE quantityOrdered = 30); 
  
  /* The above SQL statement lists the all data if ALL the records in the OrderDetails table has Quantity equal to 30. 
  This will of course return FALSE because the Quantity column has many different values (not only the value of 30):
  */
  
  
  /* SOME must match at least one row in the subquery and must be preceded by comparison operators.
  The SOME and ANY comparison conditions are similar to each other and are completely interchangeable.*/
  SELECT * FROM orderdetails
WHERE orderNumber = SOME
  (SELECT orderNumber
  FROM OrderDetails
  WHERE quantityOrdered = 30); 
-- ------------------------------------------------------------------------------------------------------------------------------------------------
  
  -- ------------------------------------------------------------ 4. STRING - OPERATIONS ----------------------------------------------
 -- CONCAT, UPPER, LOWER, LEFT, RIGHT, LCASE,LOCATE, MATCH, MID, LENGTH, REPLACE, REVERSE, SUBSTRING, SUBSTR, SUBSTRING_INDEX(), TRIM, LTRIM, RTRIM
-- Find out the lengths of the first names
Use sakila;
SELECT first_name, LENGTH(first_name)
FROM actor ;

-- Join the first name and the last name also find the total length of the full name
-- The CONCAT() function adds two or more expressions together.
SELECT first_name, last_name, CONCAT(last_name,' ',first_name) full_name, LENGTH(CONCAT(last_name,',
',first_name)) len_full_name
FROM actor ;

-- Join the first name and the last name also find the total length of the full name and arrange according to full name length
SELECT first_name, last_name, CONCAT(last_name,', ',first_name) full_name, LENGTH(CONCAT(last_name,',
',first_name)) len_full_name
FROM actor
ORDER BY LENGTH(CONCAT(last_name,', ',first_name)) DESC;

-- Join the first name and the last name also convert in to upper and lower case
-- The LOWER() function converts a string to lower-case.
-- The LCASE() function is equal to the LOWER() function.
-- The UPPER() function converts a string to upper-case.
-- This function is equal to the UCASE() function.

SELECT first_name, last_name, LOWER(CONCAT(last_name,', ',first_name)) lower_name,
UPPER(CONCAT(last_name,', ',first_name)) upper_name
FROM actor ;

SELECT first_name, last_name, LCASE(CONCAT(last_name,', ',first_name))lower_name,
UCASE(CONCAT(last_name,', ',first_name)) upper_name
FROM actor ;

-- The LEFT() function extracts a number of characters from a string (starting from left)
-- The RIGHT() function extracts a number of characters from a string (starting from right).
SELECT first_name, LEFT(first_name,3), RIGHT(first_name,5)
FROM actor ;

-- The SUBSTR() and MID() functions equals to the SUBSTRING() function. 
-- The SUBSTR() function extracts a substring from a string (starting at any position).

SELECT first_name, SUBSTR(first_name,1,5), SUBSTRING(first_name,1,5), MID(first_name,1,5)
FROM actor ;

/* The SUBSTRING_INDEX() function returns a substring of a string before a specified number of delimiter occurs.

Syntax
SUBSTRING_INDEX(string, delimiter, number)

string 	-- The original string
delimiter -- The delimiter to search for
number -- The number of times to search for the delimiter. Can be both a positive or negative number. 
If it is a positive number, this function returns all to the left of the delimiter. 
If it is a negative number, this function returns all to the right of the delimiter.

*/
SELECT *,
SUBSTRING_INDEX(title, ' ', 1) as first_half,
SUBSTRING_INDEX(title, ' ', -1) as second_half
FROM sakila.film_text; -- SUBSTRING_INDEX(str,delim,count)

-- Write a Query to Capitalize only the first letter of the First Name
select concat(left(first_name,1),lcase(substr(first_name,2))) `first name`
from actor;

/*
 TRIM() function in MySQL is used to clean up data. It is also used to remove the unwanted leading and trailing characters in a string.
 
 Syntax :
TRIM([{BOTH | LEADING | TRAILING} [removed_str] FROM] str)

Parameter : This method accepts three-parameter as mentioned above and described below :

    BOTH | LEADING | TRAILING : LEADING, TRAILING, or BOTH option to explicitly instruct the TRIM() function to 
    remove leading, trailing, or both leading and trailing unwanted characters from a string .
    By default, the TRIM() function uses the BOTH option.
    removed_str : It is a string which we want to remove. If not given, spaces will be removed.
    str : It identifies the string from which we want to remove removed_str.

Returns : It returns a string that has unwanted characters removed.
*/
SELECT first_name, TRIM(first_name)
FROM actor ;

SELECT first_name, last_name
FROM actor
WHERE TRIM(first_name) = 'GRACE';


SELECT description, TRIM(LEADING 'A ' from description)
FROM film_text ;
SELECT description, TRIM(TRAILING 'A ' from description)
FROM film_text ;
SELECT description, TRIM(BOTH 'A ' from description)
FROM film_text ;


-- LTRIM() is used to remove the leading spaces (spaces on the left side) from a string.
-- RTRIM() is used to remove the trailing spaces (spaces on the right side) from a string.

SELECT TRIM(' SQL Tutorial ') AS TrimmedString;
SELECT LTRIM('  SQL Tutorial ') AS TrimmedString, length(LTRIM(' SQL Tutorial ')),length('  SQL
Tutorial ');
SELECT RTRIM(' SQL Tutorial  ') AS TrimmedString, length(RTRIM(' SQL Tutorial  ')),length(' SQL
Tutorial  ');

/*
LOCATE() function in MySQL is used for finding the location of a substring in a string. 
It will return the location of the first occurrence of the substring in the string. 
If the substring is not present in the string then it will return 0. 
When searching for the location of a substring in a string it does not perform a case-sensitive search.

Syntax :
LOCATE(substring, string, start)

Parameters : This method accepts three parameter.

    substring – The string whose position is to be retrieved.
    string – The string within which the position of the substring is to be retrieved.
    start – The starting position for the search. It is optional .Position 1 is default.
    */
SELECT first_name, LOCATE('LOPE', first_name)
FROM actor;

SELECT first_name, LOCATE('E', first_name,3)
FROM actor;


/*
The REPLACE() function replaces all occurrences of a substring within a string, with a new substring.
 
Syntax:
 REPLACE(string, from_string, new_string)

string 	-- The original string
from_string -- The substring to be replaced
new_string 	-- The new replacement substring
*/

SELECT REPLACE("SQL Tutorial", "SQL", "HTML");
SELECT REPLACE("XYZ FGH XYZ", "X", "M");


/*
The REVERSE() function reverses a string and returns the result.
Syntax
REVERSE(string)
*/
SELECT REVERSE("SQL Tutorial");

