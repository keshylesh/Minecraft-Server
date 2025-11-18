FROM alpine:latest
RUN apk add openjdk21-jre-headless
RUN mkdir /setup
COPY ./setup/ /setup
# ENTRYPOINT ["/bin/sh", "/setup/setup.sh"]
