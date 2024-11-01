#!/bin/bash
# DB connection relies on ~/.pgpass
APP_HOME=%APP_HOME%
DB_HOSTNAME=%DB_HOSTNAME%

function main_function
{
   cd ${APP_HOME}
   echo "** Starting at `date --rfc-3339=ns`"
   psql warehouse2 info_django -h ${DB_HOSTNAME} <PROD/bin/cleanup.sql
   echo "** Ending at `date --rfc-3339=ns`"
}

# Future pipe to mail
# | mail -r ops-support-notify@access-ci.org -s "`hostname`: GLUE2 weekly cleanup" "ops-support-notify@access-ci.org"

main_function 2>&1 >>var/cleanup.log
