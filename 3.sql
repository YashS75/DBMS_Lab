INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Information Technology', 'Newton Block', 12000000.00);

INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Mechanical Engineering', 'Tesla Block', 8500000.00);

INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Civil Engineering', 'Galileo Block', 9100000.00);

INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Management Studies', 'Chanakya Center', 4800000.00);

INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Mathematics', 'Aryan Hall', 6200000.00);

INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Fine Arts', 'Kalidas Hall', 2700000.00);

INSERT INTO departments (department_id, block_location, annual_budget)
VALUES ('Psychology', 'Humanities Block', 3500000.00);

INSERT INTO faculty 
(faculty_code, faculty_fullname, department_id, monthly_salary, faculty_email)
VALUES
('F1001', 'Dr. Mehta', 'Information Technology', 68000.00, 'mehta@campus.edu'),
('F1002', 'Prof. Nair', 'Information Technology', 72000.00, 'nair@campus.edu'),
('F1003', 'Dr. Kulkarni', 'Mechanical Engineering', 81000.00, 'kulkarni@campus.edu'),
('F1004', 'Prof. Menon', 'Civil Engineering', 79000.00, 'menon@campus.edu'),
('F1005', 'Dr. Desai', 'Management Studies', 95000.00, 'desai@campus.edu'),
('F1006', 'Prof. Joshi', 'Mathematics', 87000.00, 'joshi@campus.edu'),
('F1007', 'Dr. Fernandes', 'Psychology', 56000.00, 'fernandes@campus.edu'),
('F1008', 'Prof. Kapoor', 'Fine Arts', 47000.00, 'kapoor@campus.edu'),
('F1009', 'Dr. Pillai', 'Mechanical Engineering', 76000.00, 'pillai@campus.edu'),
('F1010', 'Prof. Bansal', 'Information Technology', 91000.00, 'bansal@campus.edu');

INSERT INTO learners
(learner_id, learner_name, department_id, earned_credits)
VALUES
('S101', 'Aditya Sharma', 'Information Technology', 88),
('S102', 'Karan Malhotra', 'Mechanical Engineering', 72),
('S103', 'Priya Nair', 'Civil Engineering', 110),
('S104', 'Neha Kapoor', 'Management Studies', 96),
('S105', 'Ritesh Verma', 'Mathematics', 65),
('S106', 'Sanya Mehra', 'Psychology', 54),
('S107', 'Vivek Rao', 'Fine Arts', 140);

INSERT INTO subjects
(subject_id, subject_name, department_id, credit_value)
VALUES
('IT-401', 'Cloud Computing', 'Information Technology', 4),
('IT-402', 'Machine Learning', 'Information Technology', 4),
('ME-210', 'Thermodynamics', 'Mechanical Engineering', 3),
('CE-115', 'Structural Design', 'Civil Engineering', 4),
('MS-101', 'Business Analytics', 'Management Studies', 3),
('MA-201', 'Linear Algebra', 'Mathematics', 4),
('PS-111', 'Cognitive Psychology', 'Psychology', 3);

INSERT INTO class_rooms
(subject_id, section_code, term, academic_year, block_name, room_id)
VALUES
('IT-401', 'A1', 'Winter', 2023, 'Newton Block', '401'),
('IT-402', 'A1', 'Summer', 2024, 'Newton Block', '402'),
('ME-210', 'B1', 'Winter', 2023, 'Tesla Block', '210'),
('CE-115', 'C1', 'Summer', 2024, 'Galileo Block', '115'),
('MA-201', 'D1', 'Winter', 2023, 'Aryan Hall', '201');

INSERT INTO enrollment_details
(learner_id, subject_id, section_code, term, academic_year, final_grade)
VALUES
('S101', 'IT-401', 'A1', 'Winter', 2023, 'A'),
('S101', 'IT-402', 'A1', 'Summer', 2024, 'B'),
('S102', 'ME-210', 'B1', 'Winter', 2023, 'A'),
('S103', 'CE-115', 'C1', 'Summer', 2024, 'B'),
('S105', 'MA-201', 'D1', 'Winter', 2023, 'A');

INSERT INTO faculty_assignment
(faculty_code, subject_id, section_code, term, academic_year)
VALUES
('F1001', 'IT-401', 'A1', 'Winter', 2023),
('F1010', 'IT-402', 'A1', 'Summer', 2024),
('F1003', 'ME-210', 'B1', 'Winter', 2023),
('F1004', 'CE-115', 'C1', 'Summer', 2024),
('F1006', 'MA-201', 'D1', 'Winter', 2023);

UPDATE faculty
SET monthly_salary = monthly_salary + 5000;

UPDATE faculty
SET monthly_salary = monthly_salary * 1.08
WHERE monthly_salary < 70000;

UPDATE faculty
SET monthly_salary =
CASE
    WHEN monthly_salary <= 90000 THEN monthly_salary * 1.06
    ELSE monthly_salary * 1.04
END;

DELETE FROM learners;

DELETE FROM faculty
WHERE department_id = 'Management Studies';

DELETE FROM faculty
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE block_location = 'Newton Block'
);
