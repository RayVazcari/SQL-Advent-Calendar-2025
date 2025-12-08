-- Day 3 of SQL Advent Calendar 2025 by Interview Master
-- The Grinch's Best Pranks Per Target

-- -- Question 1 of 1

-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.


--/////////////////////////////////////////////////////////////////////////////

-- Select the database to use for the script. In this case, it's SQLAdvent2025.
USE SQLAdvent2025;
GO

-- Show that the table exists
SELECT *FROM grinch_prank_ideas
GO


-- Select the Pranks per target and evilness.
SELECT
    prank_id,
    target_name,
    prank_description,
    evilness_score,
    created_at,
    ROW_NUMBER() OVER (
        PARTITION BY target_name
        ORDER BY evilness_score DESC, created_at DESC
    ) AS rn
FROM grinch_prank_ideas;
GO

-- Using a windows function to rank the pranks per target, select only the top prank per target.
SELECT
    prank_id,
    target_name,
    prank_description,
    evilness_score,
    created_at
FROM (
    SELECT
        prank_id,
        target_name,
        prank_description,
        evilness_score,
        created_at,
        ROW_NUMBER() OVER (
        PARTITION BY target_name
        ORDER BY evilness_score DESC, created_at DESC
    ) AS rn
    FROM grinch_prank_ideas
) AS ranked
WHERE rn = 1
ORDER BY target_name
GO