FROM ghcr.io/erhardtconsulting/desktop-xfce4:latest

# User root user
USER 0

# Install dependencies
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      git \
      libreoffice; \
    apt-get clean

# Switch back to user
USER 1000