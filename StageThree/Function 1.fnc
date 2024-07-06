CREATE OR REPLACE FUNCTION GetParticipantsAndCourses (
    role IN VARCHAR2,
    course_name IN VARCHAR2
) RETURN SYS_REFCURSOR IS
    participants_courses_cursor SYS_REFCURSOR;

    no_participants EXCEPTION;
    no_role EXCEPTION;
    no_course EXCEPTION;
    participant_count NUMBER := 0;
    role_count NUMBER := 0;
    course_count NUMBER := 0;

    TYPE participant_record IS RECORD (
        p_id Participants.p_id%TYPE,
        p_name Participants.p_name%TYPE,
        p_role Participants.p_role%TYPE 
    );
    participant_rec participant_record;

BEGIN
    SELECT COUNT(*) INTO role_count
    FROM Participants
    WHERE p_role = role;
    
    IF role_count = 0 THEN
        RAISE no_role;
    END IF;

    SELECT COUNT(*) INTO course_count
    FROM Courses
    WHERE c_name = course_name;
    
    IF course_count = 0 THEN
        RAISE no_course;
    END IF;

    OPEN participants_courses_cursor FOR
        SELECT p.p_id, p.p_name, p.p_role
        FROM Participants p
        JOIN belongs b ON p.p_id = b.p_id
        JOIN StudentsGroup sg ON b.g_id = sg.g_id
        JOIN Courses c ON sg.c_id = c.c_id
        WHERE p.p_role = role AND c.c_name = course_name;

    LOOP
        FETCH participants_courses_cursor INTO participant_rec;
        EXIT WHEN participants_courses_cursor%NOTFOUND;
        participant_count := participant_count + 1;
        DBMS_OUTPUT.PUT_LINE('Participant ID: ' || participant_rec.p_id || ', Name: ' || participant_rec.p_name || ', Role: ' || participant_rec.p_role);
    END LOOP;

    IF participant_count = 0 THEN
        RAISE no_participants;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total participants returned by the function: ' || participant_count);
    END IF;

    OPEN participants_courses_cursor FOR
        SELECT p.p_id, p.p_name
        FROM Participants p
        JOIN belongs b ON p.p_id = b.p_id
        JOIN StudentsGroup sg ON b.g_id = sg.g_id
        JOIN Courses c ON sg.c_id = c.c_id
        WHERE p.p_role = role AND c.c_name = course_name;

    RETURN participants_courses_cursor;

EXCEPTION
    WHEN no_participants THEN
        DBMS_OUTPUT.PUT_LINE('No participants found for the given role and course.');
        RETURN NULL;
    WHEN no_role THEN
        DBMS_OUTPUT.PUT_LINE('No participants found for the given role.');
        RETURN NULL;
    WHEN no_course THEN
        DBMS_OUTPUT.PUT_LINE('No participants found for the given course.');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN NULL;
END GetParticipantsAndCourses;
/
