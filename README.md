docker-chicagoboss
==================

Dockerfile for creating Chicago Boss framework container. Build and run scripts included.

	$ sudo ./build.sh
	$ sudo ./run.sh


The Dockerfile creating a CB project which named as "chericart". 

Please refer to run.sh file an Docker file more information.

This Dockerfile created for "**Creating a Web App in Erlang with Chicago Boss and Riak from Scratch**" article series that will be published soon in my blog:

http://blog.drlinux.org

You may use ssh-login script for drop in to container via ssh: 

	$ sudo ./ssh-login.sh
	
That's all, you do not need anything else.

You may also pull Chicago Boss docker image via docker.io following command:

	$ sudo docker pull drlinux/chicagoboss
	
Please contribute, fork and pull requests!

##Todo

~~- Enable to working with volumes / shared directories~~ (see [issue #2](https://github.com/drlinux/docker-chicagoboss/issues/2))


~~- Implementing [supervisord](http://supervisord.org) or something like that.~~ (see [issue #1](https://github.com/drlinux/docker-chicagoboss/issues/1))

