use sakila;
-- TASK 1;
select actor_id, concat(first_name, '',last_name) as 'Fullname' from actor;
-- Full name of the actor has displayed.

-- TASK 2.1
select first_name, count(first_name) as ' number of time the actor name appears' from actor group by  first_name order by count(first_name) desc;
The last_name Kilmer  appears around five time.
There are total 66 actors who are having unique last_name and it has displayed

-- The name PENELOPE and JULIA appears around four time.


-- TASK 2.2 
SELECT distinct(first_name), count(first_name) from actor group by first_name having count(first_name) = 1 order by count(first_name) desc;

-- There are total 76 actors who are having unique first_name and it has displayed


-- TASK 3.1
select last_name, count(last_name) as ' number of time the actor name appears' from actor group by  last_name order by count(last_name) desc;

-- The last_name Kilmer  appears around five time.

TASK 3.2
select distinct(last_name), count(last_name) as 'number of time the actor name apperas' from actor group by last_name order by count(last_name) desc;
SELECT distinct(last_name), count(last_name) as 'number of time the actor name apperas' from actor group by last_name having count(last_name) = 1 order by count(last_name) desc;

-- There are total 66 actors who are having unique last_name and it has displayed 


TASK 4.1
SELECT film_id,title,rating WHERE (SELECT name FROM category) and rating = R FROM film;

SELECT f.film_id,title, c.name from film f  inner join film_category fc inner join category c on
f.film_id = fc.film_id and c.category_id = fc.category_id where rating = 'R' ;
 
--  There are total 195 movies having rating “R”.

-- TASK 4.2
SELECT f.film_id,title,rating , c.name from film f  inner join film_category fc inner join category c on
f.film_id = fc.film_id and c.category_id = fc.category_id where rating != 'R' ;

-- There are 805 movies that are not rated “R”.

-- TASK 4.3
SELECT f.film_id,title,rating from film f  inner join film_category fc inner join category c on
f.film_id = fc.film_id and c.category_id = fc.category_id where c.name = 'Children' ;

-- Audience below 13 years means they are belong to the children category and there are 60 movies for children category.
 

-- TASK 5.1
SELECT film_id,title,rating,replacement_cost from film where replacement_cost = 11;
-- In task 5.a there is no such movie having replacement_cost less than $11. 

-- TASK 5.2
SELECT film_id,title,rating,replacement_cost from film where replacement_cost BETWEEN 11 AND 20;
-- In task 5.b there total 424 movies having there rental cost between 11 and 20


-- TASK 5.3
SELECT film_id,title,rating,replacement_cost from film ORDER BY replacement_cost DESC;
-- The list of records of all the movies  along with rating and replacement_cost has displayed, highest replacement cost is 29.99
 

-- TASK 6
SELECT f.title, COUNT(actor_id) as "number of actors" from film_actor fa  inner join   film  f
on f.film_id = fa.film_id group by f.title 
order by count(actor_id) desc limit 3;
  -- The movie LAMBS CINCINATTI has 15 number of actors, CHITTY LOCK and  BOONDOCK BALLROOM has 13 number of actors each.
 

-- TASK 7 
SELECT title FROM film WHERE title LIKE 'K%' OR title LIKE 'Q%';
-- There are 12 movies having a first letter K and 3 movies having the  first letter Q
 


-- TASK 8
SELECT concat(first_name, '',last_name) as 'Actor_name' from actor a  INNER JOIN film_actor fa  inner join film f 
on a.actor_id = fa.actor_id and fa.film_id = f.film_id
where title = 'AGENT TRUMAN';
-- There are total  7 actors in the movie 'AGENT TRUMAN’  and there full names has displayed.
 
-- TASK 9
SELECT f.film_id,title from film f  inner join film_category fc inner join category c on
f.film_id = fc.film_id and c.category_id = fc.category_id where c.name = 'Family';

-- There are total  69 movies belongs to the family genre 

-- TASK 10
SELECT avg(rental_rate),max(rental_rate), min(rental_rate), rating from film group by rating order by avg(rental_rate) desc;

-- The average rental rate is highest for PG – rating , it has maximum rental rate has 4.99 and minimum rental rate has 0.99.


-- TASK 10.2
select f.title, count(rental_id) as 'rental_frequency' from rental r inner join inventory i inner join film f 
on r.inventory_id = i.inventory_id and i.film_id = f.film_id
group by f.title order by count(rental_id) desc;

-- The most frequently rented movies is ‘BUCKET BROTHERHOOD’ has rented around 34 times. 

-- TASK 11
select category.name, count(category.name) as 'movies_category' , (avg(replacement_cost)-avg(rental_rate)) as 'difference_cost' from
 film inner join film_category inner join category on film.film_id = film_category.film_id and 
film_category.category_id=category.category_id group by  category.name having 'difference_cost' > '15'  
order by count(category.name) desc;

-- Sports category has maximum number of  movies around 74 movies having average difference between the movie replacement cost and the rental rate is 17.27.
 
 
 -- There are 16 film category 


-- TASK 12
SELECT category.name , count(film_id) as 'number of movies' from film_category inner join category on
film_category.category_id = category.category_id group by category.name having count(film_id) > 70;

-- The film category foreign and Sports are having the number of movies grater than 70

-- Extra Analysis 
use sakila;
SELECT COUNT(film_id), avg(rental_rate) from film where rating = 'PG-13';
SELECT COUNT(film_id) from film where rating = 'G';
SELECT COUNT(film_id) from film where rating = 'PG';
SELECT COUNT(film_id) from film where rating = 'R';
SELECT COUNT(film_id) from film where rating = 'NC-17';

select count(film_id) from film where replacement_cost  between 15 and 20;
select count(film_id) from film where replacement_cost  between 10 and 25;

-- In the this database there are 16 category,1000 movies and  200 actors.

-- Conclusion 
-- Most of the movies(30%)  got “PG-13” rating and the average rental rate for  the movies having PG-13 rating are 3.03.

-- 73% of the  movies are having the  replacement cost between $10 and $25.

-- The average  number of actors for the movies is between 8-10 and the film_id ‘508’ has maximum number of actors.

-- The movie “ AGENT TRUMAN” got a great success, it has 7 actors and belongs  to foreign genre.

-- The movie “BUCKET BROTHERHOOD” has frequently rented movie, it has rented around 34 times.

-- ‘Sports’ genre has maximum number of movies around 74 movies  foriegn  genre has 73 movies, family genre has 64 movies and  children genre has 60 movies.
