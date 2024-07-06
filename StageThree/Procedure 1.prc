CREATE OR REPLACE PROCEDURE AddParticipantToGroup (
    participant_name IN Participants.p_name%TYPE,
    participant_id IN Participants.p_id%TYPE,
    group_id IN StudentsGroup.g_id%TYPE
) IS
    course_count NUMBER := 0;
    v_exists NUMBER := 0;
    category Courses.categories%TYPE;
    course_name Courses.c_name%TYPE;
        
    message VARCHAR2(200);

    CURSOR participant_courses_cursor IS
        SELECT DISTINCT c.c_Id, c.categories
        FROM belongs b
        JOIN StudentsGroup sg ON b.g_id = sg.g_id
        JOIN Courses c ON sg.c_Id = c.c_Id
        WHERE b.p_id = participant_id;

BEGIN
    SELECT COUNT(*)
    INTO v_exists
    FROM belongs
    WHERE g_id = group_id
      AND p_id = participant_id;

    IF v_exists > 0 THEN
        message := 'The participant is already in the group.';
        DBMS_OUTPUT.PUT_LINE(message);
    ELSE
        INSERT INTO belongs (g_id, p_id)
        VALUES (group_id, participant_id);
        COMMIT;

        SELECT c.categories, c.c_name
        INTO category, course_name
        FROM StudentsGroup sg
        JOIN Courses c ON sg.c_Id = c.c_Id
        WHERE sg.g_id = group_id;

        message := participant_name || ' has been added to the course: ' || course_name;
        DBMS_OUTPUT.PUT_LINE(message);

        FOR course_rec IN participant_courses_cursor LOOP
            course_count := course_count + 1;
        END LOOP;

        message := participant_name || ' is enrolled in ' || course_count || ' courses.';
        DBMS_OUTPUT.PUT_LINE(message);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Course category not found for the group.');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Participant is already in the group.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END AddParticipantToGroup;
/
