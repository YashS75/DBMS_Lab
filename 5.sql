SELECT COUNT(*) 
FROM subjects;

SELECT COUNT(DISTINCT faculty_code)
FROM faculty_assignment
WHERE term = 'Summer'
AND academic_year = 2024;

SELECT SUM(monthly_salary)
FROM faculty
WHERE department_id = 'Information Technology';

SELECT AVG(monthly_salary)
FROM faculty
WHERE department_id = 'Information Technology';

SELECT MIN(monthly_salary)
FROM faculty;

SELECT MAX(monthly_salary)
FROM faculty;

SELECT department_id,
AVG(monthly_salary) AS average_pay
FROM faculty
GROUP BY department_id;

SELECT department_id,
AVG(monthly_salary) AS average_pay
FROM faculty
GROUP BY department_id
HAVING AVG(monthly_salary) > 60000;
