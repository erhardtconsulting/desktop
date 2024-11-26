FROM ghcr.io/erhardtconsulting/desktop-base:latest@sha256:f26c256dc13453cf283a629e171498985bb18a97af896070518517fac6747584

# Install xfce4
RUN set -eux; \
    extrepo enable vscodium; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      codium \
      elementary-xfce-icon-theme \
      firefox-esr \
      mousepad \
      thunderbird \
      xfce4 \
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