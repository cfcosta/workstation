FROM workstation_vscode:latest

ENV SPIN=rust

USER root

RUN pacman -Rs --noconfirm rust \
 && pacman -S --noconfirm rustup \
 && rustup default stable \
 && rustup component add rls rust-analysis rust-src clippy

USER $UID:$GID

RUN rustup default stable

RUN code --install-extension rust-lang.rust
