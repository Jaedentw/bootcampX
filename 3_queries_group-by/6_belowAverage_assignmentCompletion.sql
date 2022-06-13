SELECT students.name AS student, AVG(a_s.duration) AS avg_assignment_time, AVG(assignments.duration) AS avg_estimated_time
FROM students
JOIN assignment_submissions AS a_s
ON students.id = a_s.student_id
JOIN assignments
ON assignments.id = a_s.assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING AVG(a_s.duration) < AVG(assignments.duration)
ORDER BY avg_assignment_time
;