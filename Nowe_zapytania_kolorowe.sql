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

s\za
  
CREATE DATABASE magazyn
  
CREATE TABLE zapas(
id SERIAL,
nazwa VARCHAR(100),
stan ENUM('wysoki','sredni','niski')
)

INSERT INTO zapas (nazwa, stan) VALUES ('Mleko', 'wysoki')
INSERT INTO zapas (nazwa, stan) VALUES ('Ser', 'sredni')
INSERT INTO zapas (nazwa, stan) VALUES ('Jogurt', 'niski')
INSERT INTO zapas (nazwa, stan) VALUES ('Kefir', 'wysoki')
  
INSERT INTO zapas (nazwa, stan) VALUES ('Kefir', 'wysoka')

INSERT INTO zapas(nazwa,stan) VALUES ('kefir',3)

DELETE FROM zapas WHERE id='6'

-- ZADANIE 21
CREATE TABLE samochody (
    id INT PRIMARY KEY,
    status ENUM('Lambo', 'Ferrari', 'BMW', 'AUDI'),
    description VARCHAR(255)
);

CREATE TABLE magazyn(
id SERIAL,
nazwa VARCHAR(100),
alejka SET('biala','czerwona','zielona')
)

INSERT INTO magazyn(nazwa, alejka) VALUES ('Mleko', 'biala')
INSERT INTO magazyn(nazwa, alejka) VALUES ('Ser', 'czerwona')
INSERT INTO magazyn(nazwa, alejka) VALUES ('Jogurt', 'zielona')
INSERT INTO magazyn(nazwa, alejka) VALUES ('Jogurt owocowy', 'zielona,biala')
INSERT INTO magazyn(nazwa, alejka) VALUES ('Jogurt jagodowy', 'zielona,biala,czerwona')
  
INSERT INTO magazyn(nazwa, alejka) VALUES ('Jogurt Sernikowy', 'zielona,biala,czerwony')
  
INSERT INTO magazyn(nazwa, alejka) VALUES ('Jogurt Sernikowy', '3')
  
INSERT INTO magazyn(nazwa, alejka) VALUES ('Jogurt Sernikowy', '6')


  CREATE TABLE moja_tabela (
    id INT PRIMARY KEY,
    nazwa_tabeli VARCHAR(50) CHECK (nazwa_tabeli IN ('TabelaA', 'TabelaB', 'TabelaC')),
    nazwa_kolumny VARCHAR(50) CHECK (nazwa_kolumny IN ('KolumnaX', 'KolumnaY', 'KolumnaZ')),
    rekordy INT CHECK (rekordy IN (3, 6, 7)),
    opis VARCHAR(255)
);


CREATE DATABASE kursantki
  DROP TABLE IF EXISTS nauka
  DROP TABLE IF EXISTS kursantki
  DROP TABLE IF EXISTS kurs


  CREATE TABLE 'kursantki'(
    'kursantki_id' INT AUTO_INCREMENT PRIMATY KEY,
    'imie' varchar(15) NOT NULL,
    'nazwisko' varchar(120) NOT NULL DEFAULT 'uczen'
  )ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

 CREATE TABLE 'kurs'(
    'kurs_id' INT AUTO_INCREMENT PRIMATY KEY,
    'nazwa' varchar(15) NOT NULL
  )ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci; 

  INSERT INTO kurs(nazwa) VALUES('PHP')
  INSERT INTO kurs(nazwa) VALUES('C++')
  INSERT INTO kurs(nazwa) VALUES('JAVA')
  INSERT INTO kurs(nazwa) VALUES('JAVASCRIPT')
  INSERT INTO kurs(nazwa) VALUES('C#')
  INSERT INTO kurs(nazwa) VALUES('CSHARP')
  INSERT INTO kurs(nazwa) VALUES('SQL')
  INSERT INTO kurs(nazwa) VALUES('HTML')
  INSERT INTO kurs(nazwa) VALUES('CSS')
  INSERT INTO kurs(nazwa) VALUES('OTHER')

  CREATE TABLE 'nauka'(
  'nauka_id' OMT AUTO INCREMENT PRIMATY KEY,
  'kursantki_id' INT,
  'kurs_id' INT, 

  FOREGEIN KEY(kursantki_id) REFERENCES kursantki(kursantki_id),
  FOREGEIN KEY(kurs_id) REFERENCES kurs(kurs_id)
  )ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci

  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(1,7)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(1,8)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(2,10)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(3,9)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(4,9)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(5,7)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(6,9)
  INSERT INTO nauka (kursantki_id, kurs_id)  VALUES(6,8)


  ZADANIE DOMOWE:

  Potrafić zbudować taką podobną tabelke jak wyżej zapisałem (coś w tym stylu) 


