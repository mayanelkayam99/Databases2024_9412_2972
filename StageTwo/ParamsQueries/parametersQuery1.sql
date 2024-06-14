SELECT 
    p.p_name AS ParticipantName, 
    l.l_name AS LecturerName, 
    c.C_name AS CourseName,
    r.r_location AS RoomLocation
FROM 
    Participants p
JOIN belongs b ON p.p_id = b.p_id
JOIN StudentsGroup sg ON b.g_id = sg.g_id
JOIN Courses c ON sg.c_Id = c.c_Id
JOIN lecturers l ON sg.l_Id = l.l_Id
LEFT JOIN Room r ON sg.r_id = r.r_id
WHERE c.C_name =&<name="CourseName" type="string" list="select C_name from Courses">
order by p.p_name;

