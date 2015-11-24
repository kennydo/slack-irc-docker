FROM phusion/baseimage:0.9.17
MAINTAINER Kenny Do <chinesedewey@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git npm

# Debian packaging doesn't provide a node binary at /usr/bin/node, so we symlink
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN useradd --uid 1000 -m slackirc

# Update npm
RUN /usr/bin/npm install -g npm

# Install slack-irc inside the slackirc home dir
RUN cd /home/slackirc && \
    git clone -b single-user https://github.com/kennydo/slack-irc.git && \
    cd slack-irc && \
    npm install && \
    npm run build

# Create the runit service for slack-irc
RUN mkdir /etc/service/slack-irc
ADD slack-irc.sh /etc/service/slack-irc/run

# Use the baseimage-docker's init system
CMD ["/sbin/my_init"]
