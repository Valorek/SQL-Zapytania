SELECT * title FROM film WHERE title LIKE ‚D%’;

SELECT * last_name FROM customer WHERE last_name REGEXP '^..[a-e]';

SELECT DISTINCT c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE c.last_name REGEXP 'a.c' OR c.last_name REGEXP 'w$';

SELECT DISTINCT c.last_name FROM customer c JOIN rental r ON c.customer_id = r.customer_id WHERE c.last_name REGEXP '^[a.x]';

SELECT film_id, title, release_year, RIGHT(title, 1) AS last_letter, UPPER(title) AS upper_title FROM film WHERE release_year BETWEEN 2000 AND 2010 AND RIGHT(title, 1) = 's';

SELECT title FROM film WHERE title LIKE '__a%';

SELECT title FROM film WHERE title REGEXP '^[a-e]';

SELECT title FROM film WHERE title REGEXP '^..[a-e]';

SELECT film.title FROM film JOIN film_category ON film.film_id = film_category.film_id WHERE film.title REGEXP 'w$';


INSERT INTO actor VALUES(201,"Henry", "Cavill", "2023-02-22 18:56:30");
DESCRIBE actor;

INSERT INTO actor(first_name,last_name) VALUES("Jason","Mammoa");

INSERT INTO actor(actor_id, first_name, last_name) VALUES(203,"Ben", "Affleck")
INSERT INTO actor(actor_id, first_name, last_name) VALUES(203,Pablo", "Nerodos")
  -- (wywali błąd bo nie można nadpisać aktora o takim samym id) 

SELECT * FROM actor WHERE last_names="Affleck"
SELECT * FROM actor WHERE actor_id=203

UPDATE actor SET first_name='Bruce' WHERE actor_id=203
UPDATE actor SET first_name='Gal',last_name="Gadot" WHERE actor_id=203

-- V. DELETE - usuwanie rekordow z bazy danych 
-- A. Usunięcie pojedyńczego rekordu 

DELETE FROM actor WHERE actor_id=203
DELETE FROM actor WHERE actor_id>200

SELECT * FROM address WHERE adDress2 - NULL;

SELECT * FROM address WHERE adDress2 IS NULL;

SELECT * FROM address WHERE adDress2 IS NOT NULL;

-- ZADANIE 1 
SELECT * FROM customer WHERE store_id = 2 AND active = 0;

-- ZADANIE 2
SELECT * FROM film WHERE replacement_cost BETWEEN 25 AND 30 ORDER BY rental_rate LIMIT 100;


-- ZADANIE 3
-- a) 

SELECT * FROM country WHERE country_id = 76;
  
-- b)

UPDATE country SET country = 'Polska' WHERE country_id = 76;

-- ZADANIE 4

-- a)
DESCRIBE city;

-- b)

SHOW COLUMNS FROM city;

-- c)

INSERT INTO city (city, country_id, last_update) VALUES ('Knurów', 1, CURRENT_TIMESTAMP);

-- TWORZENIE BAZY DANYCH:
  
CREATE DATABASE liczone; 

CREATE TABLE liczby(
a INT,
b INT,
c FLOAT,
d FLOAT,
e DOUBLE,
f DOUBLE,
g DECIMAL(4,2),
h DECIMAL(4,2))

INSERT INTO liczby VALUES(1,2,1.1,2.2,1.1,2.2,1.1,2.2); 

SELECT a+b FROM liczby;

SELECT a+b, c+d, e+f, g+h, a+b < 3 , c+d=3.30, e+f=3.3, g+h=3.3 FROM liczby; 

  
