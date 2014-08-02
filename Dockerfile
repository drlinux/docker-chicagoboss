FROM 		phusion/baseimage:0.9.12

MAINTAINER 	Ibrahim Yılmaz (a.k.a dr.linux) <ibrahim@drlinux.org>

# Update Base System

RUN 		apt-get update
RUN 		apt-get -y upgrade

# Set Environment Variables

ENV 		HOME /root
# Set Language Environment

RUN 		apt-get install -y language-pack-en

ENV 		LANGUAGE en_US.UTF-8
ENV 		LANG en_US.UTF-8
ENV 		LC_ALL en_US.UTF-8
RUN 		locale-gen en_US.UTF-8
RUN 		dpkg-reconfigure locales
ENV 		DEBIAN_FRONTEND noninteractive

# Install Basic Packages

RUN 		apt-get install -y build-essential software-properties-common

RUN 		apt-get install -y wget curl git man unzip screen


# Install Erlang
WORKDIR 	/tmp

RUN 		wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

RUN 		dpkg -i erlang-solutions_1.0_all.deb 

RUN 		apt-get update 

RUN 		apt-get install -y erlang incron

RUN 		apt-get clean

RUN 		rm -rf /tmp/*

RUN 		mkdir /source
 

# Install Chicago Boss

RUN 		git clone https://github.com/ChicagoBoss/ChicagoBoss.git /source/framework/

WORKDIR 	/source/framework

RUN 		make

RUN 		make app PROJECT=chericart

WORKDIR 	/source/chericart/priv/static

RUN 		wget https://gist.githubusercontent.com/drlinux/eef860ddc8f6065d31a4/raw/3ea14d46380b5a5629da2940502e494be0270c55/style.css -O style.css

RUN 		wget https://www.dropbox.com/s/159gkyobxzwukf6/logo.png?dl=1 -O logo.png

WORKDIR 	/source/chericart/priv

RUN 		rm *.routes

RUN 		touch chericart.routes

RUN 		echo '{"/", [{controller, "world"}, {action, "hello"}]}.' >> chericart.routes

RUN 		mkdir -p /source/chericart/src/view/world 

WORKDIR 	/source/chericart/src/view/world

RUN 		wget https://gist.githubusercontent.com/drlinux/9be5ec9069a003c297b0/raw/e9ec1faa28221e8a1eb8a03a9754e5700cecdd45/hello.html -O hello.html

WORKDIR 	/source/chericart/src/controller

RUN 		wget https://gist.githubusercontent.com/drlinux/d296059b6f65dd04bc4f/raw/e66cf6a718428c1569af368f660bfe0dada8ab49/chericart_world_controller.erl -O chericart_world_controller.erl

WORKDIR 	/source/chericart/

RUN 		make

RUN 		apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN		echo 'root' >> /etc/incron.allow

RUN  		/etc/my_init.d/00_regen_ssh_host_keys.sh

RUN 		/usr/sbin/enable_insecure_key

RUN 		mkdir /etc/service/chicagoboss

ADD 		chicagoboss.sh /etc/service/chicagoboss/run

VOLUME 		/source

EXPOSE 		8001

CMD 		["/sbin/my_init", "--quiet"]
