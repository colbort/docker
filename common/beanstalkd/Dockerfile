FROM alpine:3.21

RUN apk add --no-cache beanstalkd \
    && mkdir -p /data \
    && chown nobody:nobody /data

USER nobody

EXPOSE 11300

ENTRYPOINT ["beanstalkd"]
CMD ["-l", "0.0.0.0", "-p", "11300", "-b", "/data", "-f", "1000"]
