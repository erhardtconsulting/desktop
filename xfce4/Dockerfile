# syntax=docker/dockerfile:1
FROM ghcr.io/erhardtconsulting/desktop-base:0.0.1@sha256:afdd65666d8cd14faa26edda17ada8f47ab90b73907d69a0c955ed2a082d61d7

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