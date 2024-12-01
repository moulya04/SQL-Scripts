                                                                     SQL QUERIES
create database music_store; -- to create a new database
use music_store; -- to use the current database

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

/* Q4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals. */
select billing_city as city_name,  sum(total) as total_invoice from invoice
group by billing_city
order by total_invoices desc
limit 1

/* Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money. */
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

-- Question set 2 - Moderate
/* Q1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A */
select * from customer
select * from invoice
select * from invoice_line
select * from track
select * from genre -- tables used

select distinct email, first_name, last_name 
from customer
join invoice on customer.customer_id = invoice.customer_id 
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
	select track_id from track
        join genre on track.genre_id = genre.genre_id
        where genre.name = "Rock")
order by email 
					or
select distinct c.first_name, c.last_name, c.email, g.name
from customer as c join invoice as i
on c.customer_id = i.customer_id join invoice_line as l
on i.invoice_id = l.invoice_id join track as t 
on l.track_id = t.track_id join genre as g
on t.genre_id = g.genre_id
where g.name = "Rock" 
order by c.email

/* Q2. Let's invite the artists who have written the most rock music in our dataset.
Write a query that returns the Artist name and total track count of the top 10 rock bands */ 
select * from artist 
select * from album
select * from track
select * from genre -- tables used

select artist.artist_id, artist.name , count(artist.artist_id) as no_of_songs
from artist
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id
join genre on genre.genre_id = track.genre_id
where genre.name = "Rock"
group by artist.artist_id,  artist.name 
order by no_of_songs desc
limit 10;

/*  Q3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first */

select name, milliseconds
from track 
where milliseconds > ( select avg(milliseconds) as avg_track_length from track )
order by milliseconds desc;

-- Question set 3 - Advance
/* Q1. Find how much amount spent by each customer on artists ?
 Write a query to return customer name, artist name and total spent */
 -- Using CTE 
WITH best_selling_artist AS (
SELECT artist.artist_id AS artist_id, artist.name AS artist_name, 
SUM(invoice_line.unit_price * invoice_line.quantity) AS total_sales
FROM invoice_line
JOIN track ON track.track_id = invoice_line.track_id
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
GROUP BY 1, 2
ORDER BY 3 DESC 
LIMIT 10
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, 
SUM(il.unit_price * il.quantity) AS amount_spent
FROM invoice i 
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY 1, 2, 3, 4
ORDER BY 5 DESC

/* Q2. We want to find out the most popular music Genre for each country. 
We determine the most popular genre as the genre with the highest amount of purchases.
Write determine the most popular genre as the genre with the highest amount of purchases.
Write a query that returns each country along with the top Genre. 
For countries where the maximum number of purchases is shared return all Genres. */

WITH popular_genre AS 
(
	SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name, genre.genre_id,
    ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo
    FROM invoice_line 
    JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer ON customer.customer_id = invoice.customer_id
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY 2,3,4
    ORDER BY 2 ASC, 1 DESC
    )
SELECT * FROM popular_genre WHERE RowNo <= 1

