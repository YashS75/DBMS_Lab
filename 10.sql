SELECT UCASE(faculty_fullname)
FROM faculty;

SELECT LCASE(faculty_fullname)
FROM faculty;

SELECT CONCAT(faculty_fullname, ' belongs to ', department_id)
FROM faculty;

SELECT CHAR_LENGTH(faculty_fullname)
FROM faculty;

SELECT SUBSTR(faculty_fullname, 1, 4)
FROM faculty;

CREATE TABLE faculty_salary_history (
    faculty_id CHAR(5),
    previous_salary DECIMAL(8,2),
    updated_salary DECIMAL(8,2),
    modified_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER track_salary_changes
AFTER UPDATE ON faculty
FOR EACH ROW
INSERT INTO faculty_salary_history
(faculty_id, previous_salary, updated_salary)
VALUES
(OLD.faculty_code, OLD.monthly_salary, NEW.monthly_salary);
