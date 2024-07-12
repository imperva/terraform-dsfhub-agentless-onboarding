SET serveroutput ON;

DECLARE
    c int;
    stmt varchar2(1000);
BEGIN
    SELECT COUNT(*) INTO c FROM DBA_USERS WHERE username = UPPER('&1');
    IF c = 0 THEN
        dbms_output.put_line('Creating audit pull user &1...');
        stmt := 'CREATE USER &1 IDENTIFIED BY &2';
        EXECUTE IMMEDIATE stmt;

        dbms_output.put_line('Granting permissions to user &1...');
        stmt := 'GRANT CREATE SESSION TO &1';
        EXECUTE IMMEDIATE stmt;
        stmt := 'GRANT SELECT ON UNIFIED_AUDIT_TRAIL TO &1';
        EXECUTE IMMEDIATE stmt;
    ELSE
        dbms_output.put_line('User &1 already exists.');
    END IF;
END;
/

exit;
