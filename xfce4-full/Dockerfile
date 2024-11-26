FROM ghcr.io/erhardtconsulting/desktop-xfce4:latest@sha256:b33577a0fa8b6d5b5eb5d0732c3ca4b35ee0287060dbfef69021f2e43bf73c1d

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