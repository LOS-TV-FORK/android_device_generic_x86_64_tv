#!/system/bin/sh
# Native installer watcher: waits for a job file from the installer app
# and runs the Java engine. Persistent init service, negligible cost.
# The engine run is bounded: a wedged tool run is killed, the status is
# forced to error so the UI fails fast, and the loop keeps serving the
# next job instead of blocking forever behind the wedge.
FILES=/data/data/org.los.tv.installer/files
while true; do
    if [ -f $FILES/installer.job ]; then
        /system/bin/timeout 3600 /system/bin/app_process \
            -Djava.class.path=/system/framework/installer-engine.jar \
            /system/bin org.los.tv.installer.engine.Main
        st=$(cat $FILES/installer.status 2>/dev/null | tr -d '\r\n')
        if [ "$st" != "done" ] && [ "$st" != "error" ]; then
            echo "error" > $FILES/installer.status
        fi
    fi
    sleep 5
done
