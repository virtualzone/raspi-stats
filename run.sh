#!/bin/sh
while true
do
        cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
        cpu=$(echo "$cpu/1000" | bc -l)
        echo "Current temperature: $cpu °C"
        mosquitto_pub -h $HOST -p $PORT -u $USER -P $PASS -t $TOPIC/cpu/temperature -m $cpu
        sleep 5
done
