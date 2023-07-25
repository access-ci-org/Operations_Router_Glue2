#!/bin/bash
# DB connection relies on ~/.pgpass

function main_function
{
   cd /soft/applications-2.0/router_glue2/PROD/
   time psql warehouse glue2_owner -h opsdb-dev.cluster-clabf5kcvwmz.us-east-2.rds.amazonaws.com <bin/cleanup.sql
}

main_function 2>&1 | mail -r ops-support-notify@access-ci.org -s "`hostname`: GLUE2 weekly cleanup" "ops-support-notify@access-ci.org"
