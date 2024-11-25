# syntax=docker/dockerfile:1
FROM docker.io/library/ubuntu:24.04@sha256:278628f08d4979fb9af9ead44277dbc9c92c2465922310916ad0c46ec9999295

# Update apt get
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    set -eux; \
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
      wget

ENTRYPOINT ["/usr/bin/tini", "--"]