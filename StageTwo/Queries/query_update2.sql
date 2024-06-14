--update 2
UPDATE lecturers l
SET l.seniority = l.seniority + 1
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM l.l_date) = 40
AND EXISTS (
    SELECT 1
    FROM teaches_the tt
    JOIN Courses c ON tt.c_Id = c.c_Id
    WHERE tt.l_Id = l.l_Id
    AND c.presence = 'Required'
);


SELECT *
FROM lecturers l
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM l.l_date) = 40
AND EXISTS (
    SELECT 1
    FROM teaches_the tt
    JOIN Courses c ON tt.c_Id = c.c_Id
    WHERE tt.l_Id = l.l_Id
    AND c.presence = 'Required'
);














