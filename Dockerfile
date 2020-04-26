FROM alpine:3.11
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="Raspi Stats" \
        org.label-schema.description="Reads system information (i.e. CPU temperature) from your Raspberry Pi and publishes them via MQTT." \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/virtualzone/raspi-stats" \
        org.label-schema.schema-version="1.0"
RUN apk --update add --no-cache mosquitto-clients
ENV HOST mqtt
ENV PORT 1883
ENV USER raspi-stats
ENV PASS changeme
ENV TOPIC raspi
ENV INTERVAL 30
WORKDIR /app
ADD run.sh /app
CMD ["/app/run.sh"]
