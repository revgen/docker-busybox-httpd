# 🐳 Busybox HTTPD Server Docker Image

This is a bare bones Docker image based on alpine that serves HTTP content using [busybox’s](https://busybox.net/) [httpd](https://oldwiki.archive.openwrt.org/doc/howto/http.httpd) command.


Put your web content in /var/www/html.

You can override the configuration file in /etc/httpd.conf.

## Usage

```bash
docker run -it --rm \
    -p 8080:80 \
    -v "<home>/wwwroot:/var/www/html"
    --name busybox-httpd rev9en/busybox-httpd
```

After that a regular http server will be available on [http://localhost:8080](http://localhost:8080).

## Build locally

```bash
make build

make serve
```

## Links

* [Busybox home](https://www.busybox.net/)
* [Busybox documentation](https://www.busybox.net/downloads/BusyBox.html)
* [Busybox HTTPD](https://oldwiki.archive.openwrt.org/doc/howto/http.httpd)
* [Docker alpine official page](https://hub.docker.com/_/alpine)
