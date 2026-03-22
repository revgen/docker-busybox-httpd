FROM busybox

ARG NAME="rev9en/busybox-httpd"
ARG VERSION="1.0.2"

LABEL version="${VERSION}"
LABEL description="Docker image with Busybox httpd"
LABEL date="2024-02-16"
LABEL maintainer="Evgen Rusakov"
LABEL url.docker="https://hub.docker.com/r/rev9en/busybox-httpd"
LABEL url.source="https://github.com/revgen/docker/docker-busybox-httpd"

ENV IMAGE_NAME="${NAME}"
ENV IMAGE_VERSION="${VERSION}"
COPY root-fs/ /

EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
