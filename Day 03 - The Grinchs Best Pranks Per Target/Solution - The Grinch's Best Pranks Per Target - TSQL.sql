-- Day 3 of SQL Advent Calendar 2025 by Interview Master
-- The Grinch's Best Pranks Per Target

-- -- Question 1 of 1

-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.


--/////////////////////////////////////////////////////////////////////////////

-- Select the database to use for the script. In this case, it's SQLAdvent2025.
USE SQLAdvent2025;
GO

-- Show that the table exists
SELECT *
FROM dbo.toy_production
SELECT *
FROM dbo.toy_delivery

-- Select the columns to use for the script.
SELECT p.toy_id, p.toy_name
FROM dbo.toy_production AS p
    JOIN dbo.toy_delivery AS d
    ON p.toy_id = d.toy_id;