const { Pool } = require('pg');

const cohortName = process.argv.slice(2);

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohorts
FROM teachers
INNER JOIN assistance_requests ON teachers.id = teacher_id
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE '%${cohortName || 'JUL02'}%'
ORDER BY teacher;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohorts}: ${user.teacher}`);
  })
});