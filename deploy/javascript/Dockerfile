FROM workstation_vscode:latest

ARG USER

USER root

ENV SPIN=javascript

RUN npm install -g yarn ts-node create-react-app tslint javascript-typescript-langserver

USER 1000:1000

# Update neovim plugins
RUN nvim +PlugInstall +qa \
 && nvim +UpdateRemotePlugins +qa
