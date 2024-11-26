FROM ghcr.io/erhardtconsulting/desktop-base:latest@sha256:b559a1869a0f5e3fd8febf9bb2a398775a14d442c77bfe43e55fdc4f717fa186

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

CMD ["/docker-run.sh"]