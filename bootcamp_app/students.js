const myArgs = process.argv.slice(2);
const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
  SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
  FROM students
  JOIN cohorts
  ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE '%${myArgs[0]}%'
  LIMIT ${myArgs[1] || 5};
`, myArgs)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));