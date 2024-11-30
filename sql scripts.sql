create database music_store; -- to create a new database
use music_store; -- to use the database

-- Question set 1 - Easy
-- Q1. Who is the senior most employee based on job title ?
select * from employee
order by levels desc
limit 1

-- Q2. Which countries have the most Invoices ?
select billing_country , count(*) as most_invoices from invoice
group by billing_country 
order by most_invoices desc

-- Q3. What are top 3 values of total invoice ?
select distinct(total) from invoice
order by total desc
limit 3

-- Q4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals.
select billing_city as city_name,  sum(total) as total_invoice from invoice
group by billing_city
order by total_invoices desc
limit 1

-- Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money. 
select count(customer_id), sum(total) from invoice
group by customer_id
order by sum(total) desc
limit 1
-- or
select c.customer_id, c.first_name, c.last_name, sum(i.total) as total
from customer as c join invoice as i
on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total desc
limit 1