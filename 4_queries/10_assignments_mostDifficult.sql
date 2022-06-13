SELECT a.id, a.name, a.day, a.chapter, COUNT(a_r.assignment_id) AS total_requests
FROM assignments AS a
JOIN assistance_requests AS a_r
ON a.id = a_r.assignment_id
GROUP BY a.id
ORDER BY total_requests DESC
;