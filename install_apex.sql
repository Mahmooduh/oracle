ALTER SESSION SET CONTAINER = XEPDB1;

@/tmp/apex/apexins.sql SYSAUX SYSAUX TEMP /i/

BEGIN
    APEX_UTIL.set_security_group_id(10);
    APEX_UTIL.create_user(
        p_user_name => 'ADMIN',
        p_email_address => 'admin@example.com',
        p_web_password => 'Admin123',
        p_developer_privs => 'ADMIN'
    );
    APEX_UTIL.set_security_group_id(null);
    COMMIT;
END;
/

EXIT;
