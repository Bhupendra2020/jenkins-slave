jenkins-slave
=============

This will create the jenkins slave which can be configured from jenkins master

Pre-requisite
-----

If your host needs to allow connections from a jenkins instance hosted on a different machine, you will need to open up the TCP port. This can be achieved by editing the docker config file and setting (for example)

    DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"

The docker configuration file location will depend your system, but it is likely to be 
    /etc/init/docker.conf, 
    /etc/default/docker or 
    /etc/default/docker.io
    )    

Usage
-----

To create the image `fnubhupen/jenkins-slave`, execute the following command on the fnubhupen/jenkins-slave folder:

    docker build -t fnubhupen/jenkins-slave

run the image and make sure it's working correctly.

    docker run -t -i fnubhupen/jenkins-slave 
    
You can see that the docker container is running using the "docker ps -a" command.

    docker ps -a 
    
This will give you a list of the currently running docker containers, including a unique identifier which will be needed for the next step.

    docker inspect <containerId>  
    docker inspect <containerId> | grep IP
    
The second command shows the virtual IP address of the running container which we can use to test the ssh connection.  If everything is working, you should be able to log into the container using the username and password "jenkins".

    ssh jenkins@172.17.0.2  

If the login is successful, you can also check that the correct version of Java is installed.

    java -version

Congratulations, your Docker cloud is now ready!  The last step is to tell Jenkins to start using it.
