# con punto y coma separo las querys.

# SELECT
# con asterisco llamamos a todas las columnas
select * from sakila.actor;
select actor_id, first_name as nombre, last_name as apellido, last_update from sakila.actor;

select * from sakila.customer;

# SELECT DISTINCT
select distinct (store_id) from sakila.customer;

select distinct (customer_id) from sakila.payment;

# ORDER BY
select * from sakila.country order by country DESC;
select * from sakila.country order by country ASC;

select store_id, first_name, last_name from sakila.customer;

#ejercicio
select store_id as tienda, first_name as nombre, last_name as apellido from sakila.customer;


select store_id as tienda, first_name as nombre, last_name as apellido 
from sakila.customer 
order by apellido DESC;

select * from sakila.payment;

# cual es la cantidad mas baja y mas alta de la columna amount?
select distinct (amount) from sakila.payment order by amount ASC;

#WHERE
# where me sirve para dar condiciones. entre comillas si es  texto, si es numero no hace falta
select * from sakila.actor where first_name = 'DAN';

select * from  sakila.city where  city = 'London';

# se pueden poner condiciones para numeros o textos
select * from sakila.inventory where film_id > 50;

select * from sakila.language where name <> 'German';

# ejercicios
select description, release_year from sakila.film;

select *from sakila.film;

select *from sakila.film where title = 'IMPACT ALADDIN';

select * from sakila.payment where amount > 0.99;

# WHERE: condiciones compuestas

select * from sakila.country 
where country = 'Algeria' and country_id = 2;

select * from sakila.country 
where country = 'Algeria' or country_id = 12;

select * from sakila.category where not name = 'Action';

select distinct (rating) from sakila.film where not rating = 'pg';

# ejercicio 14 y 15
select * from sakila.payment
where customer_id = 36 and amount > 0.99 and staff_id = 1;

select * from sakila.rental
where staff_id != 1 and customer_id > 250 and inventory_id < 100;

select * from sakila.rental
where not staff_id = 1 and customer_id > 250 and inventory_id < 100;

select * from sakila.customer where first_name in ('mary', 'patricia');

select * from sakila.film 
where special_features in ('trailers', 'trailers,deleted scenes') and rating in ('g', 'r')
and length  > 100;

select * from sakila.category 
where name not in ('action', 'children', 'animation');

# ejercicio 19 y 20
select * from sakila.film_text
where title in ('zorro ark', 'virgin daisy', 'united pilot');

select * from sakila.city
where city in ('chiayi', 'Dongying', 'Fukuyama', 'Kilis');

select * from sakila.rental where customer_id between 300 and 350;

select * from sakila.rental where (customer_id between 300 and 350) and staff_id = 1;

select * from sakila.payment where amount not between 3 and 5;

# ejercicio 23, 24 y 25
select * from sakila.payment 
where (amount between 2.99 and 4.99)
and staff_id = 2
and customer_id in (1, 2);

select * from sakila.address where city_id between 300 and 350;

select * from sakila.film
where 1=1
and (rental_rate between 0.99 and 2.99)
and length <= 50
and replacement_cost < 20;

# first name comienza solo con A
select * from sakila.actor
where first_name like "A%";

select * from sakila.actor
where first_name like "A%" and last_name like "B%";

# first name termina con A
select * from sakila.actor
where first_name like "%A";

select * from sakila.actor
where first_name like "%A" and last_name like "%N";

#busque en cualquier posicion
select * from sakila.actor
where first_name like "%NE%";

select * from sakila.actor
where first_name like "%NE%" and last_name like "%RO%";

#empieza con una letra y termina con otra

select * from sakila.actor
where first_name like "C%N" and last_name like "G%";

# ejercicio 30
SELECT * FROM sakila.film
WHERE release_year = 2006
AND title like "ALI%";

# inner join
SELECT *
FROM sakila.film f
INNER JOIN sakila.language l ON (f.language_id = l.language_id);

SELECT f.title, f.description, f.release_year, l.language_id, l.name
FROM sakila.film f
INNER JOIN sakila.language l ON (f.language_id = l.language_id);

SELECT a.address AS direccion, c.city AS ciudad 
FROM sakila.address a
INNER JOIN sakila.city c ON (a.city_id = c.city_id);

# right join
SELECT c.customer_id, c.first_name, c.last_name, a.actor_id, a.first_name, a.last_name
FROM sakila.customer c
RIGHT JOIN sakila.actor a ON (c.last_name = a.last_name);

# left join
SELECT c.customer_id, c.first_name, c.last_name, a.actor_id, a.first_name, a.last_name
FROM sakila.customer c
LEFT JOIN sakila.actor a ON (c.last_name = a.last_name);