-- Day 5 of SQL Advent Calendar 2025 by Interview Master
-- Elf Vacation Status

-- -- Question 1 of 1

-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return dateas "Still resting".


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
IF OBJECT_ID('elves', 'U') IS NOT NULL
    DROP TABLE dbo.elves;
GO

IF OBJECT_ID('vacations', 'U') IS NOT NULL
    DROP TABLE dbo.vacations;
GO

------------------------------
-- 2. Create the tables
------------------------------
CREATE TABLE dbo.elves
(
    elf_id INT,
    elf_name VARCHAR(100),
);
GO

CREATE TABLE dbo.vacations
(
    elf_id INT,
    start_name DATE,
    return_name DATE,
);
GO

-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT
--    (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated)
-----------------------------------------
BULK INSERT dbo.elves
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 05 - Elf Vacation Status\elves.csv'
WITH (
    FIRSTROW = 2,           -- skip header
    FIELDTERMINATOR = '\t',  -- comma-separated now
    ROWTERMINATOR = '0x0a'  -- line break
);
GO

BULK INSERT dbo.vacations
FROM 'C:\Users\jovazqu\OneDrive\04 - Education\SQL Advent Calendar\Day 05 - Elf Vacation Status\vacations.csv'
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
FROM dbo.elves;
GO

SELECT COUNT(*) AS row_count
FROM dbo.vacations;
GO