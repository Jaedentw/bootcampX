SELECT cohorts.name, avg(completed_at - started_at) as avg_assistance_time
FROM assistance_requests AS a_r
JOIN students ON students.id = a_r.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY avg_assistance_time DESC
LIMIT 1
;