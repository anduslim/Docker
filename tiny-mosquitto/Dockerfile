# minimal image to support just the runtime for mosquitto
# file is using http://mosquitto.org/files/source/mosquitto-1.2.3.tar.gz
# built using buildroot following instructions from
# http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot
FROM tinyimage
MAINTAINER Lex Lapax <lexlapax@gmail.com>


ADD mosquitto.conf /etc/mosquitto/test.conf

#VOLUME ["/"]

EXPOSE 1884
ENTRYPOINT ["/usr/sbin/mosquitto"]
CMD ["-c","/etc/mosquitto/test.conf"]

