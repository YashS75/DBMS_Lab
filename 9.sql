CREATE VIEW faculty_overview AS
SELECT faculty_code, faculty_fullname, department_id
FROM faculty;

CREATE OR REPLACE VIEW faculty_overview AS
SELECT faculty_code, faculty_fullname, department_id, monthly_salary
FROM faculty;

DROP VIEW faculty_overview;

CREATE INDEX faculty_name_index
ON faculty (faculty_fullname);

CREATE UNIQUE INDEX faculty_mail_index
ON faculty (faculty_email);

DROP INDEX faculty_name_index ON faculty;
