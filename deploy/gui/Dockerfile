FROM workstation_base:latest

ARG USER

ENV SPIN=gui

USER root

RUN pacman -S gnome-terminal ttf-droid

USER 1000:1000

ENTRYPOINT /usr/bin/gnome-terminal
