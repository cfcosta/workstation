FROM workstation_base:latest

ARG USER
ARG UID
ARG GID

ENV SPIN=vscode
ENV VSCODE_HOME="/home/$USER/.config/Code - OSS/User"

USER root

RUN pacman -S --noconfirm code ttf-droid

RUN mkdir -p "$VSCODE_HOME" \
 && chown -R $UID:$GID /home/$USER/.config

USER $UID:$GID

RUN code --install-extension dracula-theme.theme-dracula \
 && code --install-extension ms-vscode.vscode-typescript-tslint-plugin \

COPY settings.json $VSCODE_HOME/settings.json
