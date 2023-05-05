#consultas multiclase
-- quien ha vendido mas del staff en agosto de 2005?
SELECT s.first_name, s.last_name, SUM(p.amount) AS "total ventas"
FROM sakila.staff s
INNER JOIN sakila.payment p ON (s.staff_id = p.staff_id)
AND p.payment_date LIKE "2005-08%"
GROUP BY s.first_name, s.last_name;

-- lista de pelicula y el numero de actores de cada pelicula
SELECT f.title, COUNT(a.actor_id) AS "cantidad de actores"
FROM sakila.film_actor a
INNER JOIN sakila.film f ON (a.film_id = f.film_id)
GROUP BY f.title;

-- cuantas copias de la pelicula Hunchback Impossible existen en el sistema de inventario?
SELECT f.title, COUNT(f.title) as "Copias de pelicula"
FROM sakila.film f
INNER JOIN sakila.inventory i ON (f.film_id = i.film_id)
WHERE f.title = "Hunchback Impossible";

-- anote el total pagado por cada cliente. Listar los clientes alfabeticamente por apellido.
SELECT c.first_name, c.last_name, SUM(p.amount) AS "total pagado"
FROM sakila.payment p
INNER JOIN sakila.customer c ON (p.customer_id = c.customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name;

#ejercicio 76
-- Muchas tiendas de DVD producen una lista diaria de alquileres vencidos para que los clientes puedan ser contactados 
-- y se les pida que devuelvan sus DVD vencidos.
-- Para crear una lista de este tipo, busque películas en la tabla de alquiler con una fecha de retorno NULA y donde la fecha 
-- de alquiler sea más antigua que la duración del alquiler especificada en la tabla de películas. Si es así, la película está 
-- atrasada y debemos producir el nombre de la película junto con el nombre del cliente y el número de teléfono.
SELECT f.title, CONCAT(c.first_name," ", c.last_name) AS "nombre cliente", a.phone AS "telefono",
r.rental_date, r.return_date, f.rental_duration
FROM sakila.rental r
INNER JOIN sakila.inventory i ON (r.inventory_id = i.inventory_id)
INNER JOIN sakila.film f ON (i.film_id = f.film_id)
INNER JOIN sakila.customer c ON  (r.customer_id = c.customer_id)
INNER JOIN sakila.address a ON  (c.address_id = a.address_id)
WHERE r.return_date IS NULL OR datediff(r.rental_date,r.return_date)>f.rental_duration
ORDER BY c.last_name;

#ISERT INTO
SELECT * FROM sakila.city;

INSERT INTO sakila.city(city, country_id)
VALUES('prueba', '100');

SELECT * FROM sakila.city;

INSERT INTO sakila.actor(first_name, last_name)
VALUES("Flaca", "Amb");

SELECT * FROM sakila.actor;

#UPDATE

UPDATE sakila.city
SET city = "New York"
WHERE country_id = 87;

SELECT * FROM sakila.city WHERE country_id = 87;

UPDATE sakila.actor
SET first_name = "LENA"
WHERE last_name = "GUINESS";

SELECT * FROM sakila.actor;

#ALTER TABLE
ALTER TABLE sakila.actor
ADD COLUMN genero_actor CHAR(1);

SELECT * FROM sakila.actor;

UPDATE sakila.actor
SET genero_actor = "F"
WHERE actor_id = 1;

SELECT * FROM sakila.actor;

#ejercicio 95 ¿Qué actores tienen el primer nombre 'Scarlett'?
SELECT * FROM sakila.actor
WHERE first_name LIKE "scarlett%";

SELECT * FROM sakila.actor
WHERE first_name = "scarlett";

#96 ¿Qué actores tienen el apellido "Johansson"?
SELECT * FROM sakila.actor
WHERE last_name LIKE "Johansson%";

#97 Cuántos apellidos de actores distintos hay?
SELECT last_name, COUNT(*) as "num de actores con mismo apellido"
FROM sakila.actor
GROUP BY last_name;

select count(distinct last_name) from sakila.actor;

#98 ¿Qué apellidos no se repiten?
SELECT last_name
FROM sakila.actor
GROUP BY last_name;

select last_name from sakila.actor group by last_name having count(*) = 1;

#99 ¿Qué actor ha aparecido en la mayoría de las películas?
SELECT
a.actor_id,
a.first_name,
a.last_name,
COUNT(actor_id) AS film_count
FROM sakila.actor a
INNER JOIN sakila.film_actor f ON (a.actor_id = f.actor_id)
GROUP BY actor_id
ORDER BY film_count;

select sakila.film_actor.actor_id, concat_ws(" ", actor.first_name, actor.last_name) 'Nombre actor', count(*) cuenta from sakila.film_actor
inner join sakila.actor on (sakila.film_actor.actor_id=sakila.actor.actor_id)
group by sakila.film_actor.actor_id order by cuenta desc limit 1

select a.actor_id, a.first_name, a.last_name, count(actor_id) as film_count
from sakila.actor a 
inner join sakila.film_actor using (actor_id)
group by actor_id
order by film_count DESC;

#100 ¿Se puede alquilar ‘Academy Dinosaur’ en la tienda 1?

select film.film_id, film.title, store.store_id, inventory.inventory_id

from sakila.inventory join sakila.store using (store_id) join sakila.film using (film_id)

where film.title = 'Academy Dinosaur' and store.store_id = 1;


