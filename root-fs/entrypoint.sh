#!/bin/sh
TITLE="${TITLE:-"${SITE_NAME:-"${SITENAME:-"${HOSTNAME}"}"}"}"
export TITLE
HOMEPAGE="${HOMEPAGE:-"/"}"
export HOMEPAGE

echo "Initialize ${IMAGE_NAME} ${IMAGE_VERSION}"
echo "* TITLE    = ${TITLE}"
echo "* HOMEPAGE = ${HOMEPAGE}"

mkdir -p /var/www/html/cgi-bin
[ ! -f /var/www/html/cgi-bin/healthcheck ] && cp -v /var/www/cgi-bin/healthcheck /var/www/html/cgi-bin/healthcheck

(
    ls /var/www/errors/*.html;
    ls /var/www/html/*.html;
) | while read f; do
  mv "${f}" "${f}.tmp"
  echo "Update ${f}" file;
  (echo "cat <<EOF"; cat "${f}.tmp" ; echo EOF ) | sh > "${f}"
  rm -f "${f}.tmp"
done
##### envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "Start httpd http://localhost:80"
/bin/httpd -vv -f -p 0.0.0.0:80  -h /var/www/html -c /etc/httpd.conf