wyznacz srednie pensje pracownikow z podzialem na miasta a nastepnie wybierz te grupy (miasta) w ktorych srednia pensja przekroczyla sto:

SELECT miasto,AVG(pensja) FROM pracownicy GROUP BY miasto HAVING AVG(pensja)>100;


ZAPYTANIA NA CZAS ĆWICZENIE: 

1.SELECT rok_produkcji, AVG(cena) FROM filmy GROUP BY rok_produkcji DESC HAVING AVG(cena);
2.SELECT MAX(cena) FROM `filmy`;
3.SELECT COUNT(tytul) FROM filmy WHERE rok_produkcji=1984;
4.SELECT COUNT(kopie.id_kopii) AS liczba_kopii FROM filmy JOIN kopie ON filmy.id_filmu = kopie.id_filmu JOIN wypozyczenia ON kopie.id_kopii = wypozyczenia.id_kopii WHERE kopie.id_kopii = 7; 
5.SELECT AVG(data_zwrotu-data_wypozyczenia) AS sredni_czas_wypozyczenia FROM wypozyczenia JOIN kopie ON wypozyczenia.id_kopii = kopie.id_kopii JOIN filmy ON kopie.id_filmu = filmy.id_filmu WHERE filmy.tytul = 'Ronin'; 
6.SELECT
  filmy.tytul AS film,
  ROUND(AVG(DATEDIFF(data_zwrotu, data_wypozyczenia)), 1) AS min,
  ROUND(AVG(DATEDIFF(data_zwrotu, data_wypozyczenia)), 1) AS max,
  ROUND(AVG(DATEDIFF(data_zwrotu, data_wypozyczenia)), 1) AS sre,
  COUNT(*) AS razy
FROM wypozyczenia
JOIN kopie ON wypozyczenia.id_kopii = kopie.id_kopii
JOIN filmy ON kopie.id_filmu = filmy.id_filmu
GROUP BY filmy.tytul;

7.SELECT
  klienci.imie,
  klienci.nazwisko,
  COUNT(wypozyczenia.id_klienta) AS liczba_wypozyczen
FROM klienci
LEFT JOIN wypozyczenia ON klienci.id_klienta = wypozyczenia.id_klienta
GROUP BY klienci.id_klienta;

8.SELECT aktorzy.nazwisko, COUNT(DISTINCT obsada.id_filmu) AS liczba_filmow FROM aktorzy JOIN obsada ON aktorzy.id_aktora = obsada.id_aktora GROUP BY aktorzy.id_aktora HAVING liczba_filmow > 1; 

9.SELECT klienci.nazwisko, SUM(filmy.cena) AS KWOTA FROM klienci JOIN wypozyczenia ON klienci.id_klienta = wypozyczenia.id_klienta JOIN kopie ON wypozyczenia.id_kopii = kopie.id_kopii JOIN filmy ON kopie.id_filmu = filmy.id_filmu GROUP BY klienci.id_klienta; 
10.INSERT INTO filmy (id_filmu, tytul, rok_produkcji, cena)
VALUES (11, 'Komornik', 2005, 10.5);

11.DELETE FROM filmy WHERE rok_produkcji = 2005; 

12.UPDATE filmy SET cena = cena * 1.1 WHERE rok_produkcji < 1980; 

=============================================================
  TRANSAKCJE:


  1.
  
  START TRANSACTION;

INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (1, 'Anna', 'Nowak', 'anna.nowak@example.com', 2, 1, NOW());

COMMIT;


2. 

  START TRANSACTION;

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, return_date)
VALUES (NOW(), 2, 2, 2, NULL);

COMMIT;


3.
  START TRANSACTION;

UPDATE rental
SET return_date = NOW()
WHERE rental_id = 2;

COMMIT;

