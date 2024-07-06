DECLARE
    participants_courses_cursor SYS_REFCURSOR;
    v_p_id Participants.p_id%TYPE;
    v_p_name Participants.p_name%TYPE;
    v_group_id StudentsGroup.g_id%TYPE := &group_id;
    v_role VARCHAR2(30) := '&p_role';
    v_course_name VARCHAR2(30) :='&course_name';
BEGIN
    participants_courses_cursor := GetParticipantsAndCourses(v_role, v_course_name);

    LOOP
        FETCH participants_courses_cursor INTO v_p_id, v_p_name;
        EXIT WHEN participants_courses_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Adding participant: ' || v_p_name || ', ID: ' || v_p_id);

        AddParticipantToGroup(v_p_name, v_p_id, v_group_id);
    END LOOP;

    CLOSE participants_courses_cursor;

    DBMS_OUTPUT.PUT_LINE('Participants have been added to the new group.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;


