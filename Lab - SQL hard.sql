#List each pair of actors that have worked together.

SELECT actor_id, film_id FROM film_actor ORDER BY film_id;

SELECT fa1.actor_id, sub1.actor_id, fa1.film_id FROM film_actor fa1
JOIN (SELECT fa2.actor_id, fa2.film_id FROM film_actor fa2 ORDER BY fa2.film_id)sub1 USING (film_id);

SELECT fa1.actor_id, sub1.actor_id, fa1.film_id FROM film_actor fa1
JOIN (SELECT fa2.actor_id, fa2.film_id FROM film_actor fa2 ORDER BY fa2.film_id)sub1 USING (film_id)
WHERE fa1.actor_id <> sub1.actor_id;

SELECT CONCAT(a.first_name,' ',a.last_name) as firstActor, CONCAT(a2.first_name,' ',a2.last_name) as secondActor, fa1.actor_id, sub1.actor_id, fa1.film_id 
FROM film_actor fa1
JOIN (SELECT fa2.actor_id, fa2.film_id FROM film_actor fa2 ORDER BY fa2.film_id)sub1 USING (film_id)
JOIN actor a ON a.actor_id=fa1.actor_id
JOIN actor a2 ON a2.actor_id=sub1.actor_id
WHERE fa1.actor_id <> sub1.actor_id;


#For each film, list actor that has acted in more films.

SELECT actor_id, COUNT(film_id) as FilmCount FROM film_actor GROUP BY actor_id;



