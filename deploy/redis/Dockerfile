FROM workstation_base:latest

ARG USER
ARG UID
ARG GID

ENV SPIN=postgres

USER root

RUN pacman -S --noconfirm redis

USER $UID:$GID

ENTRYPOINT redis-cli -u $REDIS_URL
