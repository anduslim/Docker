FROM ubuntu:14.04

MAINTAINER Andus Lim "yuncai83@gmail.com"

ENV WSN_REPO /root/wsn-core

# Install software 
RUN apt-get install -y software-properties-common && \
  apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && \
  apt-get update && \
  apt-get install -y git wget unzip gcc g++ make realpath libssl-dev libz-dev mosquitto python-mosquitto mosquitto-clients libmosquittopp1 libev-dev=1:4.15-3 

# Create new user
RUN useradd -ms /bin/bash guest 

# Copy over private key, and set permissions
ADD repo-key /

# Git related commands to get wsn-core locally
RUN chmod 600 /repo-key && \  
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \  
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \  
  mkdir -p $WSN_REPO && \
  cd $WSN_REPO && \
  git clone git@github.com:snsx/wsn-core.git . && \
  git remote rename origin upstream && \
  rm -rf /repo-key

# Extract hardware toolchain
RUN cd $WSN_REPO && \
  wget https://s3-ap-southeast-1.amazonaws.com/sns-wsn-core-shared-libraries/hardware.tgz -O - | tar xfz -

# Extract other non-SDK binaries
RUN cd $WSN_REPO && \
  wget https://s3-ap-southeast-1.amazonaws.com/sns-wsn-core-shared-libraries/gtest-1.7.0.zip -O temp.zip && unzip temp.zip && rm temp.zip && \
  cd utils/gtest/gtest-1.7.0 && \
  ./configure && \
  make && \
  cp -a include/gtest /usr/include && \
  cp -a lib/.libs/* /usr/lib/ && \
  cd $WSN_REPO && \
  wget https://s3-ap-southeast-1.amazonaws.com/sns-wsn-core-shared-libraries/Mosquitto.tgz -O - | tar xfz - && \
  wget https://s3-ap-southeast-1.amazonaws.com/sns-wsn-core-shared-libraries/security/openSSL.tgz -O - | tar xfz - && \
  wget https://s3-ap-southeast-1.amazonaws.com/sns-wsn-core-shared-libraries/security/SHA2.tgz -O - | tar xfz - && \
  wget https://s3-ap-southeast-1.amazonaws.com/sns-wsn-core-shared-libraries/security/crypto.tgz -O - | tar xfz -

# Change permissions
RUN chown -R guest:guest /home/guest

# Change user
USER guest
  
# Mount Volume
VOLUME $WSN_REPO

WORKDIR $WSN_REPO
