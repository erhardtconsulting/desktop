FROM docker.io/library/debian:bookworm@sha256:18023f131f52fc3ea21973cabffe0b216c60b417fd2478e94d9d59981ebba6af

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