SELECT COUNT(a_r.*) AS total_assistances, teachers.name AS name
FROM assistance_requests AS a_r
JOIN teachers
ON teachers.id = a_r.teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name
;