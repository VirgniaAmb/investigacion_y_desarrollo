# ejercicio 36, 37 y 38
SELECT a.address AS direccion, c.city AS ciudad, p.country AS pais
FROM sakila.address a
INNER JOIN sakila.city c ON (a.city_id = c.city_id) 
INNER JOIN sakila.country p ON (c.country_id = p.country_id);

SELECT s.store_id, c.first_name, a.address
FROM sakila.customer c
LEFT JOIN sakila.store s ON (c.store_id = s.store_id)
LEFT JOIN sakila.address a ON (c.address_id = a.address_id);

SELECT r.rental_id, s.first_name
FROM sakila.rental r
INNER JOIN sakila.staff s ON (r.staff_id = s.staff_id);

# funciones de agregacion
#sumo los valores dentro de una columna
SELECT SUM(amount) FROM sakila.payment;

#sumo columnas
SELECT inventory_id + film_id + store_id
FROM sakila.inventory;

#veo el total de registros de una tabla
SELECT COUNT(*) FROM sakila.actor;

#promedio
SELECT AVG(amount) FROM sakila.payment;

#max-min
SELECT MAX(length) FROM sakila.film;

SELECT MIN(length) FROM sakila.film;

#ejercicio 44, 45
SELECT COUNT(rental_id) FROM sakila.rental;

SELECT MAX(amount) FROM sakila.payment;

#GROUP BY
SELECT last_name, COUNT(*) FROM sakila.actor
GROUP BY last_name;

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount)
FROM sakila.payment p
INNER JOIN sakila.customer c ON (c.customer_id = p.customer_id)
GROUP BY 1, 2, 3;

#ejercicio 48
SELECT MAX(rental_date) FROM sakila.rental;

SELECT customer_id, MAX(rental_date) 
FROM sakila.rental
GROUP BY customer_id;

#Having
SELECT last_name, count(*)
FROM sakila.actor
GROUP BY 1
HAVING COUNT(*) > 3;

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount)
FROM sakila.payment p
INNER JOIN sakila.customer c ON (c.customer_id = p.customer_id)
GROUP BY 1, 2, 3
HAVING SUM(p.amount) < 100
ORDER BY SUM(p.amount) DESC;

#ejercicio 51
SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 2;

#CHAR
SELECT name, char_length(name) AS LongitudCadena
FROM sakila.category;

SELECT city, char_length(city) AS LongitudCiudad
FROM sakila.city;

#CONTAT
SELECT *, CONCAT(first_name, " ", last_name) AS NombreCompleto
FROM sakila.customer;

SELECT CONCAT_WS(" - ", title, description, release_year)
FROM sakila.film;

#ROUND
SELECT *, ROUND(amount,0) FROM sakila.payment;

#Lower Case / Up Case
SELECT *, LCASE(CONCAT(first_name, " ", last_name)) as "Nombre Completo"
FROM sakila.actor;

#ejercicio 57 - 58 - 59 - 60 - 61
SELECT email, char_length(email) AS LongitudEmail
FROM sakila.customer;

SELECT *, CONCAT_WS(" - ", first_name, last_name, email) AS Informacion
FROM sakila.customer;

SELECT customer_id, ROUND(AVG(amount),0) as Promedio
FROM sakila.payment
GROUP BY customer_id;

SELECT *, UCASE(city) AS ciudad FROM sakila.city;

#CASE
SELECT address, address2,
CASE
	WHEN address2 IS NULL THEN "Sin direccion 2"
    ELSE "Con direccion"
    END AS Comentario
    FROM sakila.address;
    
SELECT payment_id, amount,
CASE
	WHEN amount <1 THEN "precio minimo"
    WHEN amount BETWEEN 1 AND 3 THEN "precio intermedio"
    ELSE "precio maximo"
    END AS Comentario
FROM sakila.payment;

# ejercicio 64
SELECT title, rental_rate,
CASE
	WHEN rental_rate <1 THEN "pelicula mala"
    WHEN rental_rate BETWEEN 1 AND 3 THEN "pelicula buena"
    ELSE "pelicula exelente"
    END AS Comentario
FROM sakila.film;

#subqueries
SELECT title
FROM sakila.film
WHERE title LIKE "k%" OR "q%"
AND title IN
(SELECT title FROM sakila.film WHERE language_id IN
(SELECT language_id FROM sakila.language WHERE name = "English"));

SELECT first_name, last_name
FROM sakila.actor
WHERE actor_id IN
(SELECT actor_id FROM sakila.film_actor WHERE film_id IN
(SELECT film_id FROM sakila.film WHERE title = "Alone trip"));

SELECT title
FROM sakila.film
WHERE film_id IN
(SELECT film_id FROM sakila.film_category WHERE category_id IN
(SELECT category_id FROM sakila.category WHERE name = "Family"));

#Ejercicio 68
# Encuentre el nombre completo y la dirección de correo electrónico de todos los clientes que hayan alquilado una película de acción.

SELECT * FROM sakila.category;

SELECT CONCAT_WS(" - ", first_name, last_name, email) AS "Nombre Completo"
FROM sakila.customer
WHERE customer_id IN
(SELECT customer_id FROM sakila.rental WHERE inventory_id IN
(SELECT inventory_id FROM sakila.inventory WHERE film_id IN
(SELECT film_id FROM sakila.film_category WHERE category_id IN
(SELECT category_id FROM sakila.category WHERE name = "action"))))

#VIEWS

create view lista_de_clientes as 
select * from sakila.rental;

SELECT name, SUM(amount)
FROM sakila.category
INNER JOIN sakila.film_category  fc ON (category.category_id = film_category.category_id)
INNER JOIN sakila.inventory i ON (film_category.film_id = inventory.film_id)
INNER JOIN sakila.rental r ON (inventory.inventory_id = rental.inventory_id)
INNER JOIN sakila.payment p ON (rental.rental_id = payment.rental_id)
GROUP BY name
ORDER BY SUM(amount) DESC LIMIT 5;

SELECT * FROM ingresos_por_genero;

DROP VIEW ingresos_por_genero;

#ejercicio 70
create view lista_de_clientes as 
select * from sakila.rental;

