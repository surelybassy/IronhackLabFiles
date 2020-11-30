#Write a query to display for each store its store ID, city, and country.

SELECT * FROM store;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;

SELECT
	s.store_id, c.city_id, c.city, co.country
FROM
	store s
		JOIN
	address a ON s.address_id = a.address_id
		JOIN
	city c ON a.city_id = c.city_id
		JOIN
	country co ON c.country_id = co.country_id;

#Write a query to display how much business, in dollars, each store brought in.

SELECT * FROM payment;
SELECT * FROM staff;
SELECT * FROM store;

SELECT
	s.store_id, SUM(p.amount)
FROM
	payment p
		JOIN
	staff st ON p.staff_id = st.staff_id
		JOIN
	store s ON st.store_id = s.store_id
GROUP BY st.store_id;

#What is the average running time of films by category?

SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

SELECT
	c.name, fc.category_id, ROUND(AVG(f.length),2) as AverageLength
FROM
	film f
		JOIN
	film_category fc ON f.film_id = fc.film_id
		JOIN
	category c ON fc.category_id = c.category_id
GROUP BY fc.category_id;

#Which film categories are longest?

SELECT
	c.name, fc.category_id, ROUND(AVG(f.length),2) as AverageLength
FROM
	film f
		JOIN
	film_category fc ON f.film_id = fc.film_id
		JOIN
	category c ON fc.category_id = c.category_id
GROUP BY fc.category_id
ORDER BY AverageLength DESC;

#Display the most frequently rented movies in descending order.

SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film;

SELECT r.rental_id, r.inventory_id, f.title
FROM rental r
		JOIN
	inventory i ON r.inventory_id = i.inventory_id
		JOIN
	film f ON i.film_id = f.film_id
ORDER BY r.rental_id;


SELECT f.title, COUNT(f.title) as Count
FROM rental r
		JOIN
	inventory i ON r.inventory_id = i.inventory_id
		JOIN
	film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY Count DESC;

#List the top five genres in gross revenue in descending order.

SELECT * FROM payment; #rental_id, amount
SELECT * FROM rental; #rental_id, inventory_id
SELECT * FROM inventory; # inventory_id, film_id
SELECT * FROM film_category;
SELECT * FROM film;

SELECT category_id, SUM(amount) as SUM
FROM payment
JOIN (rental JOIN(inventory JOIN (film_category JOIN category USING (category_id)) USING (film_id)) USING (inventory_id)) using (rental_id)
GROUP BY category_id
ORDER BY SUM DESC
LIMIT 5;

#Is "Academy Dinosaur" available for rent from Store 1?

SELECT * FROM inventory;
SELECT * FROM film;

SELECT f.title, i.inventory_id
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE Title = 'ACADEMY DINOSAUR' and i.store_id = 1;
