FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    mercurial \
    curl \
    strace \
    build-essential \
    tcpdump \
    htop \
    tmux \
    golang-go \
    gccgo \
    vim \
    exuberant-ctags \
    wget \
    ack-grep

# Setup home environment
ENV SHELL /bin/bash
RUN useradd --create-home dev
RUN mkdir -p /home/dev/go /home/dev/bin

ENV GOPATH /home/dev/go:$GOPATH

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:dev /var/shared
VOLUME /var/shared

WORKDIR /home/dev
ENV HOME /home/dev

# Link in shared parts of the home directory
RUN ln -s /var/shared/.ssh

USER dev

# Install both homeshick and my dotfiles
COPY .build/homeshick /home/dev/.homesick/repos/homeshick
COPY .build/denderello-dotfiles /home/dev/.homesick/repos/dotfiles
RUN printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bash_profile

# Dirty trick to link my dotfiles over the 
RUN /bin/bash -l -c "yes | homeshick link dotfiles"

ENTRYPOINT /bin/bash -l -c "tmux"
