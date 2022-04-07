--       teacher       | cohort | total_assistances 
-- --------------------+--------+-------------------
--  Cheyanne Powlowski | JUL02  |               336
--  Georgiana Fahey    | JUL02  |               158
--  Helmer Rodriguez   | JUL02  |               157
--  Jadyn Bosco        | JUL02  |               177
-- ...
-- (8 rows)

-- SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests.*) AS total_assistances
-- FROM teachers
-- INNER JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
-- INNER JOIN students ON students.id = assistance_requests.student_id
-- INNER JOIN cohorts ON cohorts.id = students.cohort_id
-- GROUP BY teacher, cohort
-- ORDER BY cohort;

SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;