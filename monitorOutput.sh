#!/bin/bash

FILE=/dev/rfcomm0

echo "Monitoring..."

while true
do
    if [ -e $FILE ]; then
        echo "Device Connected!"
        cat $FILE
        echo "Device Disconnected..."
        echo "Monitoring..."
    fi

    sleep 1
done
