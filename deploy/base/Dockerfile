# Builder for yay (an AUR wrapper)
FROM archlinux/base:latest as yay_builder
ARG USER
COPY mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Sy --noconfirm go git
RUN groupadd -g 1000 -r $USER \
 && useradd -ru 1000 -g $USER $USER \
 && mkdir -p /home/$USER \
 && mkdir -p /src \
 && chown -R 1000:1000 /home/$USER /src
RUN pacman -S --noconfirm base-devel
USER 1000:1000
RUN cd && git clone https://aur.archlinux.org/yay.git \
 && cd yay \
 && makepkg --noconfirm

# Base Image
FROM archlinux/base:latest

ARG USER

ENV SPIN=base
ENV TERM=xterm-256color

# Add a mirrorlist for brazilian servers
COPY mirrorlist /etc/pacman.d/mirrorlist

# Required dependencies
RUN pacman -Syyu --noconfirm wget zsh shadow curl git wget base-devel

# Utils
RUN pacman -S --noconfirm neovim exa fd bat skim ripgrep tmux jq

# Dependencies for aurutils
RUN pacman -S --noconfirm jq expac diffstat pacutils parallel

COPY --from=yay_builder /home/$USER/yay/yay-9.1.0-1-x86_64.pkg.tar.xz /tmp/yay-9.1.0-1-x86_64.pkg.tar.xz

RUN pacman -U --noconfirm /tmp/yay-9.1.0-1-x86_64.pkg.tar.xz \
 && rm /tmp/*.pkg.tar.xz

RUN groupadd -g 1000 -r $USER \
 && useradd -ru 1000 -g $USER $USER \
 && mkdir -p /home/$USER \
 && mkdir -p /src \
 && chown -R 1000:1000 /home/$USER /src

USER 1000:1000

RUN mkdir -p /home/$USER/.bin \
 && cd /tmp && wget https://github.com/watchexec/watchexec/releases/download/1.9.2/watchexec-1.9.2-i686-unknown-linux-musl.tar.gz \
 && tar -xf watchexec-1.9.2-i686-unknown-linux-musl.tar.gz \
 && cp watchexec-1.9.2-i686-unknown-linux-musl/watchexec /home/$USER/.bin/watchexec \
 && chmod +x /home/$USER/.bin/watchexec \
 && rm -rf /tmp/watchexec*

WORKDIR /src

ENV PATH=~/.bin:$PATH

COPY custom.zsh /home/$USER/custom.zsh

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true \
 && echo "source ~/custom.zsh" >> /home/$USER/.zshrc

ENTRYPOINT /bin/zsh
