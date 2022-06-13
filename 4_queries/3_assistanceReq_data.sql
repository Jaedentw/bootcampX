SELECT teachers.name AS teacher, 
students.name AS student, 
assignments.name AS assignment, 
(a_r.completed_at - a_r.started_at) AS duration
FROM assistance_requests AS a_r
JOIN teachers
ON a_r.teacher_id = teachers.id
JOIN students
ON a_r.student_id = students.id
JOIN assignments
ON a_r.assignment_id = assignments.id
ORDER BY duration
;