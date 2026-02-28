FROM gvenzl/oracle-xe:21

ENV ORACLE_PWD=Oracle123

USER root
RUN microdnf install -y curl && microdnf clean all

USER oracle

COPY install_apex.sh /docker-entrypoint-initdb.d/01_install_apex.sh

EXPOSE 1521 5500 8080
