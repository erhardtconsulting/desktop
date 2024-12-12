FROM ghcr.io/erhardtconsulting/desktop-base:latest@sha256:b46530bc3f05cd721c875de5779deb4e988649ae97b324d9c5ba605747f8078a

# Install xfce4
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      elementary-xfce-icon-theme \
      firefox-esr \
      mousepad \
      ristretto \
      thunar \
      thunar-archive-plugin \
      thunar-media-tags-plugin \
      thunderbird \
      xfce4 \
      xfce4-notifyd \
      xfce4-taskmanager \
      xfce4-terminal; \
    apt-get clean

COPY root /

# Create user
RUN set -ex \
  && adduser --disabled-password --gecos "Desktop User" --home "/home/user" --uid 1000 user

USER 1000

EXPOSE 4713
EXPOSE 5900

LABEL org.opencontainers.image.authors="erhardt consulting GmbH"
LABEL org.opencontainers.image.url="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.source="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.description="Base Xfce4 image"
LABEL org.opencontainers.image.licenses="MIT"

CMD ["/docker-run.sh"]