--Question 1:
--List all customers who live in Texas (use JOINs)
--Answer:

SELECT customer_id, address.district, customer.address_id
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--Question 2:
--Get all payments above $6.99 with the Customer's Full Name 
--Answer:
SELECT customer.customer_id, first_name, last_name, amount
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--Question 3:
--Show all customers names who have made payments over $175(use subqueries) 
--Answer:
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id 
	FROM payment
	WHERE amount > 175
);

--Question 4:
--List all customers that live in Nepal (use the city table)
--Answer:
SELECT address_id, address 
FROM address
WHERE city_id IN (
	SELECT city_id
	FROM city
	WHERE country_id IN (
		SELECT country_id
		FROM country
		WHERE country = 'Nepal'
));

--Question 5:
--Which staff member had the most transactions? 
--Answer:
SELECT DISTINCT staff.staff_id, amount, COUNT(payment_id)
FROM payment
LEFT JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY amount;

--Question 6:
--How many movies of each rating are there? 
--Answer:


--Question 7:
--Show all customers who have made a single payment above $6.99 (Use Subqueries)
--Answer:



