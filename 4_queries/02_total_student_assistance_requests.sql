--  total_assistances |       name       
-- -------------------+------------------
--                138 | Elliot Dickinson
-- (1 row)

SELECT count(assistance_requests.*) AS total_assistances, students.name
FROM assistance_requests
INNER JOIN students ON assistance_requests.student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;