#!/bin/bash
# DB connection relies on ~/.pgpass
APP_HOME=%APP_HOME%
DB_HOSTNAME=%DB_HOSTNAME_WRITE%

function main_function
{
   cd ${APP_HOME}
   time psql warehouse2 info_django -h ${DB_HOSTNAME} <bin/cleanup.sql
}

main_function 2>&1 | tee -a cleanup.log | mail -r ops-support-notify@access-ci.org -s "`hostname`: GLUE2 weekly cleanup" "ops-support-notify@access-ci.org"
