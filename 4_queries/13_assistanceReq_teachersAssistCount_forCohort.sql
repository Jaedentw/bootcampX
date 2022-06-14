SELECT teachers.name AS teacher,
cohorts.name AS cohort,
COUNT(a_r.*) AS total_assistances
FROM teachers
JOIN assistance_requests AS a_r
ON teachers.id = a_r.teacher_id
JOIN students
ON a_r.student_id = students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher
;