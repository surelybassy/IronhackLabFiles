#Write the SQL queries to answer the following questions:
#Select the first name, last name, and email address of all the customers who have rented a movie.

SELECT first_name, last_name, email FROM rental r
JOIN customer c ON r.customer_id = c.customer_id;

#What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).

SELECT customer_id, CONCAT(c.first_name, " ", c.last_name), AVG(amount)
FROM payment p
JOIN customer c USING(customer_id)
GROUP BY customer_id;

#Select the name and email address of all the customers who have rented the "Action" movies.
#Write the query using multiple join statements

SELECT CONCAT(c.first_name, " ", c.last_name), c.email FROM customer c
JOIN rental USING(customer_id)
JOIN inventory i using (inventory_id)
JOIN film f USING(film_id)
JOIN film_category fc USING(film_id)
JOIN category ca USING (category_id)
WHERE ca.name = "Action"
GROUP BY customer_id;


#Write the query using sub queries with multiple WHERE clause and IN condition

SELECT CONCAT(c.first_name, " ", c.last_name), c.email FROM customer c
WHERE customer_id in
(SELECT customer_id from rental
JOIN inventory i using (inventory_id)
JOIN film f USING(film_id)
JOIN film_category fc USING(film_id)
JOIN category ca USING (category_id)
WHERE ca.name = "Action");


#Verify if the above two queries produce the same results or not

# Results are the same.

#Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. 
#If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, 
#then it should be high.


SELECT customer_id, amount,
CASE
when amount BETWEEN 0 and 1.99 then 'Low'
when amount BETWEEN 2 and 3.99 then 'Medium'
when amount > 4  then 'High'
else 'error'
end as 'Value'
FROM payment;

