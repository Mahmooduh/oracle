FROM oraclelinux:8

ENV ORACLE_BASE=/opt/oracle \
    ORACLE_HOME=/opt/oracle/product/21c/dbhome_1 \
    ORACLE_SID=ORCL \
    ORACLE_PDB=ORCLPDB1 \
    ORACLE_PWD=Oracle123 \
    PATH=/opt/oracle/product/21c/dbhome_1/bin:$PATH

RUN yum install -y oracle-database-preinstall-21c unzip wget && \
    yum clean all

RUN mkdir -p /opt/oracle/product/21c/dbhome_1 && \
    mkdir -p /opt/oracle/oradata && \
    chown -R oracle:oinstall /opt/oracle && \
    chmod -R 775 /opt/oracle

USER oracle
WORKDIR /opt/oracle

COPY --chown=oracle:oinstall LINUX.X64_213000_db_home.zip /tmp/
RUN cd /opt/oracle/product/21c/dbhome_1 && \
    unzip -q /tmp/LINUX.X64_213000_db_home.zip && \
    rm /tmp/LINUX.X64_213000_db_home.zip

COPY --chown=oracle:oinstall db_install.rsp /tmp/
RUN cd /opt/oracle/product/21c/dbhome_1 && \
    ./runInstaller -silent -responseFile /tmp/db_install.rsp -waitforcompletion -ignorePrereq

USER root
RUN /opt/oracle/product/21c/dbhome_1/root.sh

USER oracle
COPY --chown=oracle:oinstall dbca.rsp /tmp/
RUN dbca -silent -createDatabase -responseFile /tmp/dbca.rsp

COPY --chown=oracle:oinstall apex_24.1.zip /tmp/
RUN cd /tmp && unzip -q apex_24.1.zip

COPY --chown=oracle:oinstall install_apex.sql /tmp/
RUN echo "exit" | sqlplus / as sysdba @/tmp/install_apex.sql

EXPOSE 1521 5500 8080

CMD ["sh", "-c", "lsnrctl start && sqlplus / as sysdba << EOF\nSTARTUP;\nEXIT;\nEOF\ntail -f /opt/oracle/diag/rdbms/*/*/trace/alert*.log"]
