FROM alpine:latest
RUN apk add openjdk21-jre-headless
RUN addgroup -g 1000 mcserver && adduser -u 1000 -G mcserver -D mcserver
RUN cd
RUN mkdir /setup
COPY ./setup/ /setup
ENV EULA=false
ENTRYPOINT ["/bin/sh", "/setup/setup.sh"]
