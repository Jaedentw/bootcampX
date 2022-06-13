SELECT students.name AS student, AVG(a_s.duration) AS avg_assignment_time 
FROM students
JOIN assignment_submissions AS a_s
ON students.id = a_s.student_id
WHERE end_date IS NULL
GROUP BY student
ORDER BY avg_assignment_time DESC
;


