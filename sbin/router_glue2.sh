#!/bin/sh

####### Customizations START #######
APP_NAME=%APP_NAME%
APP_HOME=%APP_HOME%
WAREHOUSE_DJANGO=%WAREHOUSE_DJANGO%
DAEMON_USER=software
####### Customizations END #######

####### Everything else should be standard #######
APP_SOURCE=${APP_HOME}/PROD

APP_LOG=${APP_HOME}/var/${APP_NAME}.daemon.log
if [[ "$1" != --pdb && "$2" != --pdb && "$3" != --pdb && "$4" != --pdb ]]; then
    exec >${APP_LOG} 2>&1
fi

APP_BIN=${APP_SOURCE}/bin/${APP_NAME}.py
APP_OPTS="-l info -c ${APP_HOME}/conf/${APP_NAME}.conf"

export PYTHONPATH=${APP_SOURCE}/lib:${WAREHOUSE_DJANGO}
export APP_CONFIG=${APP_HOME}/conf/django_prod_router.conf
export DJANGO_SETTINGS_MODULE=Operations_Warehouse_Django.settings

do_start () {
    echo -n "Starting ${APP_NAME}:"
    if [ `id -u` = 0 ] ; then
        su ${DAEMON_USER} -s /bin/sh -c "/usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} start ${APP_OPTS}"
        RETVAL=$?
    elif [ `id -u` = `id -u ${DAEMON_USER}` ] ; then
        /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} start ${APP_OPTS}
        RETVAL=$?
    else
        echo "Only root or ${DAEMON_USER} should run ${APP_BIN}"
        RETVAL=99
    fi
}
do_stop () {
    echo -n "Stopping ${APP_NAME}:"
    if [ `id -u` = 0 ] ; then
        su ${DAEMON_USER} -s /bin/sh -c "/usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} stop ${APP_OPTS}"
        RETVAL=$?
    elif [ `id -u` = `id -u ${DAEMON_USER}` ] ; then
        /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} stop ${APP_OPTS}
        RETVAL=$?
    else
        echo "Only root or ${DAEMON_USER} should run ${APP_BIN}"
        RETVAL=99
    fi
}
do_debug () {
    echo -n "Debugging: /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} $@ ${APP_OPTS}"
    /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} $@ ${APP_OPTS}
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

    status)
        echo "Haven't implemented status"
        ;;

    *)
        echo "Usage: ${APP_NAME} {start|stop|debug|restart} [<optional_parameters>]"
        exit 1
        ;;

esac
echo rc=$RETVAL
exit $RETVAL