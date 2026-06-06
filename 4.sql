SELECT faculty_fullname FROM faculty;

SELECT * FROM faculty;

SELECT DISTINCT department_id FROM faculty;

SELECT department_id FROM faculty;

SELECT faculty_fullname
FROM faculty
WHERE department_id = 'Information Technology';

SELECT faculty_fullname
FROM faculty
WHERE department_id = 'Information Technology'
AND monthly_salary > 85000;

SELECT DISTINCT faculty_fullname
FROM faculty
ORDER BY faculty_fullname ASC;

SELECT faculty_fullname
FROM faculty
ORDER BY faculty_fullname DESC;

SELECT faculty_fullname
FROM faculty
ORDER BY department_id, faculty_fullname;

SELECT faculty_fullname
FROM faculty
WHERE monthly_salary BETWEEN 70000 AND 95000;

SELECT DISTINCT faculty_fullname
FROM faculty
WHERE faculty_fullname NOT IN ('Prof. Kapoor', 'Newton');

SELECT faculty_fullname
FROM faculty
WHERE faculty_fullname LIKE '%an%';

SELECT faculty_fullname
FROM faculty
WHERE faculty_fullname LIKE '200 \%' ESCAPE '\';

SELECT faculty_fullname
FROM faculty
WHERE monthly_salary IS NULL;

SELECT faculty_fullname
FROM faculty
WHERE monthly_salary IS NOT NULL;
