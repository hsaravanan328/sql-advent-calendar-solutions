-- SQL Advent Calendar - Day 13
-- Title: Naughty or Nice Score Extremes
-- Difficulty: easy
--
-- Question:
-- Santa's audit team is reviewing this year's behavior scores to find the extremes — write a query to return the lowest and highest scores recorded on the Naughty or Nice list.
--
-- Santa's audit team is reviewing this year's behavior scores to find the extremes — write a query to return the lowest and highest scores recorded on the Naughty or Nice list.
--

-- Table Schema:
-- Table: behavior_scores
--   record_id: INTEGER
--   child_name: VARCHAR
--   behavior_score: INTEGER
--

-- My Solution:

SELECT record_id, child_name, behavior_score
FROM behavior_scores
WHERE behavior_score = (SELECT MIN(behavior_score) FROM behavior_scores)

UNION ALL

SELECT record_id, child_name, behavior_score
FROM behavior_scores
WHERE behavior_score = (SELECT MAX(behavior_score) FROM behavior_scores);
