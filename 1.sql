CREATE DATABASE college_management;
USE college_management;

CREATE TABLE departments (
    department_name VARCHAR(35),
    block_name VARCHAR(35),
    yearly_budget DECIMAL(12,2),
    PRIMARY KEY (department_name)
);

CREATE TABLE faculty (
    faculty_id CHAR(5),
    faculty_name VARCHAR(35) NOT NULL,
    department_name VARCHAR(35),
    pay DECIMAL(9,2),
    PRIMARY KEY (faculty_id),
    FOREIGN KEY (department_name) REFERENCES departments(department_name)
);

CREATE TABLE learners (
    student_id VARCHAR(5),
    student_name VARCHAR(35) NOT NULL,
    department_name VARCHAR(35),
    total_credits DECIMAL(3,0),
    PRIMARY KEY (student_id),
    FOREIGN KEY (department_name) REFERENCES departments(department_name)
);

CREATE TABLE subjects (
    subject_code VARCHAR(8),
    subject_title VARCHAR(55),
    department_name VARCHAR(35),
    credit_hours DECIMAL(2,0),
    PRIMARY KEY (subject_code),
    FOREIGN KEY (department_name) REFERENCES departments(department_name)
);

CREATE TABLE class_section (
    subject_code VARCHAR(8),
    section_no VARCHAR(8),
    session_semester VARCHAR(12),
    session_year DECIMAL(4,0),
    hall_name VARCHAR(35),
    hall_room VARCHAR(10),
    PRIMARY KEY (subject_code, section_no, session_semester, session_year),
    FOREIGN KEY (subject_code) REFERENCES subjects(subject_code)
);

CREATE TABLE enrollment (
    student_id VARCHAR(5),
    subject_code VARCHAR(8),
    section_no VARCHAR(8),
    session_semester VARCHAR(12),
    session_year DECIMAL(4,0),
    result_grade VARCHAR(2),
    PRIMARY KEY (student_id, subject_code, section_no, session_semester, session_year),
    FOREIGN KEY (student_id) REFERENCES learners(student_id),
    FOREIGN KEY (subject_code, section_no, session_semester, session_year)
    REFERENCES class_section(subject_code, section_no, session_semester, session_year)
);

CREATE TABLE assigned_courses (
    faculty_id CHAR(5),
    subject_code VARCHAR(8),
    section_no VARCHAR(8),
    session_semester VARCHAR(12),
    session_year DECIMAL(4,0),
    PRIMARY KEY (faculty_id, subject_code, section_no, session_semester, session_year),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
    FOREIGN KEY (subject_code, section_no, session_semester, session_year)
    REFERENCES class_section(subject_code, section_no, session_semester, session_year)
);

DESC faculty;

ALTER TABLE faculty ADD last_name VARCHAR(40);

ALTER TABLE faculty MODIFY last_name VARCHAR(60);

ALTER TABLE faculty DROP COLUMN last_name;

RENAME TABLE enrollment TO course_enrollment;

RENAME TABLE course_enrollment TO enrollment;

CREATE TABLE temp_storage (
    temp_number INT PRIMARY KEY
);

DROP TABLE temp_storage;
