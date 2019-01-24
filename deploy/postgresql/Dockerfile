FROM workstation_base:latest

ARG USER

ENV SPIN=postgres

USER root

RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER 1000:1000

RUN yay -S --devel --noconfirm pgcli

ENTRYPOINT pgcli -h database -p 5432 -U workstation
