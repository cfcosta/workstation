FROM workstation_base:latest

ARG USER
ARG UID
ARG GID

ENV SPIN=gui

USER root

RUN pacman -S gnome-terminal ttf-droid

USER $UID:$GID

ENTRYPOINT /usr/bin/gnome-terminal
