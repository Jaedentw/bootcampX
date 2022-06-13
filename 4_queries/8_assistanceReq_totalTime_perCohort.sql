SELECT cohorts.name AS name, SUM(a_r.completed_at - a_r.started_at) AS total_duration
FROM assistance_requests AS a_r
JOIN students
ON student_id = students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_duration
;