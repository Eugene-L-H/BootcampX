SELECT students.name as student,
count(assignment_submissions.*) as total_submissions
FROM students
INNER JOIN assignment_submissions ON students.id = student_id
GROUP BY students.name;

-- Return submissions by currently enrolled students
SELECT students.name as student,
count(assignment_submissions.*) as total_submissions
FROM students
INNER JOIN assignment_submissions ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

-- Return submissions by students with less than 100
SELECT students.name as student,
count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
INNER JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;