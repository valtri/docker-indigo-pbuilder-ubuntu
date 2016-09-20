# Info

Builder container for Ubuntu 14.04 platform to build packages for [INDIGO-DataCloud project](http://www.indigo-datacloud.eu/).

Container requires privileged mode as it uses pbuilder.

For setup is used a puppet module [CESNET *jenkins\_node*](https://forge.puppet.com/cesnet/jenkins_node) and INDIGO-DataCloud repository version 1 is preconfigured.

# Launch

Update image:

    docker pull valtri/docker-indigo-pbuilder-ubuntu

Launch (from build directory):

    docker run --privileged=true --name indigo_ubuntu --volume `pwd`:/docker:rw valtri/docker-indigo-pbuilder-ubuntu /bin/bash

Example build (replace *${PACKAGE}.dsc*):

    docker exec -u jenkins indigo_ubuntu chown jenkins:jenkins /docker
    docker exec -u jenkins indigo_ubuntu /var/lib/jenkins/scripts/pkg-build-mock -d /docker -p ubuntu-14-x86_64 /docker/${PACKAGE}.dsc

# Tags

* **latest**: Ubuntu 14.04
