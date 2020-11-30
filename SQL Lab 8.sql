#Rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.

select title, length, rank() over (order by length desc) as 'Rank'
from film
WHERE length is not null;

#Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over (order by length desc) as 'Rank'
from film
WHERE length is not null and length <> 0;


select title, length, rating, rank() over (partition by rating order by length desc) as "Ranks"
from film
WHERE length is not null and length <> 0;

#How many films are there for each of the categories in the category table. Use appropriate join to write this query

SELECT * FROM category;

SELECT * FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
WHERE c.category_id = 1;


select a.account_id, a.frequency, l.loan_id, l.amount, l.duration, l.payments, l.status
from bank.account a
right join bank.loan l on a.account_id = l.account_id
order by a.account_id;

#Which actor has appeared in the most films?
SELECT * FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id;


SELECT a.first_name, a.last_name, count(fa.film_id) as total
from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by a.last_name, a.first_name
order by total desc;

#Most active customer (the customer that has rented the most number of films)