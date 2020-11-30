#Get film ratings.
SELECT distinct rating FROM film;

#Get release years.
SELECT distinct release_year FROM film;

#Get all films with ARMAGEDDON in the title.
SELECT * FROM film WHERE title regexp 'ARMAGEDDON';

#Get all films with APOLLO in the title
SELECT * FROM film WHERE title regexp 'APOLLO';


#Get all films which title ends with APOLLO.
SELECT * FROM film WHERE title regexp ' APOLLO';
#or like this
select * from film where title like '%APOLLO';

#Get all films with word DATE in the title.
SELECT * FROM film WHERE title regexp 'DATE';

#Get 10 films with the longest title.
SELECT length(title) as TitleLength FROM film order by TitleLength DESC LIMIT 10; 

#Get 10 the longest films.
SELECT * FROM film ORDER BY length DESC LIMIT 10;

#How many films include Behind the Scenes content?
SELECT * FROM film WHERE special_features regexp 'Behind';
SELECT COUNT(*) FROM film WHERE special_features regexp 'Behind';

#List films ordered by release year and title in alphabetical order.
select * from film
order by release_year, title;