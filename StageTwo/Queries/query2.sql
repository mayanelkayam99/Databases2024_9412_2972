SELECT 
    c.C_name AS course_name,
    MIN(p.age) AS min_age,
    MAX(p.age) AS max_age
FROM 
    Participants p
JOIN 
    belongs b ON p.p_id = b.p_id
JOIN 
    StudentsGroup sg ON b.g_id = sg.g_id
JOIN 
    Courses c ON sg.c_Id = c.c_Id
WHERE 
    c.C_name = 'CPR'
GROUP BY
    c.C_name;
