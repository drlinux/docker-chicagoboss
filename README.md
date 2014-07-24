docker-chicagoboss
==================

Dockerfile for creating Chicago Boss framework container. Build and run scripts included.

	$ sudo ./build.sh
	$ sudo ./run.sh


The Dockerfile creating a CB project which named as "richercart". 

Please refer to run.sh file an Docker file more information.

This Dockerfile created for "**Creating a Web App in Erlang with Chicago Boss and Riak from Scratch**" article series that will be published soon in my blog:

http://blog.drlinux.org

ssh user : root
ssh pass : boss123

You may also pull Chicago Boss docker image via docker.io following command:

	$ sudo docker pull drlinux/chicagoboss

##Todo

Implementing [supervisord](http://supervisord.org) or something like that.





