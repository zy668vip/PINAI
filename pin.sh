#!/bin/bash

while true
do
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    if pgrep -f "python3 pin.py" > /dev/null
    then
        echo "$timestamp - pin Process is running."
    else
        echo "$timestamp - pin Process is not running. Restarting..."
        nohup python3 pin.py >> ./pin.log 2>&1 & echo $! > kill.pid
    fi
    sleep 5
done

nohup ./pin.sh &
