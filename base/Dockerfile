FROM docker.io/library/ubuntu:24.04@sha256:278628f08d4979fb9af9ead44277dbc9c92c2465922310916ad0c46ec9999295

# Update apt get
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      curl \
      dbus \
      dbus-user-session \
      dbus-x11 \
      fonts-dejavu-core \
      fonts-freefont-ttf \
      fonts-indic \
      fonts-kacst-one \
      fonts-khmeros-core \
      fonts-lao \
      fonts-liberation \
      fonts-lklug-sinhala \
      fonts-noto-cjk-extra \
      fonts-noto-color-emoji \
      fonts-noto-extra \
      fonts-noto-hinted \
      fonts-opensymbol \
      fonts-sil-abyssinica \
      fonts-sil-padauk \
      fonts-symbola \
      fonts-thai-tlwg \
      fonts-tibetan-machine \
      fonts-ubuntu \
      nano \
      pulseaudio \
      supervisor \
      tigervnc-standalone-server \
      tini \
      vim \
      wget; \
    apt-get clean

ENV DISPLAY=:0

LABEL org.opencontainers.image.authors="erhardt consulting GmbH"
LABEL org.opencontainers.image.url="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.source="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.description="Base desktop with TigerVNC"
LABEL org.opencontainers.image.licenses="MIT"

ENTRYPOINT ["/usr/bin/tini", "--"]