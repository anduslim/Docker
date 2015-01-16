wsn-core
========

description
-----------
This dockerfile setups the development environment for wsn-core.


Dockerfile
----------
Base image in use is Ubuntu 14.04.

Hardware toolchain has been included, with binaries/libraries from AWS S3.

Code is pulled from snsx wsn-core repository.

To build, simply "docker build -t <target> ."


init.sh
-------
An init script is included to setup the SSH key and remote origin url after initial run.

To use script simply "./init.sh".

Do ensure that a docker container is running.


