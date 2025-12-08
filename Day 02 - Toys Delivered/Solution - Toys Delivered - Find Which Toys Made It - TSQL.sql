-- Day 2 of SQL Advent Calendar by Interview Master

-- Toys Delivered - Find Which Toys Made It
-- Santa wants to analyze which toys that were produced in his workshop have already been delivered to children. 

-- Question 1 of 1
-- You are given two tables on toy production and toy delivery — can you return the toy ID and toy name of the toys that have been delivered?

--/////////////////////////////////////////////////////////////////////////////

-- Select the database to use for the script. In this case, it's SQLAdvent2025.
USE SQLAdvent2025;
GO

-- Show that the table exists
SELECT * FROM dbo.toy_production
SELECT * FROM dbo.toy_delivery

-- Select the columns to use for the script.
SELECT p.toy_id, p.toy_name
FROM dbo.toy_production AS p
JOIN dbo.toy_delivery AS d
    ON p.toy_id = d.toy_id;