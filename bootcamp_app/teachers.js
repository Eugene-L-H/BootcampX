const { Pool } = require('pg');


const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
  SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
  FROM teachers
  INNER JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
  INNER JOIN students ON students.id = assistance_requests.student_id
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE $1
  ORDER BY teacher;
`;

const cohortName = process.argv.slice(2);
const values = [`%${cohortName}%`];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
}); 