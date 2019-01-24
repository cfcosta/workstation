FROM workstation_base:latest

ENV SPIN=rust

USER root

RUN pacman -S --noconfirm rustup \
 && rustup default stable \
 && rustup component add rls rust-analysis rust-src clippy

USER 1000:1000

RUN rustup default stable
