--delete 1
DELETE FROM belongs
WHERE p_id IN (
    SELECT b.p_id
    FROM belongs b
    JOIN Participants p ON b.p_id = p.p_id
    JOIN StudentsGroup sg ON b.g_id = sg.g_id
    JOIN Courses c ON sg.c_Id = c.c_Id
    WHERE c.categories = 'Management'
    AND p.age > 50
    GROUP BY b.p_id
    HAVING COUNT(*) > 0
);

SELECT b.p_id
FROM belongs b
JOIN Participants p ON b.p_id = p.p_id
JOIN StudentsGroup sg ON b.g_id = sg.g_id
JOIN Courses c ON sg.c_Id = c.c_Id
WHERE c.categories = 'Management'
AND p.age > 50
GROUP BY b.p_id
HAVING COUNT(*) > 0;
