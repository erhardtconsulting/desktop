FROM docker.io/library/debian:bookworm@sha256:10901ccd8d249047f9761845b4594f121edef079cfd8224edebd9ea726f0a7f6

# Update apt get
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      curl \
      dbus \
      dbus-user-session \
      dbus-x11 \
      extrepo \
      fonts-dejavu-core \
      fonts-freefont-ttf \
      fonts-indic \
      fonts-kacst-one \
      fonts-lao \
      fonts-liberation \
      fonts-lklug-sinhala \
      fonts-noto-cjk-extra \
      fonts-noto-color-emoji \
      fonts-noto-extra \
      fonts-noto-hinted \
      fonts-opensymbol \
      fonts-quicksand \
      fonts-sil-abyssinica \
      fonts-sil-padauk \
      fonts-symbola \
      fonts-thai-tlwg \
      fonts-tibetan-machine \
      nano \
      net-tools \
      openssh-client \
      pavucontrol \
      pavumeter \
      pulseaudio \
      supervisor \
      tigervnc-standalone-server \
      tigervnc-tools \
      tini \
      unzip \
      vim \
      wget \
      zip; \
    apt-get clean

ENV DISPLAY=:0

LABEL org.opencontainers.image.authors="erhardt consulting GmbH"
LABEL org.opencontainers.image.url="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.source="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.description="Base desktop with TigerVNC"
LABEL org.opencontainers.image.licenses="MIT"

ENTRYPOINT ["/usr/bin/tini", "--"]