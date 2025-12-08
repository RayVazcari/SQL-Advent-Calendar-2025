-- Day 2 of SQL Advent Calendar by Interview Master

-- Toys Delivered - Find Which Toys Made It
-- Santa wants to analyze which toys that were produced in his workshop have already been delivered to children. 

-- Question 1 of 1
-- You are given two tables on toy production and toy delivery — can you return the toy_id of the toys that have been delivered?


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
IF OBJECT_ID('toy_production', 'U') IS NOT NULL
    DROP TABLE dbo.toy_production;
GO

IF OBJECT_ID('toy_delivery', 'U') IS NOT NULL
    DROP TABLE dbo.toy_delivery;
GO

------------------------------
-- 2. Create the tables
------------------------------
CREATE TABLE dbo.toy_production
(
    toy_id INT,
    toy_name VARCHAR(100),
    production_date DATE
);
GO

CREATE TABLE dbo.toy_delivery
(
    toy_id INT,
    child_name VARCHAR(100),
    delivery_date DATE
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT
--    (CSVs must be in a folder SQL Server can read)
-- Note, how your files are sepparated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated)
-----------------------------------------
BULK INSERT dbo.toy_production
FROM 'C:\Users\ramon\OneDrive\04 - Education\SQL Advent Calendar\Day 02 - Toys Delivered\toy_production.csv'
WITH (
    FIRSTROW = 2,               -- skip header row
    FIELDTERMINATOR = '\t',      -- comma-separated
    ROWTERMINATOR = '0x0a'      -- line break
);
GO

BULK INSERT dbo.toy_delivery
FROM 'C:\Users\ramon\OneDrive\04 - Education\SQL Advent Calendar\Day 02 - Toys Delivered\toy_delivery.csv'
WITH (
    FIRSTROW = 2,               -- skip header row
    FIELDTERMINATOR = '\t',      -- comma-separated
    ROWTERMINATOR = '0x0a'      -- line break
);
GO

-----------------------------------------
-- 4. Sanity checks
-----------------------------------------
SELECT COUNT(*) AS row_count
FROM dbo.toy_production;
GO

SELECT COUNT(*) AS row_count
FROM dbo.toy_delivery;
GO