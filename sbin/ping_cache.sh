#!/bin/bash
# Description:       Touch cache to keep it fresh

APP_BASE=/soft/applications-2.0/router_glue2
CACHE_URL=https://opsapi1.access-ci.org/wh1/warehouse-views/v1/software-cached/
PING_LOG=${APP_BASE}/var/ping_cache.log

do_ping () {
    echo -n "Ping at: "
    date
    /usr/bin/time -f "%E" wget -q -O /dev/null ${CACHE_URL}
}

do_ping >>${PING_LOG} 2>&1

#exit $RETVAL
