DECLARE
    v_course_name VARCHAR2(100) := '&course_name';
    v_lecturer_name VARCHAR2(100) := '&lecturer_name';
    v_amount_to_add NUMBER := &amount_to_add;
    v_equipment_cur SYS_REFCURSOR;
    v_equipment_name VARCHAR2(100);
    v_equipment_id NUMBER;
BEGIN
    v_equipment_cur := find_equipment_used_in_course(v_course_name, v_lecturer_name);
    DBMS_OUTPUT.PUT_LINE('Retrieving equipment details for the specified course and lecturer.');

    LOOP
        FETCH v_equipment_cur INTO v_equipment_name, v_equipment_id;
        EXIT WHEN v_equipment_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Processing equipment item: ' || v_equipment_name || ' (ID: ' || v_equipment_id || ').');

        process_equipment(v_equipment_name, v_equipment_id, v_amount_to_add);
    END LOOP;

    CLOSE v_equipment_cur;
    DBMS_OUTPUT.PUT_LINE('All equipment items have been successfully updated.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during the execution of the program: ' || SQLERRM);
END;
