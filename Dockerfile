FROM valtri/docker-puppet-ubuntu:14
MAINTAINER František Dvořák <valtri@civ.zcu.cz>

RUN puppet resource service puppet ensure=stopped enable=false
RUN puppet module install cesnet/jenkins_node

COPY site.pp /root

RUN apt-get update \
&& puppet apply /root/site.pp \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

COPY ./docker-entry.sh /
ENTRYPOINT ["/docker-entry.sh"]
