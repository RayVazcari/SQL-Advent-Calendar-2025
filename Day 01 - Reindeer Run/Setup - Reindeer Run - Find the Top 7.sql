-- Day 1 of SQL Advent Calendar
-- by Interview Master

-- Every year, the city
-- of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Write a query to return the name and rank of the top 7 reindeers in this race.

-- Question 1 of 1

-- Every year, the city of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Can you write a query to
-- return the
-- name and rank of the top 7 reindeers in this race?

--/////////////////////////////////////////////////////////////////////////////


-- SQL script to create a table and load data from a CSV file

-- 👇 Change the name of the database to match your own
-- If you don't have a database called SQLAdvent2025, run this line
-- CREATE DATABASE SQLAdvent2025;
-- Then run this line to use it and reuse the connection for the future
USE SQLAdvent2025;
GO

-- 👇 Define the Table
IF OBJECT_ID('dbo.reindeer_run_results', 'U') IS NOT NULL
    DROP TABLE dbo.reindeer_run_results;
GO

CREATE TABLE dbo.reindeer_run_results
(
    number INT,
    name VARCHAR(100),
    rank INT,
    color VARCHAR(50)
);
GO

-- -- 👇 Update this path to match where the CSV is on *your* machine
-- BULK INSERT dbo.reindeer_run_results
-- FROM 'C:\Users\ramon\Downloads\SQLDatabases\SQLADVENT2025\reindeer_run_results.csv'
-- WITH (
--     FIRSTROW = 2,               -- skip header row
--     FIELDTERMINATOR = ',',      -- comma-separated
--     ROWTERMINATOR = '0x0a'      -- line break
-- );
-- GO

-- 👇 Update this path to match where the CSV is on *your* machine
INSERT INTO dbo.reindeer_run_results
    (number, name, rank, color)
VALUES
    (1, 'Dasher', 1, 'Brown'),
    (2, 'Dancer', 2, 'Tan'),
    (3, 'Prancer', 3, 'White'),
    (4, 'Vixen', 4, 'Grey'),
    (5, 'Comet', 5, 'Golden'),
    (6, 'Cupid', 6, 'Beige'),
    (7, 'Donner', 7, 'Chestnut'),
    (8, 'Blitzen', 8, 'Dark Brown'),
    (9, 'Rudolph', 9, 'Red'),
    (10, 'Olive', 10, 'Olive'),
    (11, 'Fireball', 11, 'Orange'),
    (12, 'Clarice', 12, 'Cream'),
    (13, 'Jingle', 13, 'Silver'),
    (14, 'Jangle', 14, 'Copper'),
    (15, 'Snowflake', 15, 'White'),
    (16, 'Frostbite', 16, 'Ice Blue'),
    (17, 'Twinkle', 17, 'Sparkle White'),
    (18, 'Sparkle', 18, 'Glitter Gold'),
    (19, 'Candy Cane', 19, 'Red and White'),
    (20, 'Gingerbread', 20, 'Ginger Brown'),
    (21, 'Mistletoe', 21, 'Green'),
    (22, 'Holly', 22, 'Deep Green'),
    (23, 'Nutcracker', 23, 'Walnut Brown'),
    (24, 'Tinsel', 24, 'Metallic Silver'),
    (25, 'Evergreen', 25, 'Pine Green'),
    (26, 'Starlight', 26, 'Yellow'),
    (27, 'Moonbeam', 27, 'Pale Silver'),
    (28, 'Sugarplum', 28, 'Purple'),
    (29, 'Peppermint', 29, 'Mint Green'),
    (30, 'Eggnog', 30, 'Cream Yellow');
GO

SELECT COUNT(*) AS row_count
FROM dbo.reindeer_run_results;
GO
