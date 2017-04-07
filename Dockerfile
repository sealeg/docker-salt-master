FROM centos:7
MAINTAINER sealeg <https://github.com/sealeg>

COPY saltstack.repo /etc/yum.repos.d/saltstack.repo

RUN yum -y update \
 && yum -y install salt-master \
 && yum -y autoremove \
 && yum -y clean all

EXPOSE 4505 4506

COPY master /etc/salt/master
COPY entrypoint.sh /
RUN  chmod u+x /entrypoint.sh

VOLUME ['/etc/salt/master.d', '/srv/salt', '/etc/salt/pki', '/var/cache/salt']

ENTRYPOINT ["/entrypoint.sh"]
