const myArgs = process.argv.slice(2);
const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
  SELECT teachers.name AS teacher,
  cohorts.name AS cohort
  FROM teachers
  JOIN assistance_requests AS a_r
  ON teachers.id = a_r.teacher_id
  JOIN students
  ON a_r.student_id = students.id
  JOIN cohorts
  ON students.cohort_id = cohorts.id
  WHERE cohorts.name = '${myArgs[0] || 'JUL02'}'
  GROUP BY teacher, cohort
  ORDER BY teacher;
`, myArgs)

.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort} : ${row.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));