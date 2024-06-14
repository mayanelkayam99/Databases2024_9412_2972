SELECT 
    e.e_name AS equipment_name,
    u.course_usage_count
FROM 
    Equipment e
JOIN 
    (
        SELECT 
            u.e_id,
            COUNT(u.c_Id) AS course_usage_count
        FROM 
            uses u
        GROUP BY 
            u.e_id
    ) u ON e.e_id = u.e_id
WHERE 
    u.course_usage_count = (
        SELECT 
            MAX(u2.course_usage_count)
        FROM 
            (
                SELECT 
                    u2.e_id,
                    COUNT(u2.c_Id) AS course_usage_count
                FROM 
                    uses u2
                GROUP BY 
                    u2.e_id
            ) u2
    );
