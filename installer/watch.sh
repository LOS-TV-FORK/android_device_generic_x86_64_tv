#!/system/bin/sh
# Native installer watcher: waits for a job file from the installer app
# and runs the Java engine. Persistent init service, negligible cost.
while true; do
    if [ -f /data/data/org.los.tv.installer/files/installer.job ]; then
        /system/bin/app_process \
            -Djava.class.path=/system/framework/installer-engine.jar \
            /system/bin org.los.tv.installer.engine.Main
    fi
    sleep 5
done
