FROM andus/tinyimage
MAINTAINER Andus Lim <yuncai83@gmail.com>

# Add all files from folder into image
ADD . /

# Expose Postgresql port
EXPOSE 5432

# Add Volumes to allow backup of config, logs and databases
VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Run init script
CMD /init
