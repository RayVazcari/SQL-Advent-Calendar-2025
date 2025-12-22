-- Day 9 of SQL Advent Calendar by Interview Master
-- Tinsel and Light Combinations

-- Question 1 of 1

-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").

-- Question 1 of 1

-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").


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

IF OBJECT_ID('light_colors', 'U') IS NOT NULL
    DROP TABLE dbo.light_colors;
GO

IF OBJECT_ID('tinsel_colors', 'U') IS NOT NULL
    DROP TABLE dbo.tinsel_colors;
GO

------------------------------
-- 2. Create the tables
------------------------------

CREATE TABLE dbo.light_colors
(
    light_id INT,
    color_name VARCHAR(50)
);
GO

CREATE TABLE dbo.tinsel_colors
(
    tinsel_id INT,
    color_name VARCHAR(50)
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated). A colleague pointed out that there are such things as 'tab-separated values' files, or TSVs. So I will be saving those files as .tsv going forward to avoid confusion.
-----------------------------------------

BULK INSERT dbo.light_colors
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 09 - Tinsel and Light Combinations\light_colors.tsv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0X0a'
);
GO


BULK INSERT dbo.tinsel_colors
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 09 - Tinsel and Light Combinations\tinsel_colors.tsv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0X0a'
);
GO

-----------------------------------------
-- 4. Sanity checks
-----------------------------------------

SELECT COUNT(*) AS row_number
FROM dbo.light_colors;
GO

SELECT TOP 10 * 
FROM dbo.light_colors;
GO

SELECT COUNT(*) AS row_number
FROM dbo.tinsel_colors;
GO

SELECT TOP 10 *
FROM dbo.tinsel_colors;
GO