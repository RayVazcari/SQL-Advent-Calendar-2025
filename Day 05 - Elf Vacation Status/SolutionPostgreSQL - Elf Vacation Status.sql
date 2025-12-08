-- Day 4 of SQL Advent Calendar 2025 by Interview Master
-- Energy-Efficient Holiday Decorations

-- -- Question 1 of 1

-- Kevin's trying to decorate the house without sending the electricity bill through the roof. Write a query to find the top 5 most energy-efficient decorations (i.e. lowest cost per hour to operate).


--/////////////////////////////////////////////////////////////////////////////


-- Select the database to use for the script. In this case, it's SQLAdvent2025.
USE SQLAdvent2025;
GO

-- Show that the table exists
SELECT *FROM hall_decorations
GO


-- Select the top 5 based on the energy cost.
SELECT decoration_id, decoration_name, energy_cost_per_hour
FROM hall_decorations
ORDER BY energy_cost_per_hour
LIMIT 5
