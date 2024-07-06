CREATE OR REPLACE FUNCTION find_equipment_used_in_course(
    course_name IN VARCHAR2,
    lecturer_name IN VARCHAR2
)
RETURN SYS_REFCURSOR
AS
    equipment_cursor SYS_REFCURSOR;
    internal_cursor SYS_REFCURSOR;
    equipment_name VARCHAR2(100);
    equipment_id NUMBER;
    e_count NUMBER := 0;

    no_equipment_found EXCEPTION;
BEGIN
    OPEN internal_cursor FOR
        SELECT e.e_name, e.e_id
        FROM equipment e
        JOIN uses u ON e.e_id = u.e_id
        JOIN courses c ON u.c_id = c.c_id
        JOIN teaches_the tt ON c.c_id = tt.c_id
        JOIN lecturers l ON tt.l_id = l.l_id
        WHERE c.c_name = course_name
        AND l.l_name = lecturer_name;

    LOOP
        FETCH internal_cursor INTO equipment_name, equipment_id;
        EXIT WHEN internal_cursor%NOTFOUND;
        e_count := e_count + 1;
        DBMS_OUTPUT.PUT_LINE('Equipment used in course ' || course_name || ' by lecturer ' || lecturer_name || ': ' || equipment_name || ' (ID: ' || equipment_id || ')');
    END LOOP;

    CLOSE internal_cursor;

    IF e_count = 0 THEN
        RAISE no_equipment_found;
    END IF;

    OPEN equipment_cursor FOR
        SELECT e.e_name, e.e_id
        FROM equipment e
        JOIN uses u ON e.e_id = u.e_id
        JOIN courses c ON u.c_id = c.c_id
        JOIN teaches_the tt ON c.c_id = tt.c_id
        JOIN lecturers l ON tt.l_id = l.l_id
        WHERE c.c_name = course_name
        AND l.l_name = lecturer_name;

    RETURN equipment_cursor;

EXCEPTION
    WHEN no_equipment_found THEN
        DBMS_OUTPUT.PUT_LINE('No equipment found for the specified course and lecturer');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error while fetching equipment used in course: ' || SQLERRM);
        RETURN NULL;
END;
/
