-- Day 8 of SQL Advent Calendar by Interview Master
-- Storage Room Inventory

-- Question 1 of 1

-- Mrs. Claus is organizing the holiday storage room and wants a single list of all decorations — both Christmas trees and light sets. Write a query that combines both tables and includes each item's name and category.


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
FROM storage_lights;
GO

SELECT TOP 10 * 
FROM storage_lights;
GO

SELECT COUNT(*) AS row_count
FROM storage_trees;
GO

SELECT TOP 10 *
FROM storage_trees;
GO

-----------------------------------------
-- 3. Working towards the solution
-----------------------------------------
-- OK. This one doesn't seem that bad. All I need to do is combine both tables. Since both of them share the same column names. I think there should be some sort of function that would do this for us. 
-- After researching, I found that UNION is an operator that can be used to combine two SELECT statements into one result set.

SELECT item_name, category FROM storage_lights  
UNION ALL 
SELECT item_name, category FROM storage_trees
GO

-----------------------------------------
-- 4. Final solution
-----------------------------------------
-- To ensure the result is sorted by item_name, I will add an ORDER BY clause.

SELECT item_name, category FROM storage_lights
UNION ALL
SELECT item_name, category FROM storage_trees
ORDER BY item_name;
GO
