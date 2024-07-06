CREATE OR REPLACE PROCEDURE process_equipment(
    equipment_name IN VARCHAR2,
    equipment_id IN NUMBER,
    amount_to_add IN NUMBER
)
IS
    course_name VARCHAR2(100);
    lecturer_name VARCHAR2(100);
    courses_cur SYS_REFCURSOR;
    rows_updated NUMBER;
    equipment_name_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO equipment_name_count
    FROM equipment
    WHERE e_name = equipment_name;

    IF equipment_name_count = 0 THEN
        RAISE NO_DATA_FOUND;
    END IF;

    UPDATE equipment
    SET amount = amount + amount_to_add
    WHERE e_id = equipment_id;
    rows_updated := SQL%ROWCOUNT;

    IF rows_updated = 0 THEN
        RAISE NO_DATA_FOUND;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Courses using equipment ' || equipment_name || ':');

    OPEN courses_cur FOR
    SELECT c.c_name AS course_name, l.l_name AS lecturer_name
    FROM courses c
    JOIN teaches_the tt ON c.c_id = tt.c_id
    JOIN lecturers l ON tt.l_id = l.l_id
    JOIN uses u ON c.c_id = u.c_id
    WHERE u.e_id = equipment_id;

    LOOP
        FETCH courses_cur INTO course_name, lecturer_name;
        EXIT WHEN courses_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('   Course Name: ' || course_name || ', Lecturer: ' || lecturer_name);
    END LOOP;

    CLOSE courses_cur;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        IF equipment_name_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No equipment found with name ' || equipment_name);
        ELSE
            DBMS_OUTPUT.PUT_LINE('No equipment found with ID ' || equipment_id);
        END IF;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error processing equipment: ' || SQLERRM);
END;
/
