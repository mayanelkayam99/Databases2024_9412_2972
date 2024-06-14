SELECT 
    c.C_name AS course_name,
    c.categories AS course_category,
    sg.g_id AS group_id,
    l.l_name AS lecturer_name,
    l.seniority AS lecturer_seniority,
    r.r_location AS room_location,
    r.r_type AS room_type,
    COUNT(b.p_id) AS num_participants
FROM 
    StudentsGroup sg
JOIN 
    Courses c ON sg.c_Id = c.c_Id
JOIN 
    lecturers l ON sg.l_Id = l.l_Id
JOIN 
    Room r ON sg.r_id = r.r_id
LEFT JOIN 
    belongs b ON sg.g_id = b.g_id
WHERE 
    c.categories IN ('Medical', 'Rescue', 'Emergency')
GROUP BY
    c.C_name, c.categories, sg.g_id, l.l_name, l.seniority, 
    r.r_location, r.r_type
ORDER BY 
    c.C_name,sg.g_id;
