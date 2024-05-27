--Equipment
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1, 'First Aid Kit', 50);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-02-20', 'YYYY-MM-DD'), 2, 'Stethoscope', 30);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-03-10', 'YYYY-MM-DD'), 3, 'Blood Pressure Monitor', 70);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-04-05', 'YYYY-MM-DD'), 4, 'Thermometer', 20);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-05-15', 'YYYY-MM-DD'), 5, 'Glucose Meter', 40);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-06-25', 'YYYY-MM-DD'), 6, 'Oxygen Tank', 25);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-07-30', 'YYYY-MM-DD'), 7, 'Defibrillator', 60);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-08-15', 'YYYY-MM-DD'), 8, 'Surgical Gloves', 350);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-09-10', 'YYYY-MM-DD'), 9, 'Face Mask', 500);
INSERT INTO Equipment (e_date, e_id, e_name, amount) VALUES (TO_DATE('2023-10-05', 'YYYY-MM-DD'), 10, 'CPR Manikin', 15);
--Courses
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Basic First Aid', 1, 'Medical', 'Required', 'None');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('CPR', 2, 'Medical', 'Required', 'Basic First Aid');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Advanced Life Support', 3, 'Medical', 'Required', 'CPR');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Trauma Care', 4, 'Medical', 'Required', 'Basic First Aid');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Pediatric Care', 5, 'Medical', 'Required', 'Basic First Aid');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Emergency Response', 6, 'Medical', 'Required', 'None');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Disaster Management', 7, 'Management', 'Optional', 'Emergency Response');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Health and Safety', 8, 'Safety', 'Required', 'None');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Wilderness First Aid', 9, 'Medical', 'Optional', 'Basic First Aid');
INSERT INTO Courses (C_name, c_Id, categories, presence, pre_course) VALUES ('Infection Control', 10, 'Medical', 'Required', 'Health and Safety');
--Participants
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('John Doe', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 101, 'Paramedic', 'Male');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Jane Smith', TO_DATE('1992-02-15', 'YYYY-MM-DD'), 102, 'EMT', 'Female');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Alice Johnson', TO_DATE('1995-03-20', 'YYYY-MM-DD'), 103, 'First Responder', 'Female');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Bob Brown', TO_DATE('1993-04-25', 'YYYY-MM-DD'), 104, 'Certified Nurse', 'Male');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Charlie Davis', TO_DATE('1988-05-30', 'YYYY-MM-DD'), 105, 'Paramedic', 'Non-binary');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Diana Evans', TO_DATE('1991-06-05', 'YYYY-MM-DD'), 106, 'First Responder', 'Female');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Edward Franklin', TO_DATE('1994-07-10', 'YYYY-MM-DD'), 107, 'EMT', 'Male');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Fiona Green', TO_DATE('1989-08-15', 'YYYY-MM-DD'), 108, 'Certified Nurse', 'Female');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('George Harris', TO_DATE('1996-09-20', 'YYYY-MM-DD'), 109, 'Paramedic', 'Male');
INSERT INTO Participants (p_name, p_date, p_id, p_role, gender) VALUES ('Helen Irvine', TO_DATE('1997-10-25', 'YYYY-MM-DD'), 110, 'First Responder', 'Female');

