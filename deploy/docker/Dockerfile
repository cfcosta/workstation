FROM workstation_vscode:latest

USER root

ENV SPIN=docker

RUN pacman -S --noconfirm docker

COPY ./deploy/docker/entrypoint.sh /entrypoint.sh

ARG USER

RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY . /home/$USER/.workstation

RUN usermod -a -G docker $USER \
 && chmod +x /entrypoint.sh \
 && chown -R 1000:1000 /home/$USER/.workstation

USER 1000:1000

RUN ln -s /home/$USER/.workstation/bin/workstation /home/$USER/.bin/workstation \
 && chmod +x /home/$USER/.bin/workstation

RUN cd /home/$USER/.bin \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x kubectl \
 && cd -

ENTRYPOINT /entrypoint.sh
