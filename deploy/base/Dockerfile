FROM archlinux/base:latest

ARG USER

ENV SPIN=base
ENV TERM=xterm-256color

# Add a mirrorlist for brazilian servers
COPY mirrorlist /etc/pacman.d/mirrorlist

# Required dependencies
RUN pacman -Syyu --noconfirm wget zsh shadow curl git wget base-devel

# Utils
RUN pacman -S --noconfirm neovim exa fd bat skim ripgrep tmux

RUN groupadd -g 1000 -r $USER \
 && useradd -ru 1000 -g $USER $USER \
 && mkdir -p /home/$USER \
 && mkdir -p /src \
 && chown -R 1000:1000 /home/$USER /src

WORKDIR /src

USER 1000:1000

ENV PATH=~/.bin:$PATH

COPY custom.zsh /home/$USER/custom.zsh

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true \
 && echo "source ~/custom.zsh" >> /home/$USER/.zshrc \
 && mkdir ~/.bin

ENTRYPOINT /bin/zsh
