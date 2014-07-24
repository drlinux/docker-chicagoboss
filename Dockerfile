FROM ubuntu:14.10
MAINTAINER Ibrahim Yılmaz (a.k.a dr.linux) <ibrahim@drlinux.org>

# Update Base System

RUN apt-get update
RUN apt-get -y upgrade

# Set Environment Variables

ENV HOME /root

#SET
# Set Language Environment

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

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

RUN apt-get install -y vim openssh-server


RUN mkdir /var/run/sshd

RUN echo 'root:boss123' |chpasswd



RUN make app PROJECT=richercart

WORKDIR /source/richercart/

EXPOSE 8001 22

CMD ["/usr/sbin/sshd", "-D"]
CMD ["/source/richercart/init-dev.sh"]
