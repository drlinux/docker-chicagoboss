FROM ubuntu:14.10

MAINTAINER Ibrahim Yılmaz (a.k.a dr.linux) <ibrahim@drlinux.org>

# Update Base System

RUN apt-get update
RUN apt-get -y upgrade

# Set Environment Variables

ENV HOME /root

<<<<<<< HEAD
RUN echo 'root:boss123' |chpasswd

#SET
=======
>>>>>>> 799551a4f51f214d4e7bcd42d50b2419a9c9e650
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

<<<<<<< HEAD
=======
RUN apt-get install -y vim openssh-server


RUN mkdir /var/run/sshd

RUN echo 'root:boss123' | chpasswd



>>>>>>> 799551a4f51f214d4e7bcd42d50b2419a9c9e650
RUN make app PROJECT=richercart

WORKDIR /source/richercart/src/controller

RUN wget https://gist.githubusercontent.com/drlinux/5bacb19fac16a579ae15/raw/9940cb384964bb078efad7f0acf50125c102181e/richercart_world_controller.erl 

WORKDIR /source/richercart/priv/static

RUN wget https://gist.githubusercontent.com/drlinux/eef860ddc8f6065d31a4/raw/3ea14d46380b5a5629da2940502e494be0270c55/style.css

RUN wget https://www.dropbox.com/s/xveyzwcgqtenl6b/logo.png?dl=1 -O logo.png

WORKDIR /source/richercart/priv/

RUN rm richercart.routes

RUN wget https://gist.githubusercontent.com/drlinux/a5cb8f907df243d82a42/raw/5379078e0ab12e7b04a4b5e86f2eb140f5f321b4/richercart.routes

RUN mkdir -p /source/richercart/src/view/world 

WORKDIR /source/richercart/src/view/world

RUN wget https://gist.githubusercontent.com/drlinux/9be5ec9069a003c297b0/raw/e04d1207df20852a73d57f64e38e96fd88e5c21f/hello.html

WORKDIR /source/richercart/

RUN make

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8001

VOLUME ["/source/richercart","~/development/richercart"]

CMD ["/source/richercart/init-dev.sh"]


