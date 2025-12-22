-- Day 9 of SQL Advent Calendar by Interview Master
-- Snowflake Types Count

-- Question 1 of 1

-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").


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
FROM light_colors;
GO

SELECT TOP 10 * 
FROM light_colors;
GO

SELECT COUNT(*) AS row_count
FROM tinsel_colors;
GO

SELECT TOP 10 * 
FROM tinsel_colors;
GO

-----------------------------------------
-- 3. Working towards the solution
-----------------------------------------
-- So for this specific exercise. The prompt is asking to write a query that generates every possible pairing of tinsel colors and light colors. We also have to add a column that combines those two values separated by a dash. The way that I see this problem. Coma is that I would need to select, Or display. Both color_name columns, from the light_colors table and the the tinsel_colors table. Since both tables have the same name for the column in question, I would have to assign aliases. To both tables and those columns as well.ABORT
-- After some research I was able to find that I need to have a cross join. The CROSS JOIN function returns all possible combinations of rows from both tables.
-- Also, I found out that I needed to use a concatenation function. Concatenation in SQL is the process of combining two or more strings into a single string. 
-- So that means that for my output. I would need to select or display. Both the color name columns. In my final table and add a New column. Concatenates and combines both of those column values.

SELECT t.color_name, l.color_name, CONCAT(t.color_name, '-', l.color_name) AS tinsel_light_pairing
FROM light_colors AS l
CROSS JOIN tinsel_colors AS t
ORDER BY t.color_name, l.color_name;
GO

-----------------------------------------
-- 4. Final solution
-----------------------------------------

SELECT t.color_name, l.color_name, CONCAT(t.color_name, '-', l.color_name) AS tinsel_light_pairing
FROM light_colors AS l
CROSS JOIN tinsel_colors AS t
ORDER BY t.color_name, l.color_name;
GO