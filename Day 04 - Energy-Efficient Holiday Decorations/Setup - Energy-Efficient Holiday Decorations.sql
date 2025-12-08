-- Day 3 of SQL Advent Calendar 2025 by Interview Master
-- The Grinch's Best Pranks Per Target

-- -- Question 1 of 1

-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.


--/////////////////////////////////////////////////////////////////////////////


-- SQL script to create a table and load data from a CSV file
-- 👇 Change the name of the database to match your own
-- If you don't have a database called SQLAdvent2025, run this line
-- CREATE DATABASE SQLAdvent2025;
-- Then run this line to use it and reuse the connection for the future
USE SQLAdvent2025;
GO

----------------------------------------------------
-- 1. Drop existing tables if they exist (idempotent)
----------------------------------------------------
IF OBJECT_ID('grinch_prank_ideas', 'U') IS NOT NULL
    DROP TABLE dbo.grinch_prank_ideas;
GO

------------------------------
-- 2. Create the tables
------------------------------
CREATE TABLE dbo.grinch_prank_ideas
(
    prank_id INT,
    target_name VARCHAR(100),
    prank_description VARCHAR(500),
    evilness_score INT,
    created_at DATETIME
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT
--    (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated)
-----------------------------------------
BULK INSERT dbo.grinch_prank_ideas
FROM 'C:\Users\ramon\OneDrive\04 - Education\SQL Advent Calendar\Day 03 - The Grinchs Best Pranks Per Target\grinch_prank_ideas.csv'
WITH (
    FIRSTROW = 2,           -- skip header
    FIELDTERMINATOR = '\t',  -- comma-separated now
    ROWTERMINATOR = '0x0a'  -- line break
);
GO

-----------------------------------------
-- 4. Sanity checks
-----------------------------------------
SELECT COUNT(*) AS row_count
FROM dbo.grinch_prank_ideas;
GO