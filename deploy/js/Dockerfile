FROM workstation_base:latest

ARG USER

USER root

ENV SPIN=javascript

RUN pacman -S --noconfirm nodejs npm \
 && npm install -g yarn typescript ts-node create-react-app

USER 1000:1000
