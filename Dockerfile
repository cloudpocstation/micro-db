FROM boxfuse/flyway:latest

COPY ./migrations/ /flyway/sql/
COPY ./flyway.conf /flyway/conf/
