FROM workstation_vscode:latest

ARG USER

USER root

ENV SPIN=javascript

RUN pacman -S --noconfirm nodejs npm

RUN npm install -g yarn typescript ts-node create-react-app tslint

USER 1000:1000
