# OMERO.server self-signed certificates (docker-compose)

[![Build Status](https://travis-ci.com/ome/docker-example-omero-certificates.svg?branch=master)](https://travis-ci.com/ome/docker-example-omero-certificates)

This is an example of running OMERO.server with self-signed certificates instead of using the default anonymous ciphers.
Certificates will be regenerated when OMERO.server starts.

You can enable certificates only, or enable certificates in addition to the default anonymous DH ciphers.


## Run

    docker-compose up -d
    docker-compose logs -f


## Basic tests

Fedora 30 is known to have a strict Java Cipher configuration that prevents OMERO Java clients connecting to an OMERO.server with the default configuration.
The test runs the client with `--IceSSL.Ciphers=(DH_anon.*AES)` (this should be the default in a future release https://github.com/ome/omero-blitz/pull/59) which allows the client to connect.

    docker-compose -f docker-compose.test.yml -f docker-compose.yml build
    docker-compose -f docker-compose.test.yml -f docker-compose.yml run test


## SELinux

If SELinux is enabled you may need to change the context on host directories, for example by creating a `.env` file containing:

    VOLOPTS=,z


## Further information

- https://docs.openmicroscopy.org/omero/5.5.0/sysadmins/client-server-ssl.html
