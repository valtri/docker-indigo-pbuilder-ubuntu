# Info

Builder container for Ubuntu 14.04 platform to build packages for [INDIGO-DataCloud project](http://www.indigo-datacloud.eu/).

Container requires privileged mode as it uses pbuilder.

There is used for setup:

* puppet module [CESNET *jenkins\_node*](https://forge.puppet.com/cesnet/jenkins_node)
* INDIGO-DataCloud [build scripts](https://github.com/indigo-dc/jenkins-scripts)
* INDIGO-DataCloud [repository](http://repo.indigo-datacloud.eu/#two) version 1

# Launch

Update image:

    docker pull valtri/docker-indigo-pbuilder-ubuntu

Launch (from build directory):

    docker run -td --privileged=true --name indigo_ubuntu --volume `pwd`:/docker:rw valtri/docker-indigo-pbuilder-ubuntu /bin/bash

Example build (replace *${PACKAGE}.dsc*):

    docker exec indigo_ubuntu chown jenkins:jenkins /docker
    docker exec -u jenkins indigo_ubuntu /var/lib/jenkins/scripts/pkg-build-mock -d /docker -p ubuntu-14-x86_64 /docker/${PACKAGE}.dsc

# Tags

* **latest**: Ubuntu 14.04
