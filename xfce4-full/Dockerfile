FROM ghcr.io/erhardtconsulting/desktop-xfce4:latest@sha256:b527400471e7a677e18037ce24744b09f7fb8a678f6b39119159dc898b37504f

# User root user
USER 0

# Install dependencies
RUN set -eux; \
    extrepo enable vscodium; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      build-essential \
      codium \
      cups \
      gimp \
      git \
      hplip \
      hplip-gui \
      libreoffice \
      libreoffice-style-elementary \
      openprinting-ppds \
      orage \
      simple-scan \
      vlc \
      xfce4-screenshooter; \
    apt-get clean

# Switch back to user
USER 1000
