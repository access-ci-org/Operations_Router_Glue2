#!/bin/bash
do_start () {
    echo -n "Starting %APP_NAME%:"
    # export LD_LIBRARY_PATH=${PYTHON_BASE}/lib
    exec /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} --daemon start ${APP_OPTS}
    RETVAL=$?
}
do_stop () {
    echo -n "Stopping %APP_NAME%:"
    # export LD_LIBRARY_PATH=${PYTHON_BASE}/lib
    exec /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} stop ${APP_OPTS}
    RETVAL=$?
}
do_debug () {
    echo -n "Debugging: /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} -l debug $@ ${APP_OPTS}"
    # export LD_LIBRARY_PATH=${PYTHON_BASE}/lib
    exec /usr/local/bin/uv run --project ${APP_HOME} ${APP_BIN} -l debug $@ ${APP_OPTS}
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
        echo "Usage: %APP_NAME% {start|stop|debug|restart}"
        exit 1
        ;;

esac
echo rc=$RETVAL
exit $RETVAL