echo Starting run.sh...
telldusd --nodaemon
#tdtool --list
#tdtool --list-devices
#tdtool --list-sensors
gdb -batch -ex "run" -ex "bt" telldusd
echo End of run.sh.
