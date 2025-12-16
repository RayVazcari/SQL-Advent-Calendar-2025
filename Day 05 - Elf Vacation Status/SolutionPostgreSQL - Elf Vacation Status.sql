-- Day 5 of SQL Advent Calendar 2025 by Interview Master
-- Energy-Efficient Holiday Decorations

-- Question 1 of 1

-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".


--/////////////////////////////////////////////////////////////////////////////

-- Display the results.
SELECT
    e.elf_name,
    COALESCE (CAST(v.return_date AS VARCHAR(20)), 'Still resting') AS return_status
FROM elves AS e
    LEFT JOIN vacations AS v
    ON e.elf_id = v.elf_id
ORDER BY e.elf_name;


-- In this lesson I learned about using LEFT and Right joins to indicate whether or not to include all records from one table regardless of matches in the other table. I also learned about using COALESCE and CAST. COALESCE is used to replace certain values such as NULL values with a custom strings. CAST is used to convert one data type to another data type. In this case, I converted the return_date from a date data type to a string data type so that I could use COALESCE to replace NULL values with the string "Still resting".