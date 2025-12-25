-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

WITH date_col as(
  SELECT subject, min(quiz_date) AS first_date, 
  max(quiz_date) AS last_date
  FROM daily_quiz_scores
  GROUP BY subject
)
  
SELECT q.subject,
MAX(CASE WHEN q.quiz_date = d.first_date THEN q.score END) AS first_sccore,
MAX(CASE WHEN q.quiz_date = d.last_date THEN q.score END) AS last_sccore
FROM daily_quiz_scores q
JOIN date_col d
ON d.subject = q.subject
GROUP BY q.subject
