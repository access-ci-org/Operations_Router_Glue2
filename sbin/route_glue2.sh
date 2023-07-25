#!/bin/sh

### BEGIN INIT INFO
# Provides:          route_glue2
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Route glue2 messages from a source to a destination
# Description:       Route glue2 messages from a {file, directory, amqp} to a {directory, api}
### END INIT INFO

####### Customizations START #######
APP_NAME=route_glue2
APP_BASE=/soft/applications-2.0/router_glue2
WAREHOUSE_BASE=/soft/applications-2.0
# Override in shell environment
if [ -z "$PYTHON_BASE" ]; then
    PYTHON_BASE=/soft/python/python-3.7.7-base
fi
DAEMON_USER=software
####### Customizations END #######

####### Everything else should be standard #######
APP_SOURCE=${APP_BASE}/PROD
WAREHOUSE_SOURCE=${WAREHOUSE_BASE}/PROD

APP_LOG=${APP_BASE}/var/${APP_NAME}.daemon.log
if [[ "$1" != --pdb && "$2" != --pdb && "$3" != --pdb && "$4" != --pdb ]]; then
    exec >${APP_LOG} 2>&1
fi

APP_BIN=${APP_SOURCE}/bin/${APP_NAME}.py
APP_OPTS="-l info -c ${APP_BASE}/conf/${APP_NAME}.conf"

PYTHON_BIN=python3
export LD_LIBRARY_PATH=${PYTHON_BASE}/lib
source ${APP_BASE}/python/bin/activate

export PYTHONPATH=${APP_SOURCE}/lib:${WAREHOUSE_SOURCE}/django_xsede_warehouse
export DJANGO_CONF=${APP_BASE}/conf/django_xsede_warehouse.conf
export APP_CONFIG=${APP_HOME}/conf/django_prod_router.conf
export DJANGO_SETTINGS_MODULE=Operations_Warehouse_Django.settings

do_start () {
    echo -n "Starting ${APP_NAME}:"
    if [ `id -u` = 0 ] ; then
        su ${DAEMON_USER} -s /bin/sh -c "${PYTHON_BIN} ${APP_BIN} start ${APP_OPTS}"
        RETVAL=$?
    elif [ `id -u` = `id -u ${DAEMON_USER}` ] ; then
        ${PYTHON_BIN} ${APP_BIN} start ${APP_OPTS}
        RETVAL=$?
    else
        echo "Only root or ${DAEMON_USER} should run ${APP_BIN}"
        RETVAL=99
    fi
}
do_stop () {
    echo -n "Stopping ${APP_NAME}:"
    if [ `id -u` = 0 ] ; then
        su ${DAEMON_USER} -s /bin/sh -c "${PYTHON_BIN} ${APP_BIN} stop ${APP_OPTS}"
        RETVAL=$?
    elif [ `id -u` = `id -u ${DAEMON_USER}` ] ; then
        ${PYTHON_BIN} ${APP_BIN} stop ${APP_OPTS}
        RETVAL=$?
    else
        echo "Only root or ${DAEMON_USER} should run ${APP_BIN}"
        RETVAL=99
    fi
}
do_debug () {
    echo -n "Debugging: ${PYTHON_BIN} ${APP_BIN} $@ ${APP_OPTS}"
    ${PYTHON_BIN} ${APP_BIN} $@ ${APP_OPTS}
    RETVAL=$?
}

case "$1" in
    start|stop)
        do_${1} ${@:2}
        ;;

    debug)
        do_debug ${@:2}
        ;;

    restart|reload|force-reload)
        do_stop
        do_start
        ;;

    *)
        echo "Usage: ${APP_NAME} {start|stop|debug|restart} [<optional_parameters>]"
        exit 1
        ;;

esac
echo rc=$RETVAL
exit $RETVAL
