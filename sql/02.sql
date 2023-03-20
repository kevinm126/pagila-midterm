/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

select country from (
    select country, count(customer_id) from country
    join city using(country_id)
    join address using (city_id)
    join customer using (address_id)
    group by country
    order by count(customer_id) desc)  as t
limit 1;
