FROM ghcr.io/erhardtconsulting/desktop-base:latest@sha256:07205533ac541acc99b70f375c4b873ab0385bf0ed28249760b6caa2727c62a1

# Install xfce4
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      elementary-xfce-icon-theme \
      xfce4 \
      xfce4-terminal; \
    apt-get clean

COPY root /

USER 1000

EXPOSE 5900

LABEL org.opencontainers.image.source="https://github.com/erhardtconsulting/desktop"
LABEL org.opencontainers.image.description="Base Xfce4 image"
LABEL org.opencontainers.image.licenses="MIT"

CMD ["/docker-run.sh"]