FROM fedora:30
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN dnf install -y -q java java-devel git gradle
# Requires
# - https://github.com/ome/minimal-omero-client/pull/42
# - https://github.com/ome/minimal-omero-client/pull/43
RUN git clone -b pr42+pr43 --depth 1 https://github.com/manics/minimal-omero-client && \
    cd minimal-omero-client && \
    gradle --no-daemon build && \
    cd build/distributions/ && \
    tar xf minimal-omero-client-5.5.0.tar

ENTRYPOINT ["minimal-omero-client/build/distributions/minimal-omero-client-5.5.0/bin/minimal-omero-client"]
