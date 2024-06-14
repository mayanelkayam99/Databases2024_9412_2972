SELECT 
    p.p_name AS ParticipantName,
    c.C_name AS CourseName
FROM 
    Participants p
JOIN belongs b ON p.p_id = b.p_id
JOIN StudentsGroup sg ON b.g_id = sg.g_id
JOIN Courses c ON sg.c_Id = c.c_Id
WHERE 
    p.p_name = &<name="ParticipantName" type="string" required="true">
ORDER BY 
    c.C_name;



