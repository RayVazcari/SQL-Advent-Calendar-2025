-- Day 4 of SQL Advent Calendar 2025 by Interview Master
-- Energy-Efficient Holiday Decorations

-- -- Question 1 of 1

-- Kevin's trying to decorate the house without sending the electricity bill through the roof. Write a query to find the top 5 most energy-efficient decorations (i.e. lowest cost per hour to operate).


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
IF OBJECT_ID('hall_decorations', 'U') IS NOT NULL
    DROP TABLE dbo.hall_decorations;
GO

------------------------------
-- 2. Create the tables
------------------------------
CREATE TABLE dbo.hall_decorations
(
    decoration_id INT,
    decoration_name VARCHAR(100),
    energy_cost_per_hour DECIMAL(5,4)
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT
--    (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated)
-----------------------------------------
BULK INSERT dbo.hall_decorations
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 04 - Energy-Efficient Holiday Decorations\hall_decorations.csv'
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
FROM dbo.hall_decorations;
GO