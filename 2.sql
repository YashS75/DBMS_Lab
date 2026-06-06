DROP TABLE IF EXISTS faculty_assignment;
DROP TABLE IF EXISTS enrollment_details;
DROP TABLE IF EXISTS class_rooms;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS learners;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id VARCHAR(30),
    block_location VARCHAR(30) DEFAULT 'Central Block',
    annual_budget DECIMAL(12,2),
    PRIMARY KEY (department_id),
    CONSTRAINT budget_limit CHECK (annual_budget > 1000)
);

CREATE TABLE faculty (
    faculty_code CHAR(5),
    faculty_fullname VARCHAR(35) NOT NULL,
    department_id VARCHAR(30),
    monthly_salary DECIMAL(8,2) DEFAULT 45000.00,
    faculty_email VARCHAR(60),
    PRIMARY KEY (faculty_code),
    UNIQUE (faculty_email),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT salary_limit CHECK (monthly_salary >= 20000)
);

CREATE TABLE learners (
    learner_id VARCHAR(5),
    learner_name VARCHAR(35) NOT NULL,
    department_id VARCHAR(30),
    earned_credits DECIMAL(3,0) DEFAULT 0,
    PRIMARY KEY (learner_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT credit_rule CHECK (earned_credits >= 0)
);

CREATE TABLE subjects (
    subject_id VARCHAR(8),
    subject_name VARCHAR(55) NOT NULL,
    department_id VARCHAR(30),
    credit_value DECIMAL(2,0) DEFAULT 4,
    PRIMARY KEY (subject_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT credit_check CHECK (credit_value > 0)
);

CREATE TABLE class_rooms (
    subject_id VARCHAR(8),
    section_code VARCHAR(8),
    term VARCHAR(12),
    academic_year DECIMAL(4,0),
    block_name VARCHAR(30),
    room_id VARCHAR(10),
    PRIMARY KEY (subject_id, section_code, term, academic_year),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    CONSTRAINT year_rule CHECK (academic_year >= 2020)
);

CREATE TABLE enrollment_details (
    learner_id VARCHAR(5),
    subject_id VARCHAR(8),
    section_code VARCHAR(8),
    term VARCHAR(12),
    academic_year DECIMAL(4,0),
    final_grade VARCHAR(2),
    PRIMARY KEY (learner_id, subject_id, section_code, term, academic_year),
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (subject_id, section_code, term, academic_year)
    REFERENCES class_rooms(subject_id, section_code, term, academic_year)
);

CREATE TABLE faculty_assignment (
    faculty_code CHAR(5),
    subject_id VARCHAR(8),
    section_code VARCHAR(8),
    term VARCHAR(12),
    academic_year DECIMAL(4,0),
    PRIMARY KEY (faculty_code, subject_id, section_code, term, academic_year),
    FOREIGN KEY (faculty_code) REFERENCES faculty(faculty_code),
    FOREIGN KEY (subject_id, section_code, term, academic_year)
    REFERENCES class_rooms(subject_id, section_code, term, academic_year)
);
