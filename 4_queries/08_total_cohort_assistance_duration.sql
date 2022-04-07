--  cohort | total_duration 
-- --------+----------------
--  JUL30  | 390:35:20
--  AUG27  | 398:19:00
--  JUL02  | 453:50:30
--  NOV19  | 462:34:40
--  MAY07  | 480:10:55
--  ...
--  (11 rows)

SELECT cohorts.name AS cohort, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
FROM assistance_requests
INNER JOIN students ON students.id = student_id
INNER JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;