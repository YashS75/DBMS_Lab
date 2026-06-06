SELECT faculty_fullname
FROM faculty
WHERE monthly_salary >
(
    SELECT AVG(monthly_salary)
    FROM faculty
);

SELECT faculty_fullname
FROM faculty
WHERE monthly_salary > SOME
(
    SELECT monthly_salary
    FROM faculty
    WHERE department_id = 'Mechanical Engineering'
);

SELECT DISTINCT subject_id
FROM class_rooms
WHERE term = 'Winter'
AND academic_year = 2023
AND subject_id IN
(
    SELECT subject_id
    FROM class_rooms
    WHERE term = 'Summer'
    AND academic_year = 2024
);

SELECT department_id,
(
    SELECT COUNT(*)
    FROM faculty
    WHERE departments.department_id = faculty.department_id
) AS total_faculty
FROM departments;

SELECT subject_id
FROM class_rooms AS C1
WHERE term = 'Winter'
AND academic_year = 2023
AND EXISTS
(
    SELECT *
    FROM class_rooms AS C2
    WHERE term = 'Summer'
    AND academic_year = 2024
    AND C1.subject_id = C2.subject_id
);

SELECT DISTINCT L.learner_id, L.learner_name
FROM learners AS L
WHERE NOT EXISTS
(
    (SELECT subject_id
     FROM subjects
     WHERE department_id = 'Mechanical Engineering')

    EXCEPT

    (SELECT E.subject_id
     FROM enrollment_details AS E
     WHERE L.learner_id = E.learner_id)
);

SELECT faculty_fullname
FROM faculty
WHERE monthly_salary > ANY
(
    SELECT monthly_salary
    FROM faculty
    WHERE department_id = 'Mechanical Engineering'
);

SELECT faculty_fullname
FROM faculty
WHERE monthly_salary > ALL
(
    SELECT monthly_salary
    FROM faculty
    WHERE department_id = 'Mechanical Engineering'
);
