--       teacher       | cohort 
-- --------------------+--------
--  Cheyanne Powlowski | JUL02
--  Georgiana Fahey    | JUL02
--  Helmer Rodriguez   | JUL02
--  Jadyn Bosco        | JUL02
-- ...
-- (8 rows)

SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohorts
FROM teachers
INNER JOIN assistance_requests ON teachers.id = teacher_id
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;