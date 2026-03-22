# 🐳 [Busybox HTTPD Server Docker Image](https://github.com/revgen/docker-busybox-httpd)

[![Build Docker Image](https://github.com/revgen/docker-busybox-httpd/actions/workflows/docker.yml/badge.svg)](https://hub.docker.com/r/rev9en/busybox-httpd/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is a bare bones Docker image based on alpine that serves HTTP content using [busybox’s](https://busybox.net/) [httpd](https://oldwiki.archive.openwrt.org/doc/howto/http.httpd) command.


Put your web content in /var/www/html.

You can override the configuration file in /etc/httpd.conf.

## Usage

```bash
@docker run -it --rm -d \
    --restart=unless-stopped \
    --hostname "Simple Server" \
    -p 8080:80 \
    -v "<home>/wwwroot:/var/www/html" \
    --health-cmd "echo -e "GET /cgi-bin/healthcheck HTTP/1.0\n\n" | nc localhost 80 | grep "status" | grep "OK" || exit 1" \
    --health-interval 30s --health-timeout 10s --health-retries 3 \
    --name busybox-httpd rev9en/busybox-httpd
```

After that a regular http server will be available on [http://localhost:8080](http://localhost:8080).

## Development

* Build an image: ```make build```
* Run image locally: ```make serve```

## Links

* [Busybox home](https://www.busybox.net/)
* [Busybox documentation](https://www.busybox.net/downloads/BusyBox.html)
* [Busybox HTTPD](https://oldwiki.archive.openwrt.org/doc/howto/http.httpd)
* [Docker alpine official page](https://hub.docker.com/_/alpine)

