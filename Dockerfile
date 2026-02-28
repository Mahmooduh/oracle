FROM container-registry.oracle.com/database/express:21.3.0-xe

ENV ORACLE_SID=XE \
    ORACLE_PDB=XEPDB1 \
    ORACLE_PWD=Oracle123

USER root
RUN yum install -y unzip wget
USER oracle

COPY apex_24.1.zip /tmp/
RUN cd /tmp && \
    unzip -q apex_24.1.zip && \
    rm apex_24.1.zip

COPY install_apex.sql /opt/oracle/scripts/startup/

EXPOSE 1521 5500 8080

HEALTHCHECK --interval=30s --timeout=10s --retries=5 \
  CMD sqlplus -s sys/${ORACLE_PWD}@localhost:1521/${ORACLE_SID} as sysdba <<< "SELECT 1 FROM DUAL;" || exit 1
