SELECT cohorts.name AS cohort, count(assignment_submissions.*) AS total_submissions
FROM cohorts
INNER JOIN students ON cohort.id = cohort_id
INNER JOIN assignment_submissions ON student.id = student_id
GROUP BY cohort
ORDER BY total_submissions;
