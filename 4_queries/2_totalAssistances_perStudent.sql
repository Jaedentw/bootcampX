SELECT COUNT(a_r.*) AS total_assistances, students.name AS name
FROM assistance_requests AS a_r
JOIN students
ON a_r.student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY name
;