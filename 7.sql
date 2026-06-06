(SELECT subject_id
FROM class_rooms
WHERE term = 'Winter'
AND academic_year = 2023)

UNION

(SELECT subject_id
FROM class_rooms
WHERE term = 'Summer'
AND academic_year = 2024);

(SELECT subject_id
FROM class_rooms
WHERE term = 'Winter'
AND academic_year = 2023)

UNION ALL

(SELECT subject_id
FROM class_rooms
WHERE term = 'Summer'
AND academic_year = 2024);

(SELECT subject_id
FROM class_rooms
WHERE term = 'Winter'
AND academic_year = 2023)

INTERSECT

(SELECT subject_id
FROM class_rooms
WHERE term = 'Summer'
AND academic_year = 2024);

(SELECT subject_id
FROM class_rooms
WHERE term = 'Winter'
AND academic_year = 2023)

EXCEPT

(SELECT subject_id
FROM class_rooms
WHERE term = 'Summer'
AND academic_year = 2024);
