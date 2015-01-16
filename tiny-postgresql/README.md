tiny-postgresql
==============

A lightweight portable postgresql server built off Buildroot.

init
------

PostgreSQL will refuse to run as root, so we use the default user (conveniently provided by buildroot). 

We create /data to hold PostgreSQL data files, assign it to the non-privileged user. 

We also generate a random password, save it to /pwfile, and display it (to make it easier to retrieve later). 

We can then run initdb to actually create the data files. Then, we extend pg_hba.conf to authorize connections from the network (by default, only local connections are allowed). 

The last step is to actually start the server.

Dockerfile
---------

Base image is from tinyimage.

Then, we add all the files in the current directory to the root of our image. 

This will also inject the Dockerfile itself, but we don’t care. 

We expose TCP port 5432, and finally tell Docker that by default, when a container is created from this image, it should run our /init script. 

setup.sh
--------

Script to automate the creation of our PostgreSQL container, to run our own PostgreSQL-as-a-Service platform.

