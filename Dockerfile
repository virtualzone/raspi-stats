FROM alpine:3.11
RUN apk --update add --no-cache mosquitto
ENV HOST mqtt
ENV PORT 1883
ENV USER raspi-stats
ENV PASS changeme
ENV TOPIC raspi
WORKDIR /app
ADD run.sh /app
CMD ["/app/run.sh"]
