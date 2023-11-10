#!/bin/bash
# DB connection relies on ~/.pgpass
APP_HOME=%APP_HOME%
DATABASE_HOST=%AMAZON_RDS_HOST_PROD%

function main_function
{
   cd ${APP_HOME}
   time psql warehouse2 info_django -h ${DATABASE_HOSE} <bin/cleanup.sql
}
# Disable until RPs start publishing consistently

#main_function 2>&1 | mail -r ops-support-notify@access-ci.org -s "`hostname`: GLUE2 weekly cleanup" "ops-support-notify@access-ci.org"
