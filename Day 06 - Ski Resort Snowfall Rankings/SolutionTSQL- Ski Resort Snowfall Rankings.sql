-- Day 6 of SQL Advent Calendar by Interview Master
-- Ski Resort Snowfall Rankings

-- Question 1 of 1

-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?

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
FROM dbo.resort_monthly_snowfall;
GO

SELECT TOP 10
    *
FROM dbo.resort_monthly_snowfall;
GO

-----------------------------------------
-- 3. Working towards the solution
-----------------------------------------

-- The prompt is specifically asking us to bucket or group and display, all the ski resorts into quartiles. Quartiles are four equal groups. When we approach this problem, we have to think by what metric do we want to group these different ski resorts. 
-- In this case, Since our original data contains multiple rows of the resorts and the snowfall in inches depending on the month, we first need to aggregate the data to get the annual snowfall for each resort. 
-- Once we have that, we can use A new function and a new concept that I learned today regarding SQL. The NTILE function to divide the resorts into four quartiles based on their annual snowfall.

-- The first step here will be to come up with a specific expression or function. That selects and displays. The sum of the snowfall. Per resort.

SELECT 
    resort_name,
    SUM (snowfall_inches) AS annual_snowfall
FROM dbo.resort_monthly_snowfall
GROUP BY resort_name
GO

--  Now that we have this. We can start thinking about how we're gonna be bucketing or grouping. And categorizing. The resort's annual snowfall. Into quartiles. We needed a window function, That is meant to split order rows into N number of groups as evenly as possible. SQL already has a window function like this called NTILE. NTILE takes a single argument, which is the number of groups you want to create. In this case, we want to create four groups or quartiles. So we will pass in the number 4 as the argument to NTILE and order the results by the annual snowfall in descending order.

-----------------------------------------
-- 4. Final solution
-----------------------------------------

SELECT 
    resort_name,
    SUM (snowfall_inches) AS annual_snowfall,
    NTILE(4) OVER (ORDER BY SUM (snowfall_inches) DESC) AS snowfall_quartile
FROM dbo.resort_monthly_snowfall
GROUP BY resort_name
ORDER BY snowfall_quartile, annual_snowfall DESC;
GO

