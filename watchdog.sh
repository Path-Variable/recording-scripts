#!/bin/bash
ROOT_PID=$$
eval ${REC_SCRIPT} &	

while(true); do
    REC_PID=$(pstree -hp $ROOT_PID | grep -oP "ffmpeg\(\K\d+")
    LIVE=0
    test `stat -L -c %Y /proc/${REC_PID}/fd/1` -ge $(($EPOCHSECONDS - 10)) && LIVE=1
		
    if [[ $LIVE -eq 1 ]]; then
        /bin/systemd-notify WATCHDOG=1;
        sleep $(($WATCHDOG_USEC / 2000000))
    else
        sleep 1
    fi
done

