FROM workstation_base:latest

ARG USER

ENV SPIN=vscode
ENV VSCODE_HOME="/home/$USER/.config/Code - OSS/User"

USER root

RUN pacman -S --noconfirm code ttf-droid

RUN mkdir -p "$VSCODE_HOME" \
 && chown -R 1000:1000 /home/$USER/.config

USER 1000:1000

RUN code --install-extension dracula-theme.theme-dracula \
 && code --install-extension ms-vscode.vscode-typescript-tslint-plugin \

COPY settings.json $VSCODE_HOME/settings.json
