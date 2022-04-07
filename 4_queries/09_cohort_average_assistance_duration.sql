--  average_total_duration 
-- ------------------------
--  555:22:25.909091
-- (1 row)

SELECT AVG(total_duration) as average_total_duration
FROM (
    SELECT cohorts.name AS cohort, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
    FROM assistance_requests
    INNER JOIN students ON students.id = student_id
    INNER JOIN cohorts ON cohorts.id = cohort_id
    GROUP BY cohorts.name
    ORDER BY total_duration
  ) AS avg_durations;