-- Day 17 of SQL Advent Calendar by Interview Master
-- Evening Task Categories

-- Question 1 of 1

-- During a quiet evening of reflection, Cindy Lou wants to categorize her tasks based on how peaceful they are. Can you write a query that adds a new column classifying each task as 'Calm' if its noise_level is below 50, and 'Chaotic' otherwise?


-- ===============================================================

-- SQL script to create a table and load data from a txt file
-- 👇 Change the name of the database to match your own
-- If you don't have a database called SQLAdvent2025, run this line
-- CREATE DATABASE SQLAdvent2025;
-- Then run this line to use it and reuse the connection for the future



----------------------------------------------------
-- 1. Drop existing tables if they exist
----------------------------------------------------



------------------------------
-- 2. Create the tables
------------------------------



-----------------------------------------
-- 3. Load data from CSVs using BULK INSERT (CSVs must be in a folder SQL Server can read)
-- Note, how your files are separated depends on your file. I was incorrectly using commas, and upon further review, I found that the CSVs were actually tab-separated). A colleague pointed out that there are such things as 'tab-separated values' files, or TSVs. So I will be saving those files as .tsv going forward to avoid confusion.
-----------------------------------------



-----------------------------------------
-- 4. Sanity checks
-----------------------------------------

