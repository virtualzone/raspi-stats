#!/bin/sh
while true
do
        cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
        cpu=$(echo "scale=2; $cpu/1000" | bc -l)
        echo "Current temperature: $cpu °C"
        mosquitto_pub -h $HOST -p $PORT -u $USER -P $PASS -t $TOPIC/cpu/temperature -r -m $cpu
        sleep $INTERVAL
done
