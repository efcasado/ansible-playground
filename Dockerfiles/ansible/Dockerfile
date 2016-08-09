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
    yum install -y ansible      && \
    yum clean all
#RUN yum update -y  && \
#    yum install -y    \
#        asciidoc      \
#        git           \
#        make          \
#        python2-devel \
#        rpm-build     \
#        which      && \
#    git clone https://github.com/ansible/ansible --recursive && \
#    cd ansible     && \
#    make rpm       && \
#    rpm -Uvh ./rpm-build/ansible-*.noarch.rpm

# Configure SSH keys
ADD ./root/.ssh/ /root/.ssh/
RUN chmod 700 /root/.ssh/ && \
    chmod 600 /root/.ssh/*
