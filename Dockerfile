FROM ruby:2.5.0-stretch
MAINTAINER Robby Thompson <robsdudeson@gmail.com>

### Auxilary programs ###
RUN apt-get update -qq
RUN apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  wait-for-it \
  curl \
  git \
  gitg \
  nano \
  software-properties-common \
  zip \
  unzip
RUN rm -rf /var/lib/apt/lists/*

### New user "develop" ###
RUN useradd -p "" -ms /bin/bash developer
ENV HOME /home/developer

USER developer

### Workdir definition ###
WORKDIR $HOME

###### Rails installation  ######
RUN gem install rails

### Expose port 3000 ###
EXPOSE 3000
