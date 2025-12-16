-- Day 7 of SQL Advent Calendar by Interview Master
-- Snowflake Types Count

-- Question 1 of 1

-- Frosty wants to know how many unique snowflake types were recorded on the December 24th, 2025 storm. Can you help him?


-- ===============================================================

-- SQL script to create a table and load data from a txt file
-- 👇 Change the name of the database to match your own
-- If you don't have a database called SQLAdvent2025, run this line
-- CREATE DATABASE SQLAdvent2025;
-- Then run this line to use it and reuse the connection for the future

USE SQLAdvent2025;
GO

----------------------------------------------------
-- 1. Drop existing tables if they exist
----------------------------------------------------

IF OBJECT_ID('snowfall_log', 'U') IS NOT NULL
    DROP TABLE dbo.snowfall_log;
GO

------------------------------
-- 2. Create the tables
------------------------------

CREATE TABLE dbo.snowfall_log
(
    flake_id INT,
    flake_type VARCHAR(20),
    fall_time DATETIME
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated). A colleague pointed out that there are such things as 'tab-separated values' files, or TSVs. So I will be saving those files as .tsv going forward to avoid confusion.
-----------------------------------------

BULK INSERT dbo.snowfall_log
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 07 - Snowflake Types Count\snowfall_log.tsv'
WITH (
    FIRSTROW = 2,           -- skip header
    FIELDTERMINATOR = '\t',  -- tab-separated now
    ROWTERMINATOR = '0x0a'  -- line break
);
GO

-----------------------------------------
-- 4. Sanity checks
-----------------------------------------

SELECT COUNT(*) AS row_count
FROM dbo.snowfall_log;
GO

SELECT TOP 10
    *
FROM dbo.snowfall_log;
GO