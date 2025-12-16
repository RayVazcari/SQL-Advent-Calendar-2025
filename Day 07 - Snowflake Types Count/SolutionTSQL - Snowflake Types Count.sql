-- Day 7 of SQL Advent Calendar by Interview Master
-- Snowflake Types Count

-- Question 1 of 1

-- Frosty wants to know how many unique snowflake types were recorded on the December 24th, 2025 storm. Can you help him?


-- ===============================================================


-----------------------------------------
-- 1. Define the database context
-----------------------------------------

USE SQLAdvent2025;
GO

-----------------------------------------
-- 2. Sanity checks and show that the tables exist
-----------------------------------------

SELECT COUNT(*) AS row_count
FROM dbo.snowfall_log;
GO

SELECT TOP 10 * FROM dbo.snowfall_log;
GO

-----------------------------------------
-- 3. Working towards the solution
-----------------------------------------
-- The prompt is asking us. To display or select. How many unique snowflake types recorded? On the December 24th, 2025 storm. When looking at the data, I am able to see that there are multiple dates besides. December 24th, 2025. Majority of the data is from that date, but there are dates from the 23rd and the 25th which we need to get rid of because Those would not be relevant to the prompt. 
-- I need to find a script or function that is able to filter out the date time Off the data set. So that way we only have December 24th.
-- Then we probably need a function that is able to count how many times a specific string is recorded or it's mentioned on the data frame.
-- The two functions that I will be using to achieve this is the COUNT DISTINCT function and the CAST function to convert the date time into a date only format.

SELECT 
    COUNT (DISTINCT flake_type) AS unique_snowflake_types
FROM dbo.snowfall_log
WHERE fall_time >= '2025-12-24' AND fall_time < '2025-12-25'
GO

SELECT DISTINCT flake_type
FROM dbo.snowfall_log
WHERE CAST(fall_time AS DATE) = '2025-12-24'
ORDER BY flake_type;
GO

-----------------------------------------
-- 4. Final solution
-----------------------------------------

SELECT
    COUNT (DISTINCT flake_type) AS unique_snowflake_types
FROM dbo.snowfall_log
WHERE fall_time >= '2025-12-24' AND fall_time < '2025-12-25'
GO

SELECT DISTINCT flake_type
FROM dbo.snowfall_log
WHERE CAST(fall_time AS DATE) = '2025-12-24'
ORDER BY flake_type;
GO
