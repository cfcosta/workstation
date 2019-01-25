FROM workstation_vscode:latest

ARG USER
ARG UID
ARG GID

USER root

ENV SPIN=javascript

RUN npm install -g yarn ts-node create-react-app tslint javascript-typescript-langserver

USER $UID:$GID

# Update neovim plugins
RUN nvim +PlugInstall +qa \
 && nvim +UpdateRemotePlugins +qa
