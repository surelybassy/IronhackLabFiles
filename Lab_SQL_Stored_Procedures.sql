drop procedure if exists customers_action;
delimiter //
create procedure customers_action ()
begin
	select first_name, last_name, email
	from customer
	join rental on customer.customer_id = rental.customer_id
	join inventory on rental.inventory_id = inventory.inventory_id
	join film on film.film_id = inventory.film_id
	join film_category on film_category.film_id = film.film_id
	join category on category.category_id = film_category.category_id
	where category.name = "Action"
	group by first_name, last_name, email;
end; 
// delimiter ; 

call customers_action();


# Now keep working on the previous stored procedure to make it more dynamic. Update the stored procedure
# in a such manner that it can take a string argument for the category name and return the results for all customers that rented 
# movie of that category/genre. For eg., it could be action, animation, children, classics, etc.

drop procedure if exists customers_category_input;
delimiter //
create procedure customers_category_input (IN param1 VARCHAR(30))
begin
	select first_name, last_name, email
	from customer
	join rental on customer.customer_id = rental.customer_id
	join inventory on rental.inventory_id = inventory.inventory_id
	join film on film.film_id = inventory.film_id
	join film_category on film_category.film_id = film.film_id
	join category on category.category_id = film_category.category_id
	where category.name = param1
	group by first_name, last_name, email;
end; 
// delimiter ; 

call customers_category_input("Animation");
call customers_category_input("Children");
call customers_category_input("classics");



# Write a query to check the number of movies released in each movie category. Convert the query in to a stored procedure to 
# filter only those categories that have movies released greater than a certain number. Pass that number as an argument in the stored procedure.

SELECT fc.category_id, c.name, COUNT(fc.film_id) as Count
FROM film_category fc
JOIN category c USING(category_id)
GROUP BY category_id
HAVING Count > 60;


drop procedure if exists film_category_input;
delimiter //
create procedure film_category_input (IN param2 INT(3))
begin
	SELECT fc.category_id, c.name, COUNT(fc.film_id) as Count
	FROM film_category fc
	JOIN category c USING(category_id)
	GROUP BY category_id
	HAVING Count > param2;
end; 
// delimiter ; 

call film_category_input(50);