--lecturers
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (111, 'Dr. Emily White', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'Senior', 'Medical');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (112, 'Prof. John Miller', TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'Expert', 'Trauma Care');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (113, 'Dr. Sarah Thompson', TO_DATE('2020-03-10', 'YYYY-MM-DD'), 'Intermediate', 'CPR');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (114, 'Mr. Michael Brown', TO_DATE('2019-04-05', 'YYYY-MM-DD'), 'Junior', 'First Aid');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (115, 'Mrs. Anna Wilson', TO_DATE('2018-05-15', 'YYYY-MM-DD'), 'Senior', 'Emergency Response');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (116, 'Ms. Laura Davis', TO_DATE('2017-06-25', 'YYYY-MM-DD'), 'Expert', 'Disaster Management');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (117, 'Dr. Kevin Clark', TO_DATE('2016-07-30', 'YYYY-MM-DD'), 'Intermediate', 'Pediatric Care');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (118, 'Prof. Jessica Lewis', TO_DATE('2015-08-15', 'YYYY-MM-DD'), 'Senior', 'Advanced Life Support');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (119, 'Mr. Brian Walker', TO_DATE('2014-09-10', 'YYYY-MM-DD'), 'Junior', 'Health and Safety');
INSERT INTO lecturers (l_Id, l_name, l_date, seniority, training) VALUES (120, 'Mrs. Nancy Scott', TO_DATE('2013-10-05', 'YYYY-MM-DD'), 'Intermediate', 'Infection Control');
--Room
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (1, 'Building A, Floor 1', 50, 'Classroom');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (2, 'Building B, Floor 2', 40, 'Lecture Hall');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (3, 'Building C, Floor 3', 30, 'Training Room');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (4, 'Building A, Floor 2', 60, 'Auditorium');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (5, 'Building D, Floor 1', 35, 'Seminar Room');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (6, 'Building B, Floor 1', 45, 'Conference Room');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (7, 'Building C, Floor 2', 55, 'Workshop Room');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (8, 'Building D, Floor 2', 25, 'Computer Lab');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (9, 'Building A, Floor 3', 70, 'Training Center');
INSERT INTO Room (r_id, r_location, numplace, r_type) VALUES (10, 'Building B, Floor 3', 20, 'Discussion Room');
--StudentsGroup
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (1, 25, 9, 1, 1, 1, 114);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (2, 20, 10, 2, 2, 2, 113);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (3, 30, 11, 3, 3, 3, 118);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (4, 35, 13, 4, 4, 4, 112);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (5, 40, 14, 5, 5, 5, 117);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (6, 45, 15, 6, 6, 6, 115);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (7, 50, 9, 7, 7, 7, 116);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (8, 55, 10, 1, 8, 8, 119);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (9, 60, 11, 2, 9, 9, 111);
INSERT INTO StudentsGroup (g_id, Max_p, g_hour, g_day, r_id, c_Id, l_Id) VALUES (10, 25, 13, 3, 10, 10, 120);
--uses
INSERT INTO uses (c_Id, e_id) VALUES (1, 1);
INSERT INTO uses (c_Id, e_id) VALUES (2, 10);
INSERT INTO uses (c_Id, e_id) VALUES (3, 7);
INSERT INTO uses (c_Id, e_id) VALUES (4, 2);
INSERT INTO uses (c_Id, e_id) VALUES (5, 5);
INSERT INTO uses (c_Id, e_id) VALUES (6, 4);
INSERT INTO uses (c_Id, e_id) VALUES (7, 6);
INSERT INTO uses (c_Id, e_id) VALUES (8, 9);
INSERT INTO uses (c_Id, e_id) VALUES (9, 1);
INSERT INTO uses (c_Id, e_id) VALUES (10, 3);
--belongs
INSERT INTO belongs (g_id, p_id) VALUES (1, 101);
INSERT INTO belongs (g_id, p_id) VALUES (2, 102);
INSERT INTO belongs (g_id, p_id) VALUES (3, 103);
INSERT INTO belongs (g_id, p_id) VALUES (4, 104);
INSERT INTO belongs (g_id, p_id) VALUES (5, 105);
INSERT INTO belongs (g_id, p_id) VALUES (6, 106);
INSERT INTO belongs (g_id, p_id) VALUES (7, 107);
INSERT INTO belongs (g_id, p_id) VALUES (8, 108);
INSERT INTO belongs (g_id, p_id) VALUES (9, 109);
INSERT INTO belongs (g_id, p_id) VALUES (10, 110);
--teaches_the
INSERT INTO teaches_the (l_Id, c_Id) VALUES (111, 1); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (112, 4); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (113, 2); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (114, 1); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (115, 6);
INSERT INTO teaches_the (l_Id, c_Id) VALUES (116, 7);
INSERT INTO teaches_the (l_Id, c_Id) VALUES (117, 5); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (118, 3); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (119, 8); 
INSERT INTO teaches_the (l_Id, c_Id) VALUES (120, 10);
--DELETE
--DELETE FROM uses;
--DELETE FROM belongs;
--DELETE FROM teaches_the;
--DELETE FROM Participants;
--DELETE FROM StudentsGroup;
--DELETE FROM Equipment;
--DELETE FROM Courses;
--DELETE FROM lecturers;
--DELETE FROM Room;




