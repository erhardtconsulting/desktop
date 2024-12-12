FROM ghcr.io/erhardtconsulting/desktop-xfce4:latest@sha256:680291796238a9fa6e0dfcffbb1c2c729a20e63e059356d6ba5d1d476c8c80d3

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
