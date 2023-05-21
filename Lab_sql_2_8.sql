-- SQL Lab Lesson 2.8
USE sakila;
-- 1 question
SELECT country from country;
SELECT store_id from store;
SELECT city from city;

SELECT store.store_id, city.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

-- 2 question
SELECT store.store_id, SUM(payment.amount) AS total_business
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;

-- 3 question
SELECT category.name AS category_name, AVG(film.length) AS average_length
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.category_id, category_name
ORDER BY average_length DESC;

-- 4 question
SELECT film.title, COUNT(rental.rental_ID) as 'rental_times'
FROM sakila.film 
JOIN sakila.inventory USING(film_id)
JOIN sakila.rental USING(inventory_id)
GROUP BY film.title
ORDER BY COUNT(rental.rental_ID) DESC;

-- 5 question TBC


-- 6 question
SELECT film.title, inventory.store_id, inventory.inventory_id
FROM sakila.film
JOIN sakila.inventory USING (film_id)
WHERE film.title LIKE "Academy Dinosaur" AND inventory.store_id = 1;

-- 7 question
SELECT actor.last_name, actor.first_name, film.title, film_actor.film_id
FROM sakila.actor
RIGHT JOIN sakila.film_actor USING (actor_id) 
JOIN sakila.film USING (film_id);