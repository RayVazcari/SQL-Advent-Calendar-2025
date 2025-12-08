-- Day 1 of SQL Advent Calendar
-- by Interview Master

-- Every year, the city
-- of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Write a query to return the name and rank of the top 7 reindeers in this race.

-- Question 1 of 1

-- Every year, the city of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Can you write a query to
-- return the
-- name and rank of the top 7 reindeers in this race?

--/////////////////////////////////////////////////////////////////////////////

-- Show that the table exists
SELECT *FROM reindeer_run_results

-- -- Select the columns to use for the script. In this case, it's Name and Rank 
SELECT name, rank
FROM reindeer_run_results
ORDER BY rank
LIMIT 7
