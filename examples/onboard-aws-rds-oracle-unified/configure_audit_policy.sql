SET serveroutput ON;

DECLARE
    c int;
    stmt varchar2(1000);
BEGIN
    SELECT COUNT(*) INTO c FROM AUDIT_UNIFIED_POLICIES WHERE policy_name = UPPER('&1');
    IF c = 0 THEN
        dbms_output.put_line('Creating audit policy &1...');
        stmt := 'CREATE AUDIT POLICY &1 ACTIONS ALL ONLY TOPLEVEL';
        EXECUTE IMMEDIATE stmt;

        dbms_output.put_line('Enabling audit policy &1...');
        stmt := 'AUDIT POLICY &1';
        EXECUTE IMMEDIATE stmt;
    ELSE
        dbms_output.put_line('Audit policy &1 already exists.');
    END IF;
END;
/

exit;
