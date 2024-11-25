# syntax=docker/dockerfile:1
FROM ghcr.io/erhardtconsulting/desktop-base:0.0.1@sha256:08a1ad939b17646230f6cd2b70ab9112c2860636d429943c3e8d8d1e224ed4d7

# Install xfce4
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      elementary-xfce-icon-theme \
      xfce4 \
      xfce4-terminal

COPY root /

USER 1000

EXPOSE 5900

CMD ["/docker-run.sh"]