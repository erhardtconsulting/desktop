FROM docker.io/library/ubuntu:24.04@sha256:278628f08d4979fb9af9ead44277dbc9c92c2465922310916ad0c46ec9999295

# Update apt get
RUN set -eux; \
    apt-get update; \
    apt-get install -y \
      curl \
      dbus \
      dbus-user-session \
      dbus-x11 \
      nano \
      tigervnc-standalone-server \
      tini \
      vim \
      wget; \
    apt-get clean

LABEL org.opencontainers.image.source="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.description="Base desktop with TigerVNC"
LABEL org.opencontainers.image.licenses="MIT"

ENTRYPOINT ["/usr/bin/tini", "--"]