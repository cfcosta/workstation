FROM workstation_base:latest

ARG USER

USER root

ENV SPIN=javascript

RUN pacman -S --noconfirm nodejs npm code

RUN npm install -g yarn typescript ts-node create-react-app

USER 1000:1000
