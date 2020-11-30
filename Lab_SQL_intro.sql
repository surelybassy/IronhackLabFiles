#Review the tables in the database.
SHOW tables ;

#Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT * FROM actor;
SELECT * FROM actor_info;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM customer;

#Select one column from a table. Get film titles.

SELECT title FROM film;

#Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking 
#you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.

SELECT language_id, COUNT(DISTINCT title) FROM film
GROUP BY language_id;


#Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company 
#have? Can you return a list of employee first names only?

SELECT * FROM store;
SELECT first_name as FirstName FROM staff;

#Bonus: How many unique days did customers rent movies in this dataset?


SELECT COUNT(DISTINCT (LEFT(rental_date, 10))) FROM rental;