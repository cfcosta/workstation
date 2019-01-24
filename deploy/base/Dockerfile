# Builder for yay (an AUR wrapper)
FROM archlinux/base:latest as yay_builder
ARG USER
COPY mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Sy --noconfirm go git base-devel
COPY yay /home/$USER/yay
RUN groupadd -g 1000 -r $USER \
 && useradd -ru 1000 -g $USER $USER \
 && mkdir -p /home/$USER \
 && mkdir -p /src \
 && chown -R 1000:1000 /home/$USER /src
USER 1000:1000
WORKDIR /home/$USER/yay
RUN makepkg --noconfirm

# Base Image
FROM archlinux/base:latest

ARG USER

ENV SPIN=base
ENV TERM=xterm-256color

# Add a mirrorlist for brazilian servers
COPY mirrorlist /etc/pacman.d/mirrorlist

# Required dependencies
RUN pacman -Syyu --noconfirm wget zsh shadow curl git wget base-devel libidn readline openssh python python2 ruby python-pip python2-pip rust nodejs npm

# Utils
RUN pacman -S --noconfirm neovim exa fd bat skim ripgrep tmux jq

RUN npm install -g neovim typescript

# Dependencies for aurutils
RUN pacman -S --noconfirm jq expac diffstat pacutils parallel

# Dependencies for neovim
RUN pip2 install pynvim neovim \
 && pip3 install pynvim neovim \
 && gem install neovim

COPY --from=yay_builder /home/$USER/yay/yay-9.1.0-1-x86_64.pkg.tar.xz /tmp/yay-9.1.0-1-x86_64.pkg.tar.xz

RUN pacman -U --noconfirm /tmp/yay-9.1.0-1-x86_64.pkg.tar.xz \
 && rm /tmp/*.pkg.tar.xz

RUN groupadd -g 1000 -r $(echo -n $USER | sed 's/\.//g') \
 && mkdir -p /home/$USER/.config/nvim \
 && mkdir -p /src \
 && useradd -ru 1000 -g $(echo -n $USER | sed 's/\.//g') $USER \
 && chown -R 1000:1000 /home/$USER /src \
 && chmod -R g+s /home/$USER

USER 1000:1000

RUN mkdir -p /home/$USER/.bin \
 && cd /tmp && wget https://github.com/watchexec/watchexec/releases/download/1.9.2/watchexec-1.9.2-i686-unknown-linux-musl.tar.gz \
 && tar -xf watchexec-1.9.2-i686-unknown-linux-musl.tar.gz \
 && cp watchexec-1.9.2-i686-unknown-linux-musl/watchexec /home/$USER/.bin/watchexec \
 && chmod +x /home/$USER/.bin/watchexec \
 && rm -rf /tmp/watchexec*

WORKDIR /src

ENV PATH=/home/$USER/.bin:$PATH

COPY custom.zsh /home/$USER/custom.zsh
COPY init.vim /home/$USER/.config/nvim/init.vim

RUN mkdir -p /home/$USER/.config/nvim/autoload \
 && wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O /home/$USER/.config/nvim/autoload/plug.vim \
 && nvim +PlugInstall +qa \
 && nvim +UpdateRemotePlugins +qa

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true \
 && echo "source ~/custom.zsh" >> /home/$USER/.zshrc

ENTRYPOINT /bin/zsh
