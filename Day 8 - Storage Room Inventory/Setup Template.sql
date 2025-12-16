-- Day 8 of SQL Advent Calendar by Interview Master
-- Storage Room Inventory

-- Question 1 of 1

-- Mrs. Claus is organizing the holiday storage room and wants a single list of all decorations — both Christmas trees and light sets. Write a query that combines both tables and includes each item's name and category.


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

IF OBJECT_ID('storage_lights', 'U') IS NOT NULL
    DROP TABLE dbo.storage_lights;
GO

IF OBJECT_ID('storage_trees', 'U') IS NOT NULL
    DROP TABLE dbo.storage_trees;
GO

------------------------------
-- 2. Create the tables
------------------------------

CREATE TABLE dbo.storage_lights (
    item_name VARCHAR(50),
    category VARCHAR(50)
);
GO

CREATE TABLE dbo.storage_trees
(
    item_name VARCHAR(50),
    category VARCHAR(50)
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated). A colleague pointed out that there are such things as 'tab-separated values' files, or TSVs. So I will be saving those files as .tsv going forward to avoid confusion.
-----------------------------------------

BULK INSERT dbo.storage_lights 
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 8 - Storage Room Inventory\storage_lights.tsv'
WITH (
    FIRSTROW = 2,           -- skip header
    FIELDTERMINATOR = '\t',  -- tab-separated now
    ROWTERMINATOR = '0x0a'  -- line break
);
GO

BULK INSERT dbo.storage_trees
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 8 - Storage Room Inventory\storage_trees.tsv'
WITH (
    FIRSTROW = 2,           -- skip header
    FIELDTERMINATOR = '\t',  -- tab-separated now
    ROWTERMINATOR = '0x0a'  -- line break
);
GO

-----------------------------------------
-- 4. Sanity checks
-----------------------------------------

Select COUNT(*) AS row_count
FROM dbo.storage_lights;
GO

SELECT TOP 10 *
FROM dbo.storage_lights;
GO

Select COUNT(*) AS row_count
FROM dbo.storage_trees;
GO

SELECT TOP 10*
FROM dbo.storage_trees;
GO