/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */


/*
 * the select query below can be made into a table with two columns by removing 
 the concat function and the as function but i thought because this is geared toward 
 making a system that a nontechnical person might be able to read it would make more 
sense to concatenate them
*/
select concat(actor.first_name,' ', actor.last_name) as actor_name from actor 
where actor_id not in(
    select actor_id from actor
    join film_actor using (actor_id)
    join film using (film_id)
    join film_category using (film_id)
    join category using (category_id)
         where category.name = 'Horror')
and 
    actor_id in(
    select actor_id from actor
    join film_actor using (actor_id) 
    join film using (film_id) 
    join film_category using (film_id)
    join category using (category_id)
        where category.name = 'Children')
order by last_name,first_name desc
