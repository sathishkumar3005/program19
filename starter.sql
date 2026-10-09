SET SERVEROUTPUT ON;

DECLARE
    CURSOR student_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_id Student.StudentID%TYPE;
    v_name Student.StudentName%TYPE;
    v_dept Student.DepartmentID%TYPE;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor INTO v_id, v_name, v_dept;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'StudentID: ' || v_id ||
            ' StudentName: ' || v_name ||
            ' DepartmentID: ' || v_dept
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
