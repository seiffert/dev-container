FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y mercurial
RUN apt-get install -y curl
RUN apt-get install -y strace
RUN apt-get install -y build-essential
RUN apt-get install -y tcpdump
RUN apt-get install -y htop
RUN apt-get install -y tmux
RUN apt-get install -y golang-go
RUN apt-get install -y gccgo
RUN apt-get install -y vim
RUN apt-get install -y vim-nox
RUN apt-get install -y exuberant-ctags
RUN apt-get install -y wget
RUN apt-get install -y ack-grep

# Setup home environment
ENV SHELL /bin/bash
RUN useradd --create-home dev
RUN mkdir -p /home/dev/go /home/dev/bin

ENV GOPATH /home/dev/go

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

COPY .build/dotfiles/* /home/dev/
RUN chown -R dev:dev /home/dev/
USER dev

ENTRYPOINT /bin/bash -l
