#!/bin/bash
set -e

echo "Downloading Oracle APEX latest..."
curl -o /tmp/apex-latest.zip -L https://download.oracle.com/otn_software/apex/apex-latest.zip

echo "Extracting APEX..."
cd /tmp && unzip -q apex-latest.zip && rm apex-latest.zip

echo "Installing APEX..."
sqlplus -s / as sysdba <<EOF
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
EOF

echo "APEX installation completed!"

