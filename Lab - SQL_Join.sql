#List number of films per category.

SELECT * FROM film;
SELECT * FROM film_category;

SELECT f.title, c.category_id as CategoryID
FROM film f
JOIN film_category c
ON f.film_id = c.film_id
ORDER BY CategoryID ASC;

SELECT c.category_id, COUNT(c.category_id) as count
FROM film f
LEFT JOIN film_category c
ON f.film_id = c.film_id
GROUP BY c.category_id
ORDER BY c.category_id ASC;

#Display the first and last names, as well as the address, of each staff member.

SELECT * FROM staff;
SELECT * FROM address;

SELECT s.first_name as FirstName, s.last_name as LastName, a.address as Address
FROM staff s
JOIN address a
ON s.address_id = a.address_id
ORDER BY LastName DESC;

#Display the total amount rung up by each staff member in August of 2005.

SELECT * FROM payment 
WHERE payment_date between '2005-08-01 00:00:00' and '2005-08-31 23:59-59'
order by payment_date;

SELECT s.first_name, s.last_name, p.staff_id, SUM(p.amount)  FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE payment_date between '2005-08-01 00:00:00' and '2005-08-31 23:59-59'
GROUP BY staff_id;


#List each film and the number of actors who are listed for that film.

SELECT * FROM film;
SELECT * FROM film_actor;

SELECT f.title, fa.film_id, count(fa.actor_id) as ActorCount
FROM film_actor fa
LEFT JOIN film f
ON fa.film_id = f.film_id
GROUP BY fa.film_id
ORDER BY ActorCount DESC;

#Using the tables payment and customer and the JOIN command, list the total paid by each customer. 

SELECT * FROM payment;
SELECT * FROM customer;

SELECT p.customer_id, c.first_name, c.last_name, SUM(p.amount) as Total
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name;

