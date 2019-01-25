FROM workstation_base:latest

ARG USER
ARG UID
ARG GID

ENV SPIN=postgres

USER root

RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $UID:$GID

RUN yay -S --devel --noconfirm pgcli

USER root

RUN sed -i "/$USER/d" /etc/sudoers

USER $UID:$GID

ENTRYPOINT pgcli -h database -p 5432 -U workstation
