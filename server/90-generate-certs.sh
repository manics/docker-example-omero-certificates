#!/bin/sh
set -eu

if [ -f /opt/omero/server/certs/server-combined.p12 ]; then
    echo /opt/omero/server/certs/server-combined.p12 alrady exists
    exit 0
fi
echo 'Generating /opt/omero/server/certs/server-combined.p12'
mkdir -p /opt/omero/server/certs
cd /opt/omero/server/certs
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout server.key -out server.crt -subj /CN=omero
cat server.key server.crt > server-combined.pem
openssl pkcs12 -export -out server-combined.p12 -in server-combined.pem -password pass:secret
