FROM ghcr.io/erhardtconsulting/desktop-xfce4:latest@sha256:537d003d6d442e60080ea2b25b2e1a859f50ac0c8275ded91496b3a2c7f202b1

# User root user
USER 0

# Install dependencies
RUN set -eux; \
    extrepo enable vscodium; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      build-essentials \
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