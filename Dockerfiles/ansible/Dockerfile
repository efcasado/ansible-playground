###------------------------------------------------------------------------
### File: Dockerfile
###
###
### Author(s):
###   - Enrique Fernandez <efcasado@gmail.com>
###
### Copyright (c) 2016 - Enrique Fernandez
###------------------------------------------------------------------------
FROM centos:7

## Layers
##-------------------------------------------------------------------------

# Install Ansible
RUN yum install -y epel-release && \
    yum install -y                 \
        ansible                    \
        openssh-clients         && \
    yum clean all

# Configure SSH keys
ADD ./root/.ssh/ /root/.ssh/
RUN chmod 700 /root/.ssh/ && \
    chmod 600 /root/.ssh/*
