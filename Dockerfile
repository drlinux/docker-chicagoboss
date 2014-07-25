FROM ubuntu:14.10

MAINTAINER Ibrahim Yılmaz (a.k.a dr.linux) <ibrahim@drlinux.org>

# Update Base System

RUN apt-get update
RUN apt-get -y upgrade

# Set Environment Variables

ENV HOME /root
# Set Language Environment

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
ENV DEBIAN_FRONTEND noninteractive

# Install Basic Packages

RUN apt-get install -y build-essential software-properties-common

RUN apt-get install -y wget curl git man unzip screen


# Install Erlang
WORKDIR /tmp

RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

RUN dpkg -i erlang-solutions_1.0_all.deb 

RUN apt-get update 

RUN apt-get install -y erlang

RUN apt-get clean

RUN rm -rf /tmp/*

RUN mkdir /source
 

# Install Chicago Boss

RUN git clone https://github.com/ChicagoBoss/ChicagoBoss.git /source/framework/

WORKDIR /source/framework

RUN make

RUN make app PROJECT=chericart

WORKDIR /source/chericart/src/controller

RUN wget https://www.dropbox.com/s/f54wzshkns5cllt/chericart_world_controller.erl?dl=1 -O chericart_world_controller.erl 

WORKDIR /source/chericart/priv/static

RUN wget https://www.dropbox.com/s/f9phqdh57jtmck0/style.css?dl=1 -O style.css

RUN wget https://www.dropbox.com/s/159gkyobxzwukf6/logo.png?dl=1 -O logo.png

WORKDIR /source/chericart/priv/

RUN rm chericart.routes

RUN wget https://www.dropbox.com/s/e3dgozs1dx3fmo4/chericart.routes?dl=1 -O chericart.routes

RUN mkdir -p /source/chericart/src/view/world 

WORKDIR /source/chericart/src/view/world

RUN wget https://www.dropbox.com/s/x6jdhd82et7rs34/hello.html?dl=1 -O hello.html

WORKDIR /source/chericart/

RUN make

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8001

VOLUME ["/source/chericart","~/development/chericart"]

CMD ["/source/chericart/init-dev.sh"]


