FROM alpine:latest
RUN apk add openjdk21-jre-headless
RUN adduser -u 1000 -SD mcserver
RUN mkdir /setup
COPY ./setup/ /setup
ENV EULA=false
ENTRYPOINT ["/bin/sh", "/setup/setup.sh"]
