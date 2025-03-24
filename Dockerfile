FROM alpine:3.8

ARG NAME="rev9en/busybox-httpd"
ARG VERSION="1.0.1"

LABEL version="${VERSION}"
LABEL description="Docker image with Busybox httpd"
LABEL date="2024-02-16"
LABEL maintainer="Evgen Rusakov"
LABEL url.docker="https://hub.docker.com/r/rev9en/busybox-httpd"
LABEL url.source="https://github.com/revgen/docker/docker-busybox-httpd"

RUN apk add --no-cache tini busybox-extras

COPY root-fs/ /

EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD [ "httpd", "-f", "-h", "/var/www/html", "-p", "80", "-c", "/etc/httpd.conf" ]
