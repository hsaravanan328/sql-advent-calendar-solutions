-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH daily_message_counts AS (
    SELECT
        u.user_id,
        u.user_name,
        DATE(m.sent_at) AS message_date,
        COUNT(m.message_id) AS message_count
    FROM npn_users u
    JOIN npn_messages m
        ON u.user_id = m.sender_id
    GROUP BY
        u.user_id,
        u.user_name,
        DATE(m.sent_at)
),
max_per_day AS (
    SELECT
        message_date,
        MAX(message_count) AS max_count
    FROM daily_message_counts
    GROUP BY message_date
)
SELECT
    d.message_date,
    d.user_id,
    d.user_name,
    d.message_count
FROM daily_message_counts d
JOIN max_per_day m
    ON d.message_date = m.message_date
   AND d.message_count = m.max_count
ORDER BY d.message_date, d.user_id;
