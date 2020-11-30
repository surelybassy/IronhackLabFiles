#How many distinct (different) actors' last names are there?

SELECT COUNT(distinct last_name) FROM actor;

#In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT distinct language_id from film;

#How many movies were released with "PG-13" rating?
SELECT * FROM sakila.film WHERE rating = 'PG-13';
SELECT count(*) FROM sakila.film WHERE rating = 'PG-13';

#Get 10 the longest movies from 2006.
SELECT * FROM film WHERE release_year = 2006 ORDER BY length DESC LIMIT 10;

#How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MIN(rental_date), MAX(rental_date)) from rental;

SELECT DATEDIFF('2006-02-14','2005-05-24') as DateDiff;

#Show rental info with additional columns month and weekday. Get 20.
SELECT *, date_format(convert(rental_date,date), '%M') as Year, date_format(convert(rental_date,date), '%W') as Weekday  FROM rental LIMIT 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id, date_format(convert(rental_date,date), '%M') as Year, date_format(convert(rental_date,date), '%W') as Weekday,   FROM rental LIMIT 20;

select rental_id, rental_id, date_format(convert(rental_date,date), '%M') as Year, date_format(convert(rental_date,date), '%W') as Weekday,
case
when date_format(convert(rental_date,date), '%W') = 'Saturday' then 'Weekend'
when date_format(convert(rental_date,date), '%W') = 'Sunday' then 'Weekend'
else 'Weekday'
end as 'Weekend/Weekday'
from rental
LIMIT 100;

#How many rentals were in the last month of activity?

SELECT Max(rental_date) FROM rental;

SELECT COUNT(*) FROM rental where rental_date between '2006-01-14 15:16:03' and '2006-02-14 15:16:03';