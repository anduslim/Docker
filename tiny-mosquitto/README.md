tiny-mosquitto
==============

description
-----------
A minimal runtime only docker encapsulation of the mosquitto mqtt broker.

Currently the version of the mosquitto in use is http://mosquitto.org/files/source/mosquitto-1.3.5.tar.gz

This is built using buildroot v14.05 (see http://buildroot.uclibc.org/) in order to make the image small. It has a small size of 20 MB.

The docker image was built with instructions from

http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot/

short instructions 
------------------
(the full instructions are in the buildimage.sh file)

download buildroot 

git clone this repo

copy buildroot config and mosquitto build instructions from git clone to buildroot directory

build root image

touch up root image with docker support (/sbin/init and /etc/resolv.conf)

import image into docker (at this point the image can be tested)

create new image from Dockerfile

enjoy


the image built this way is tiny


> $ docker images

> REPOSITORY              TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

> lapax/tiny-mosquitto      latest              fb9fd82b0c0b        4 minutes ago       6.25 MB
