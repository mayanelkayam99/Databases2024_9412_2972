SELECT c.C_name, c.categories, c.pre_course,
       (SELECT COUNT(DISTINCT l.l_name)
        FROM teaches_the tt
        JOIN lecturers l ON tt.l_Id = l.l_Id
        WHERE tt.c_Id = c.c_Id) AS num_lecturers,
       (SELECT SUM(sg.Max_p)
        FROM StudentsGroup sg
        WHERE sg.c_Id = c.c_Id) AS total_participants,
       (SELECT r.r_location
        FROM StudentsGroup sg
        JOIN Room r ON sg.r_id = r.r_id
        WHERE sg.c_Id = c.c_Id
        AND ROWNUM = 1) AS room_location
FROM Courses c;
