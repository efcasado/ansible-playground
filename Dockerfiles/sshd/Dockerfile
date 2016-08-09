###------------------------------------------------------------------------
### File: Dockerfile
###
###------------------------------------------------------------------------
FROM centos:7

## Layers
##-------------------------------------------------------------------------

## Install SSHD
##-------------------------------------------------------------------------
EXPOSE 22

RUN yum install -y        \
        openssh-server    \
        openssh-clients

## Configure SSHD
##-------------------------------------------------------------------------
ADD ./etc/ssh/   /etc/ssh
ADD ./root/.ssh/ /root/.ssh

RUN chmod 700 /root/.ssh   && \
    chmod 600 /root/.ssh/* && \
    echo root:root | chpasswd

RUN touch /var/log/lastlog      && \
    chgrp utmp /var/log/lastlog && \
    chmod 664 /var/log/lastlog

## Install utilities required by Ansible
RUN yum install -y sudo

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
