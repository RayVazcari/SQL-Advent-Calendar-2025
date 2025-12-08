-- Select the database to use for the script. In this case, it's SQLAdvent2025.
USE SQLAdvent2025;
GO

-- Show that the table exists
SELECT * FROM reindeer_run_results

-- -- Select the columns to use for the script. In this case, it's Name and Rank 
SELECT TOP 7 name, rank
FROM reindeer_run_results
ORDER BY rank
GO


--//////////////////////////////////////////////////////////////////////////

-- -- Now in PostgreSQL
-- -- Show that the table exists
-- SELECT *FROM reindeer_run_results

-- -- -- Select the columns to use for the script. In this case, it's Name and Rank 
-- SELECT name, rank
-- FROM reindeer_run_results
-- ORDER BY rank
-- LIMIT 7;
