# Raspi Stats
Raspi Stats regularly reads system information (i.e. CPU temperature) from your Raspberry Pi and publishes them via MQTT.

Using ```docker run```:
```
docker run \
        -d \
        -e "HOST=mqtt" \
        -e "PORT=1883" \
        -e "USER=raspi-stats" \
        -e "PASS=changeme" \
        -e "TOPIC=raspi" \
        -e "INTERVAL=30" \
        -v /sys:/sys:ro \
        --name raspi-stats \
        virtualzone/raspi-stats
```

Using Docker Compose:
```
version: '3.6'
services:
  stats:
    image: virtualzone/raspi-stats
    container_name: 'raspi-stats'
    environment:
      HOST: 'mqtt'
      PORT: '1883'
      USER=raspi: 'stats'
      PASS: 'changeme'
      TOPIC: 'raspi'
      INTERVAL: 30
    volumes:
      - '/sys:/sys:ro'
```

The read information is published to these topics:

* raspi/cpu/temperature