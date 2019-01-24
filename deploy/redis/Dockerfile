FROM workstation_base:latest

ARG USER

ENV SPIN=postgres

USER root

RUN pacman -S --noconfirm redis

USER 1000:1000

ENTRYPOINT redis-cli -u $REDIS_URL
