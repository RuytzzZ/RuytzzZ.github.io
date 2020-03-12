#build ssh images
#
#VERSION        1.0

FROM ubuntu:18.04
MAINTAINER ruytzzz

RUN     apt-get update \
        &&  apt-get install -y openssh-server \
        &&  mkdir -p /var/run/sshd \
        &&  echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
        &&  mkdir -p /root/.start && echo '#!/bin/bash' > /root/.start/init.sh \
        &&  echo '/usr/sbin/sshd' >> /root/.start/init.sh \
        &&  echo 'bash' >> /root/.start/init.sh \
        &&  chmod 755 /root/.start/init.sh \
        &&  rm -rf /var/lib/apt/lists/* \
        &&  echo root:passwd|chpasswd
        
EXPOSE  22
CMD     ["/root/.start/init.sh"]

 