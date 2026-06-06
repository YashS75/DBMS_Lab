SELECT *
FROM faculty, faculty_assignment;

SELECT faculty_fullname, subject_id
FROM faculty, faculty_assignment
WHERE faculty.faculty_code = faculty_assignment.faculty_code;

SELECT faculty_fullname, subject_id
FROM faculty
INNER JOIN faculty_assignment
ON faculty.faculty_code = faculty_assignment.faculty_code;

SELECT faculty_fullname, subject_id
FROM faculty
LEFT JOIN faculty_assignment
ON faculty.faculty_code = faculty_assignment.faculty_code;

SELECT faculty_fullname, subject_id
FROM faculty
RIGHT JOIN faculty_assignment
ON faculty.faculty_code = faculty_assignment.faculty_code;

SELECT faculty_fullname, subject_id
FROM faculty
LEFT JOIN faculty_assignment
ON faculty.faculty_code = faculty_assignment.faculty_code

UNION

SELECT faculty_fullname, subject_id
FROM faculty
RIGHT JOIN faculty_assignment
ON faculty.faculty_code = faculty_assignment.faculty_code;

SELECT A.faculty_fullname
FROM faculty AS A, faculty AS B
WHERE A.monthly_salary > B.monthly_salary
AND B.department_id = 'Information Technology';
