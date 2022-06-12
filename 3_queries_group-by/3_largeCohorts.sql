SELECT cohorts.name AS cohort_name, count(students.*)
FROM cohorts 
JOIN students 
ON students.cohort_id = cohort.id
WHERE count(students.*) >= 18;