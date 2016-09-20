# Info

Builder container for Ubuntu 14.04 platform to build packages for [INDIGO-DataCloud project](http://www.indigo-datacloud.eu/).

Container requires privileged mode as it uses pbuilder.

For setup is used a puppet module [CESNET *jenkins\_node*](https://forge.puppet.com/cesnet/jenkins_node) and INDIGO-DataCloud repository version 1 is preconfigured.

# Launch

Update image:

    docker pull valtri/docker-indigo-pbuilder-ubuntu

Launch:

    docker run -it --privileged=true --name builder valtri/docker-indigo-pbuilder-ubuntu

# Tags

* **latest**: Ubuntu 14.04
