CREATE VIEW view_groups_courses_lecturers AS
SELECT 
    sg.g_id AS group_id,
    sg.g_hour AS group_hour,
    sg.g_day AS group_day,
    l.l_name AS lecturer_name,
    c.C_name AS course_name,
    r.r_location AS room_location
FROM 
    StudentsGroup sg
JOIN 
    lecturers l ON sg.l_Id = l.l_Id
JOIN 
    Courses c ON sg.c_Id = c.c_Id
JOIN 
    Room r ON sg.r_id = r.r_id;
-------------------------------------------------------------------
select * from view_groups_courses_lecturers;
-------------------------------------------------------------------
SELECT group_id,lecturer_name,course_name
FROM view_groups_courses_lecturers
WHERE lecturer_name = 'Owen Bryson';
--------------------------------------------------------------------
SELECT *
FROM view_groups_courses_lecturers
WHERE course_name = 'Emergency Response';
-------------------------------------------------------------------
CREATE VIEW view_shifts_medics AS
SELECT 
    s.shift_id_ AS shift_id,
    s.daate AS shift_date,
    s.starttime AS shift_start_time,
    s.endtime AS shift_end_time,
    v.volunteer_id AS volunteer_id,
    v.naame AS volunteer_name
FROM 
    SHIFT s
JOIN 
    PARAMEDIC p ON s.volunteer_id = p.volunteer_id
JOIN 
    MEDIC m ON s.volunteer_id = m.volunteer_id
JOIN 
    VOLUNTEER v ON s.volunteer_id = v.volunteer_id;

-----------------------------------------------------------------
select * from view_shifts_medics;
-----------------------------------------------------------------
SELECT shift_id,shift_date,shift_start_time,shift_end_time
FROM view_shifts_medics
WHERE TO_DATE(shift_date, 'DD/MM/YYYY') > TO_DATE('01/02/2024', 'DD/MM/YYYY');

------------------------------------------------------------------
SELECT *
FROM view_shifts_medics
WHERE volunteer_id IN (
    SELECT volunteer_id
    FROM PARAMEDIC
);
